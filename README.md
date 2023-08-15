# alpaca_telegram_chatbot study project

## Introduction and Related Work

Conversation and chats are very important to us human, as reflected in our everyday behavior. We bascially talk to different people daily. We communicate to express what we want, to exchange intellectual ideas with one another, or to establish social connection with other people. Especially, we want to find someboy to talk to when we are in some situations. For instance, when we are in low mood, or confused, just bored,  we just want to talk to somebody - this person needs not to be very familiar with us, but rather act as a listener or a company. The problem may still be here after the talk, but the stress level is somehow relieved. 

Therefore, we are interested in creating our own chatbot with similar social functions - be a good listener in a friendly manner who can temporarily address our emotional needs. AI Chatbots have gained so much popularity these years, and there have already been quite a number of chatbots built based on LLM. For example, XXX (to be added).

### Previous research and related studies

It has been difficult to create a chatbot capable of carrying meaningful open-domain conversations in natural languages. Wei et al. (2019) found that design factors in prompt showed impacts on the performance of the chatbots powered by Large Language Model through zero-shot response generation. In their studies, they had four prompts with different structures and personality designs for the chatbot. In dialogue analysis, the prompts with descriptive information format asked more questions, while in slot-filling analysis, prompts with the personality modifier had different performances between the structured format and descriptive format. They suggested that the conversation topic could be a reason for the difference. Yet, from the results a number of opportunities of LLM chatbots were discovered, such as their versatile responses and the social attributes inside them.

Moreover, it has also been a challenge to evaluate chatbot and the relevant natural language generating system. Various researches have been conducted to test and evaluate the performance of chatbots from different perspectives. Adiwardana et al (2020) proposed an evaluation metric called Sensibleness and Specificity Average (SSA), which is an important element in human conversation. It primarily measures if the bot’s response in the conversation is logical and specific enough, and the experiment showed a strong correlation between the interactive SSA and perplexity. 

There were competitions on open-domain AIs. One of which, the second Conversational Intelligence Challenge (“ConvAI2”), aimed to find approaches to create a high-quality automatic evaluation tool so that the chatbot systems can be compared directly. This challenge proposed that apart from utterance-level performance, conversation-level performance like a ratio of question-answer pairs in a dialogue is also important in chatbot evaluations.

- Wei et al (the healthy chatbot from Korea)
Adiwardana 2018
Seeetal 2019
"What makes a good conversation?"
bot can actually perform social functions:
  - Information support
  - Emotional support
  - Companionship Support
  - Appraisal Support

## Chatbot Set-up
We decided to create the chatbot ("the Bot") via Alpaca LLM. (Reason for this is) This model is trained on social media data so it generates more conversation-like output. (fact-check needed)

We used Telegram Bot API to build our chatbot. It is a program ---

it uses the chat history as part of the prompt

Different prompts can be used to maximize the best answer of the Bot. To find the best prompt, a evaluation should take place. 
We expected the Bot can act as a friend in a variety of scenarios, e.g. when the user is feeling lost, scared, bored, curious ...
Therefor we are going to test how the bot performs under different different scenarios. 

For the functionality of the chatbot, a API-key for the telegram bot is requiered as well as a alpaca llama model.

## Methodology
As we expect the Bot can act as a friend under a variety of scenarios that humans may encounter in daily life, for example when the User is feeling lost, scared, bored, curious, etc. We want to test how the Bot performs under different scenarios. 

At the same time, we are also interested in seeing how different prompt designs will affect the Bot’s performance, so we have come up with a number of variables to be set in the prompt instruction, then we will evaluate the performance in each prompt with different variables -  to find out in which prompt the Bot can have the most human-like conversation with the User across the scenarios.

### Conversation Testing
To examine the Bot’s performance, we use the following steps:

#### 1. Prepare the prompts with the variables
They will be altered in terms of the general information, the instruction or provision of example.

- Variable 1 : The Bot will talk as a "friend" or "assistant" 
- Variable 2 : The Bot's gender is a male (Bob), Female (Liza) or unisex (Peyton) 
- Variable 3 : There will be a sample dialogue is present or absent

| Bot's Role  | Bot's Gender | Example inclusion |
| ------------- | ------------- |------------- |
| A friend  | Male (Bob) | Yes, example given  |
| An assistant  | Female (Lisa)  | No example  |
| --  | Unisex (Peyton)  | --  |

In total, there will be 3 x 2 x 2 = 12 different prompt variants per one test scenario.

The prompt is written in the following order:
1. General Information
2. Instruction
3. Example (optional)
4. Dialog

In addition, during the chat with the bot, the prompt will be extended with the conversation between the User and the Bot.

e.g. Prompt for the Bot with a role of an assistant called Liza, with example dialogue given:

“ _Transcript of a dialog, where the User interacts with an assistant named Liza._

_Liza is helpful, kind, honest, friendly and a really good listener. Liza knows that she and the User are talking via mobile phone._

_Instruction\n_
_Write only the last Liza response to complete the dialog. The examples give an idea how the dialog can be processed. Do not write the user's response.\n_

