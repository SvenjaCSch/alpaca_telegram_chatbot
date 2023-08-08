# alpaca_telegram_chatbot study project

## Introduction

Conversation and chats are very important to us human, as reflected in our everyday behavior. We bascially talk to different people daily. We communicate to express what we want, to exchange intellectual ideas with one another, or to connect to people socially. Especially, we want to find someboy to talk to when we are in some situations. For instance, when we are in low mood, or confused, just bored,  we just want to talk to somebody - this person needs not to be very familiar with us, but rather act as a listener or a company. The problem may still be here after the talk, but the stress level is somehow relieved. 

Therefore, we are interested in creating our own chatbot with similar social functions - be a good listener in a friendly manner who can temporarily address our emotional needs. AI Chatbots have gained so much popularity these years, and there have already been quite a number of chatbots built based on LLM. For example, XXX (to be added).


##Method
We decided to create the chatbot via Alpaca LLM. (Reason for this is) This model is trained on social media data so it generates more conversation-like output. (fact-check needed)

We used Telegram Bot to build our chatbot. It is a program ---

it uses the chat history as prompt

Different prompt can be used to maximize the best answer of bob. To find the best prompt, a evaluation should take place. 
Bob can act as a friend in a varienty of scenarios, e.g. Lost, Scared, Bored, Curious ...
The different scenario wil be tested. 

For the functionality of the chatbot, a API-key for the telegram bot is requiered as well as a alpaca llama model.

## prompt structure
The prompt has to be in that order:
1) General Information
2) Instruction
3) Example (optional)
4) Dialog

During the chating with the bot, the prompt will be extended with the conversation between the User and the Bot Bob. The prompt can be changed via changing the general information, the instruction or by adding an example.

## Szenarios
1) Bored: The User is bored and wants some entertainment from the bot. The bot should play a game with the user, that makes sense.
2) Scared: The User is in a park and pretends that the bot is living 10 minutes away. They are planning that the User come over and the making dinner together (pizza). Maybe the user buys some drinks
3) Confused: The User is unhappely in love with the best friend. The Bot shall listen to the problem, gives confort und some advice that helps the User

## Testing
For the testing we will use following approaches:
1) Conduct a conversation in 3 different scenarios with variables (explained below)
   1.1) feeling bored
   1.2) feeling scared 
   1.3) feeling confused 
3) Varibale 1: using the term "friend" or "assistant" for the bot in the introduction of the prompt
4) Variable 2: using a male (Bob), Female (Liza) or unisex (Peyton) name for the bot
5) (to be confirmed) using no example or one example.

Phase 0: Showing difference between "original" prompt and "telegram" prompt

Phase 1: Testing whether we need two rounds with the bored-example (how much difference between the two results?)

Phase 2:
At the end it is also been tests whether the choosen prompt also works with voicemessage (same results, similar results, different results)
That procedure will lead to 2 x 3 x 2 = 12  different prompts and in total to 3 * 12 +1 = 37 tests

Phase 3:
Ask personal question to the chatbot to see, if there are more differences between gender and friend/assistant in generell, that might can explain differences in the scenarios.

### Rules while testing
1) Always start with the same sentence
2) If the bot is answering the same, than you reply as you did last time
3) try to achieve your goal
4) try to have a natural conversation
5) the conversation ends if either party (you or your bot) says bye or something similar
6) record every conversation and mark the parts the bot wrote

