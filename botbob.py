import tempfile
from termcolor import cprint
from telegram.constants import ChatAction
from telegram import Update
from telegram.ext import filters, MessageHandler, ApplicationBuilder, CommandHandler, ContextTypes
from llama_cpp import Llama
import pyttsx3
from pydub import AudioSegment
from pathlib import Path
import speech_recognition as sr
from pydub.utils import which
AudioSegment.converter = which("ffmpeg")


r = sr.Recognizer()
TOKEN = "<YOUR API>"
MODEL= "...models/ggml-alpaca-enh-7b-q5_1.bin"
llama = Llama(model_path=MODEL)
PROMPT_LINK = ".../prompts/telegram/bob_english_instruction.txt"

with open(PROMPT_LINK) as f:
    lines = f.read()

PROMPT_TEMPLATE = lines
cprint("You can start now\n", "red", attrs=["bold"])


async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await context.bot.send_message(chat_id=update.effective_chat.id, text="I'm a bot, please talk to me!")

async def generate_chat_response(prompt, suffix, text_input, context):
    text_output = ""
    to_safe =f"<{prompt} {suffix}\nBob:"
    to_use = f"<{prompt} {suffix}\n Respose\nBob:"
    try:
        tokens = llama.create_completion(to_use, max_tokens=240, top_p=0.98, stop=["</s>"], stream=True)
        response = []
        for token in tokens:
            text = token["choices"][0]["text"]
            if not token["choices"][0]["finish_reason"]:
                response.append(text)
                text_output = ''.join(response)
        await context.bot.editMessageText(text=text_output, chat_id=text_input.chat_id, message_id=text_input.message_id)
        await save_text(to_safe, text_output)
        if not response:
            await context.bot.editMessageText(text='Sorry, I am went blank. Would you rephrase you sentence?', chat_id=text_input.chat_id, message_id=text_input.message_id)
    except Exception as e:
        await context.bot.editMessageText(text='Hups, I am very confused. Maybe let\'s talk about something else.', chat_id=text_input.chat_id, message_id=text_input.message_id)
        pass


async def save_text(input, output):
    new_input = f"{input} {output}\nUser:"
    global PROMPT_TEMPLATE
    PROMPT_TEMPLATE = new_input
    cprint(PROMPT_TEMPLATE, "green")

async def generate_voice_response(response):
    engine = pyttsx3.init()
    engine.say(response)
    engine.runAndWait()

async def handle_voice_message(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    voice = update.message.voice
    with tempfile.TemporaryDirectory() as tmp_dir:
        tmp_dir = Path(tmp_dir)
        voice_ogg_path = tmp_dir / "voice.ogg"
        voice_file = await context.bot.get_file(voice.file_id)
        await voice_file.download_to_drive(voice_ogg_path)
        voice_wav_path = tmp_dir / "voice.wav"
        wav = AudioSegment.from_file(voice_ogg_path).export(voice_wav_path, format="wav")

        with sr.AudioFile(wav) as source:
            audiodata = r.record(source)

            text = r.recognize_google(audiodata, language="english")
            await update.message.reply_text(f"you said: {text}")
            await update.message.chat.send_action(action=ChatAction.TYPING)

            temp = await update.message.reply_text("...")
            await generate_chat_response(PROMPT_TEMPLATE, suffix = voice, text_input=temp, context=context)



async def handle_message(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    text_input = update.message.text
    await update.message.chat.send_action(action=ChatAction.TYPING)
    temp = await update.message.reply_text("...")
    await generate_chat_response(PROMPT_TEMPLATE, suffix = text_input, text_input=temp, context=context)


if __name__ == '__main__':
    application = ApplicationBuilder().token(TOKEN).build()

    start_handler = CommandHandler('start', start)
    text_message_handler = MessageHandler(filters.TEXT & (~filters.COMMAND), handle_message)
    voice_message_handler = MessageHandler(filters.VOICE, handle_voice_message)

    application.add_handler(start_handler)
    application.add_handler(text_message_handler)
    application.add_handler(voice_message_handler)

    application.run_polling()