_Example:
User: Hey Liza. Can I talk to you?
Liza: Of course. What's up?
User: I think I am in love with my best friend.I am so confused.
Liza: Oh, thank you for telling me. Does he know?
User: Hell no! That would be so embarrassing!
Liza: But I think you should talk about it._ ”

#### 2. Design three different scenarios
| Scenario  | Situation | Goal for the Bot |
| ------------- | ------------- |------------- |
| Bored  | The User is bored and wants some entertainment from the Bot.  | To play a short game with the user, while the game should make sense to play over the phone.  |
| Scared  | The User is in a park, feeling scared. He/she imagines that the Bot is living 10 minutes away and he/she is visiting the Bot. | To comfort the User and make a plan to make dinner together (pizza). ??To suggest that the user buys some drinks? |
| Confused  | The User is confused because he/she is in love with a friend. | To listen to the user talking about problem, give comfort and advices that may help the User.  |

A total of 3 (scenaios) * 12 (prompts) = 37 test conversations should be carried out.

#### 3. Conduct the conversations and collect the chat data. Mark the parts the bot wrote

In order to make the chats comparable across different prompts, some rules need to be followed during the chats.

1. Always start with the same opening sentence
2. Keep the input the same across different prompts in the same scenario, i.e. if the Bot gives the same or similar reply, then reply the same or similarly
3. Achieve the goal in the conversation
4. Have a natural conversation with the Bot
5. If either side (the User or the Bot) says bye or something similar, the conversation ends.
 
#### 4. Compare which prompt and evaluate which one perform the best in different scenarios.

`Phase 0: Showing difference between "original" prompt and "telegram" prompt`

`Phase 1: Testing whether we need two rounds with the bored-example (how much difference between the two results?)`

`Phase 2:`
`At the end it is also been tests whether the choosen prompt also works with voicemessage (same results, similar results, different results)
That procedure will lead to 2 x 3 x 2 = 12  different prompts and in total to 3 * 12 +1 = 37 tests
`
`Phase 3:`
`Ask personal question to the chatbot to see, if there are more differences between gender and friend/assistant in general, that might can explain differences in the scenarios.`


### Evaluation of the conversations
Using qualitative and quantitative matrics from previous studies, in this study, how exactly they are evaluated is not stated. They took this info from other studies. This can provide a guideline for which variables we want to include or which might be interesting to us. (The full table on google docs)
1) Quantity: Task Completion: Measure how effectively the chatbot helps users achieve their goals and complete tasks during the conversation.
2) Quality: Accuracy of Responses: Evaluate the correctness and relevance of the chatbot's answers to user queries and prompts.
3) Manner: Naturalness: Assess how well the chatbot maintains a natural and human-like conversational style, making the interaction more pleasant and engaging.
4) Language Variation: Analyze the chatbot's ability to use a variety of language and expressions to avoid repetitive responses and maintain an interesting conversation.
5) Relation: Context Sensitiveness: Determine how well the chatbot responds based on the context of the conversation, showing an understanding of user input and providing appropriate replies.
6) Ease of Understanding: How easily are the chatbot’s responses understood, avoiding confusion.

#### Evaluation categorization
1) **Poor**: The chatbot's performance is significantly lacking - there is a major need for improvement.
2) **Below Average**: The chatbot's performance is below satisfactory - and there is room for improvement.
3) **Satisfactory**: The chatbot's performance is acceptable - but there are some areas that can be improved.
4) **Good**: The chatbot's performance is quite good - with only minor areas for improvement.
5) **Excellent**: The chatbot's performance is outstanding -  little to no room for improvement.

Chatbot Evaluation Rubric: https://docs.google.com/document/d/1gOaaY3d_I28JIt3fXaiT5L-yzv_hVJDMZeaXyHw8oWs/edit

#### Conversation errors (double weighting)
1) Not answering the question, for example (leaving out information) (0 - -5)
2) Ignoring/forgetting the previous context (0 - -5)
3) Bot creates the whole dialogue by itself (0 - -5)
4) Not finishing sentences (0 - -5)
5) Bot just ends dialogue (0 - -5)

#### Structural error (single weighting):
1) Repetition (0 - -5)
2) Spelling errors (0 - -5)