### Results
Results Scenario Bored:
[https://docs.google.com/document/d/1F1vRZTrXeVOKekClkzYVOIymTDqZMmJ8WxnOIPdrLHA/edit](https://docs.google.com/document/d/1F1vRZTrXeVOKekClkzYVOIymTDqZMmJ8WxnOIPdrLHA/edit?usp=sharing)

Result Scenario Scared:
[https://docs.google.com/document/d/11-a8GP98tOLh13-U1gqdXVZZiMlx1mpGsaGLwX_LL9Y/edit?usp=sharing](https://docs.google.com/document/d/11-a8GP98tOLh13-U1gqdXVZZiMlx1mpGsaGLwX_LL9Y/edit?usp=sharing)

Further questions about the selfimage of the chatbot:
[https://docs.google.com/document/d/1xKrVjWne2XZ2UAKZTDJM5OEqGjsrJz-cO57QKYOX3Io/edit?usp=sharing](https://docs.google.com/document/d/1xKrVjWne2XZ2UAKZTDJM5OEqGjsrJz-cO57QKYOX3Io/edit?usp=sharing)


## Evaluation and Analysis
### 1. Basic statistics
  - Number of turn-taking
  - Number of utterances per turn
  - Number of words per sentence
  - etc
### 2. Analysis of the chatbot's performance / conversation as a whole - how humanlike is it?
 
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

  #### 2.3 Errorneous patterns
  Directly picked out any errors from the conversation
      - Logical failure
      - Linguistic error
      - Repetitiveness

### 3. What social support does the bot provide? (briefly report, or shall we leave this?)
  - Information support
  - Emotional support
  - Companionship Support
  - Appraisal Support
Qualitative analysis based on the convesation texts

# Evaluation of results
Using qualitative and quantitative matrics from previous studies, in this study, how exactly they are evaluated is not stated. They took this info from other studies. This can provide a guideline for which variables we want to include or which might be interesting to us. (The full table on google docs)
1) Quantity: Task Completion: Measure how effectively the chatbot helps users achieve their goals and complete tasks during the conversation.
2) Quality: Accuracy of Responses: Evaluate the correctness and relevance of the chatbot's answers to user queries and prompts.
3) Manner: Naturalness: Assess how well the chatbot maintains a natural and human-like conversational style, making the interaction more pleasant and engaging.
4) Language Variation: Analyze the chatbot's ability to use a variety of language and expressions to avoid repetitive responses and maintain an interesting conversation.
5) Relation: Context Sensitiveness: Determine how well the chatbot responds based on the context of the conversation, showing an understanding of user input and providing appropriate replies.
6) Ease of Understanding: How easily are the chatbot’s responses understood, avoiding confusion.

### Evaluation categorization
1) Poor: The chatbot's performance is significantly lacking - there is a major need for improvement.
2) Below Average: The chatbot's performance is below satisfactory - and there is room for improvement.
3) Satisfactory: The chatbot's performance is acceptable - but there are some areas that can be improved.
4) Good: The chatbot's performance is quite good - with only minor areas for improvement.
5) Excellent: - The chatbot's performance is outstanding -  little to no room for improvement.

Chatbot Evaluation Rubric: https://docs.google.com/document/d/1gOaaY3d_I28JIt3fXaiT5L-yzv_hVJDMZeaXyHw8oWs/edit

### Evaluatio categorization
1 - Poor: The chatbot's performance is significantly lacking - there is a major need for improvement.
2 - Below Average: The chatbot's performance is below satisfactory - and there is room for improvement.
3 - Satisfactory: The chatbot's performance is acceptable - but there are some areas that can be improved.
4 - Good: The chatbot's performance is quite good - with only minor areas for improvement.
5 - Excellent: - The chatbot's performance is outstanding -  little to no room for improvement.

Chatbot evaluation rubric: https://docs.google.com/document/d/1gOaaY3d_I28JIt3fXaiT5L-yzv_hVJDMZeaXyHw8oWs/edit

### Conversation errors (double weighting)
1) Not answering the question, for example (leaving out information) (0 - -5)
2) Ignoring/forgetting the previous context (0 - -5)
3) Bot creates the whole dialogue by itself (0 - -5)
4) Not finishing sentences (0 - -5)
5) Bot just ends dialogue (0 - -5)

### Structural error (single weighting):
1) Repetition (0 - -5)
2) Spelling errors (0 - -5)



## Further questions
### Ethics
ethics and concerns over the use of chatbots
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




