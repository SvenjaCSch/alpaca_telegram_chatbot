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
