# alpaca_telegram_chatbot study project
Creating a telegram chatbot responding via Alpaca LLM to have a assistant acting in a friendly manner
uses the chat history as prompt

Different prompt can be used to maximes the best answer of bob. To find the best prompt, a evaluation should take place. 
Bob can act as a friend in a varienty of scenarios, e.g. Lost, Scared, Bored, Curious ...
The different scenario wil be tested. 

For the functionality of the chatbot, a API-key for the telegram bot is requiered as well as a alpaca llama model.

The prompt has to be in that order:
1) General Information
2) Instruction
3) Example (optional)
4) Dialog

During the chating with the bot, the prompt will be extended with the conversation between the User and the Bot Bob. The prompt can be changed via changing the general information, the instruction or by adding an example.

For the testing we will use following approaches:
1) 3 different scenarios
2) using the term friend or assistant for the bot in the introduction of the prompt
3) using a male (Bob), Female (Liza) or unisex (Peyton) name for the bot
4) using no example or 2 different examples according to the findings about the communication in such szenarios
At the end it is also been tests whether the choosen prompt also works with voicemessage (same results, similar results, different results)
That procedure will lead to 2 x 3 x 3 = 18  different prompts and in total to 3 * 18 +1 = 55 tests