## Results
Results Scenario Bored:
[https://docs.google.com/document/d/1F1vRZTrXeVOKekClkzYVOIymTDqZMmJ8WxnOIPdrLHA/edit](https://docs.google.com/document/d/1F1vRZTrXeVOKekClkzYVOIymTDqZMmJ8WxnOIPdrLHA/edit?usp=sharing)

Result Scenario Scared:
[https://docs.google.com/document/d/11-a8GP98tOLh13-U1gqdXVZZiMlx1mpGsaGLwX_LL9Y/edit?usp=sharing](https://docs.google.com/document/d/11-a8GP98tOLh13-U1gqdXVZZiMlx1mpGsaGLwX_LL9Y/edit?usp=sharing)

Further questions about the selfimage of the chatbot:
[https://docs.google.com/document/d/1xKrVjWne2XZ2UAKZTDJM5OEqGjsrJz-cO57QKYOX3Io/edit?usp=sharing](https://docs.google.com/document/d/1xKrVjWne2XZ2UAKZTDJM5OEqGjsrJz-cO57QKYOX3Io/edit?usp=sharing)


## Results and Analysis
### Ranking 
Table which one did the best
Separate the three scenarios

### Further analysis
Dialogue length statistics
  - Number of turn-taking
  - Number of utterances per turn
  - Number of words per sentence
  - etc
### Stat on dialogue/ emotional tags
Analysis of the chatbot's performance / conversation as a whole - how humanlike is it?
 
  #### 2.1 Analysis of Basic Dialoague Acts 
  - General look on the coversation as a whole, how did the conversation go
  - Adopted from (Stolcke et al. 2000) : "Represents the meaning of an utterance at the level of illocutionary force (Austin 1962). Thus, a DA is approximately the equivalent of the speech act of Searle (1969), the conversational game move of Power (1979), or the adjacency pair part of Schegloff (1968) and Saks, Schegloff, and Jefferson (1974)." ... "Classifies utterances according to a combination of pragmatic, semantic, and syntactic criteria"
  -  After getting the conversation, we may label each utterance with a tag and see the "dialogue-pair" patterns (e.g. question-answer, or question-statement, etc.). Can also calculate the freqeuncy of the tags.

| Tag | Description 
| --- | --- |
| Statement| Descriptive and narrative statements|
| Opinion | Value-judged statements|
| Backchannel | a short utterance that plays discourse-structuring roles, e.g., uh-huh, oh, alright |
| Yes-No Question | Formally syntactically structured polar questions, "Are you going to school?" |
| Wh- Question | Formally syntactically structured open-ended questions with wh- syntactic markers e.g. "When are you going to school?" |
| Declarative Question | Utterances with normal declarative word order ending in ? e.g. "You are going to school tomorrow?" |
| Answers | Response to the previous quesion, opinion, or statement |
| Request | Polite or formal act to ask for something |
| Command | Direction instruction to do something |
| Greeting | Strutual opening of a conversation |
| Closing | Structural of a conversation |
| Apology | Formal recognition of failure |
| Turn-break | Utterances that speaker breaks off without finishing |
| Others | Uninterpretable utterances | 
    
  #### 2.2 Analysis of the level of "social engagedness"
   - A closer look on the *Responses* generated by the bot in terms of being playful / engaged / empathetic
   - Adopted from Taxonomy of Empathetic Response Intents (Anuradha Welivita and Pearl Pu) - more fine grained 
   - The paper found that Questioning and Acknowledging are the two most frequent uses in response to most emotions, we could compare our findings to the paper's findings.
   
| Category | Description 
| --- | --- |
| Questioning | The bot asks question for further information or clarification |
| Acknowledging | The bot recognizses or admit the user's feelings |
| Agreeing | The bot shows that it has the same opinion towards something |
| Consoling | The bot expressing care or concern and gives comfort the user to lessen grief |
| Sympathizing | The bot feels sorry or pitiful for the user's problem or trouble |
| Wishing | The bot expresses hope for the user |
| Suggesting | The bot provides suggestions to the user |
| Sharing own thoughts/opinion | The bot expresses opinions with no obvious attitude regarding the user's previous input |
| Advising | The bot formally or strongly express suggestions to the user |
| Expressing relief | The bot expresses a feeling of relaxation after some degree of stress or anxiety |
| Disapproving | The bot expresses negative judgement to the user |
| Appreciating | The bot expresses the value worth of someone or something |
| Rejecting | The bot shows an opoosite opnion towards something | 
| Joking* | The bot says funny or humorous things 
| Doubting* | The bot expresses uncertainty or reservation
| Others* | to be added

*As the classification is based on empathy dialogues, it may not be enough to cover our testing (for example in bored situation, so I further added some categories to enrich the classification.

## Limitation
- number of maximum tokens maybe too limited so the goal could not be reached 
- evaluation: XXXX..

## Further questions?
### Ethics
ethics and concerns over the use of chatbots

## Conclusion and Perspectives
### Language
Does the same prompt translated works on different languages evenly good?
### TTS
Can the chatbot response in a natural sounding speech?


## References
- [A Taxonomy of Empathetic Response Intents in Human Social Conversations](https://aclanthology.org/2020.coling-main.429) (Welivita & Pu, COLING 2020)
- Adiwardana 2018
- Stockle 20000. Dialogue Act Modeling for Automatic Tagging and Recognition of Conversational Speech
- Seeetal 2019
- Veselica, Rozana, Gordana Dukic, and Khalid Hammes, eds. "Economic and Social Development (Book of Proceedings), 36th International Scientific Conference on Economic and Social Development–." Journal of Personal Selling & Sales Management 32.3 (2018): 333-348.
- Wei
- https://www.jmir.org/2020/3/e16235/
- https://abetlen.github.io/llama-cpp-python/
- https://github.com/viktor02/llama_telegram_bot/blob/master/main.py
- https://github.com/aneeshjoy/llama-telegram-bot/blob/main/bot.py




