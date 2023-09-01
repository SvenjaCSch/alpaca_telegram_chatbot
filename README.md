# alpaca_telegram_chatbot study project

## Team Members
| Name | Matriculation Number 
| --- | --- |
|Patrizia Lanz| 4143332 |
|Hiu Yan Yip| 6546973 |
|Svenja Carina Schulze| 6523385 |

## Introduction and Related Work

Conversations and chats are very important to us. We basically talk to many different people every day because we need to communicate to express what we want, to exchange intellectual ideas with one another, or to connect to people socially. We especially want to find somebody to talk to when we are in some situations. For instance, when we are in a low mood, confused, or bored, we simply want to talk to somebody - who is not very familiar with us but rather acts as a listener or good company. The problem may still be here after the talk, but the stress level is somehow relieved.

What if we could have a chatbot that could offer some emotional support to us? We are interested in creating a chatbot with similar social functions - be a good listener in a friendly manner who can temporarily address our emotional needs.

Chatbots are systems designed for extended conversations (Jurafsky & Martin 2023). It tries to imitate the unstructured conversations or ‘chats’ characteristic of human-human interaction, mainly for entertainment but also for practical purposes like making task-oriented agents more natural

AI Conversational Chatbots have gained so much popularity and attention these years. From more specific task-based chatbots deployed in large institutions like banks to some more generic, open-domain, LLM-driven chatbots such as ChatGPT and Bing, various chatbots have been designed and created with different functions and purposes

### Previous research and related studies

It has been difficult to create a chatbot capable of carrying meaningful open-domain conversations in natural languages Wei et al. (2023) found that design factors in prompt showed impacts on the performance of the chatbots powered by Large Language Models through zero-shot response generation. In their studies, they had four prompts with different structures and personality designs for the chatbot. In dialogue analysis, the prompts with descriptive information format asked more questions, while in slot-filling analysis, prompts with the personality modifier had different performances between the structured format and descriptive format. They suggested that the conversation topic could be a reason for the difference. Yet, from the results, a number of opportunities for LLM chatbots were discovered, such as their versatile responses and the social attributes inside them.

Moreover, it has also been a challenge to evaluate chatbots and the relevant natural language-generating system. Various researches have been conducted to test and evaluate the performance of chatbots from different perspectives. Adiwardana et al. (2020) proposed an evaluation metric called Sensibleness and Specificity Average (SSA), which is an important element in human conversation. It primarily measures if the bot’s response in the conversation is logical and specific enough, and the experiment showed a strong correlation between the interactive SSA and perplexity. 

Furthermore, there were other suggestions for evaluating chatbots based on their performance and how people rate them. One of them was illustrated in “Economic and Social Development – 36th International Scientific Conference on Economic and Social Development – “Building Resilient Society”” by Verselica et al. (2018). The chapter “Chatbot evaluation metrics: Review paper” by Dijana Peras (Verselica et al., 2018) addresses the growing popularity of chatbots but the lack of a standardized chatbot evaluation framework to assess a chatbot's success. To solve this problem, the chapter proposes comprehensive chatbot evaluation metrics based on five perspectives, like the user's experience or linguistics. 

There were competitions on open-domain AIs. One of which, the second Conversational Intelligence Challenge (“ConvAI2”) (Dinan et al. 2020), aimed to find approaches to create a high-quality automatic evaluation tool so that the chatbot systems can be compared directly. This challenge proposed that apart from utterance-level performance, conversation-level performance, like a ratio of question-answer pairs in a dialogue, is also important in chatbot evaluations.

Following the evaluation framework from ConvAI2, See et al (2019) also suggested that good control of four attributes in a chit-chat dialogue, including repetition and question words, could improve conversation evaluation.

## Chatbot Set-up
We decided to create the chatbot ("the Bot") via Alpaca LLM. Via testing on this [https://chat.lmsys.org/](webpage), we found out that the ALpaca LLM reacted most appropriately to our program. Mainly, a friend-like behavior was tested. The bot we want to create should have the ability to act like a friend, pretend to be nearby, and respond naturally. In contrast, OpenAI acts like an AI assistant and communicates that openly. Because of that, OpenAI is not usable for our experiments. For the ALpaca LLM, [https://pypi.org/project/llama-cpp-python/0.1.55/](llama-cpp-python) was used. The ALpaca Model itself had to be quantized. In the end, we utilized a 7B Alpaca model.

We used Telegram Bot API to build our chatbot. By doing so, we set the framework for our bot. In our scenarios, the user is writing on the mobile phone. For the scenarios, it is vital that the chatbot is portable and accessible. Telegram has a very easy setup for a chatbot that requires Python programming and the app itself. 

The basis of the chatbot is inspired by **aneeshjoy** and **viktor02**. That way, the chatbot can use the user's written messages and the user's voice messages to respond via LLM in written form. The response via voice message is mocked but not fully programmed. The bot also uses a preliminary stage of a chat history. It uses a fixed prompt as a first base and adds the rest of the conversation in every iteration. It has to be noted that this stage works without a database and is, therefore, only mocked. In a real-life scenario, the bot would be downloaded by more than one person, which would lead to confusion. In our testing, we bypassed that problem by installing our own bots with the same code for each user. In further implementation, this mocked-up has to be fixed with a database like SQLlight.

Different prompts can be used to maximize the best answer of the Bot. To find the best prompt, an evaluation should take place. 
We expected the Bot can act as a friend in a variety of scenarios, e.g., when the user is feeling lost, scared, bored, curious ...
Therefore, we are going to test how the bot performs under different scenarios. 

For the functionality of the chatbot, an API key for the telegram bot is required as well as an alpaca llama model.

## Methodology
As we expect the Bot can act as a friend under a variety of scenarios that humans may encounter in daily life, we have come up with a number of variables to be set in the prompt instruction; then, we will evaluate the performance in each prompt with different variables -  to find out in which prompt the Bot can have the most human-like conversation with the User across the scenarios.

### Conversation Testing
To examine the Bot’s performance, we use the following steps:

#### 1. Prepare the prompts with the variables
They will be altered in terms of the general information, the instruction, or the provision of examples.

- Variable 1 : The Bot will talk as a "friend" or "assistant" 
- Variable 2 : The Bot's gender is male (Bob), Female (Liza), or unisex (Peyton) 
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

e.g. Prompt for the Bot with the role of an assistant called Liza, with example dialogue given:

“ _Transcript of a dialog where the User interacts with an assistant named Liza._

_Liza is helpful, kind, honest, friendly, and a really good listener. Liza knows that she and the User are talking via mobile phone._

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
| Confused  | The User is confused because he/she is in love with a friend. | To listen to the user talking about the problem, give comfort and advice that may help the User.  |

A total of 3 (scenarios) * 12 (prompts) = 36 test conversations should be carried out.

#### 3. Conduct the conversations and collect the chat data. Mark the parts the bot wrote

In order to make the chats comparable across different prompts, some rules need to be followed during the chats.

1. Always start with the same opening sentence
2. Keep the input the same across different prompts in the same scenario, i.e., if the Bot gives the same or similar reply, then reply the same or similarly
3. Achieve the goal in the conversation
4. Have a natural conversation with the Bot
5. If either side (the User or the Bot) says bye or something similar, the conversation ends.
 
#### 4. Compare which prompt and evaluate which one performs the best in different scenarios.

**These phases do we still need them?**

`Phase 0: Showing difference between "original" prompt and "telegram" prompt`

`Phase 1: Testing whether we need two rounds with the bored-example (how much difference between the two results?)`

`Phase 2:`
`At the end, it is also been tests whether the chosen prompt also works with voice-message (same results, similar results, different results)
That procedure will lead to 2 x 3 x 2 = 12  different prompts and in total to 3 * 12 +1 = 37 tests
`
`Phase 3:`
`Ask personal questions to the chatbot to see if there are more differences between gender and friend/assistant in general that might explain differences in the scenarios.`


### Evaluation of the conversations
As previously mentioned in the introduction, there were studies that proposed evaluation metrics that help evaluate a chatbot's performance. We took the evaluation metrics presented by Verselica et al. (2018) as a guideline to create our own. Some perspectives were left out since we did not consider them as important for this project. Our main focus lies on the user's experience and on the linguistic performance of the chatbot.  
(The full table is on Google Docs and can be found in the appendix part.)
1) Quantity: Task Completion: Measure how effectively the chatbot helps users achieve their goals and complete tasks during the conversation.
2) Quality: Accuracy of Responses: Evaluate the correctness and relevance of the chatbot's answers to user queries and prompts.
3) Manner: Naturalness: Assess how well the chatbot maintains a natural and human-like conversational style, making the interaction more pleasant and engaging.
4) Language Variation: Analyze the chatbot's ability to use a variety of language and expressions to avoid repetitive responses and maintain an interesting conversation.
5) Relation: Context Sensitiveness: Determine how well the chatbot responds based on the context of the conversation, showing an understanding of user input and providing appropriate replies.
6) Ease of Understanding: How easily can the chatbot’s responses be understood, avoiding confusion?

#### Evaluation categorization
1) **Poor**: The chatbot's performance is significantly lacking - there is a major need for improvement.
2) **Below Average**: The chatbot's performance is below satisfactory - and there is room for improvement.
3) **Satisfactory**: The chatbot's performance is acceptable - but there are some areas that can be improved.
4) **Good**: The chatbot's performance is quite good - with only minor areas for improvement.
5) **Excellent**: The chatbot's performance is outstanding -  little to no room for improvement.


#### Conversation errors (double weighting)
1) Not answering the question, for example (leaving out information) (0 - -5)
2) Ignoring/forgetting the previous context (0 - -5)
3) Bot creates the whole dialogue by itself (0 - -5)
4) Not finishing sentences (0 - -5)
5) Bot just ends the dialogue (0 - -5)

#### Structural error (single weighting):
1) Repetition (0 - -5)
2) Spelling errors (0 - -5)

We decided to incorporate error points into our evaluation to enhance its realism. The approach involves both double-weighted and single-weighted error points. The double-weighted errors underline the severity of the errors in the conversation, while the single-weighted errors might be seen as more minor errors. The goal is a natural conversation flow, and in order to maintain it, it is important for the chatbot to, for example, not complete the chat by itself. On the other hand, a natural conversation flow might not be very much disturbed by, for example, a spelling error.

A conversation's highest score is 30 points, with excellent performance and no errors. 

## Results
Results of Scenario Bored:
[https://docs.google.com/document/d/1F1vRZTrXeVOKekClkzYVOIymTDqZMmJ8WxnOIPdrLHA/edit](https://docs.google.com/document/d/1F1vRZTrXeVOKekClkzYVOIymTDqZMmJ8WxnOIPdrLHA/edit?usp=sharing)

Results of Scenario Scared:
[https://docs.google.com/document/d/11-a8GP98tOLh13-U1gqdXVZZiMlx1mpGsaGLwX_LL9Y/edit?usp=sharing](https://docs.google.com/document/d/11-a8GP98tOLh13-U1gqdXVZZiMlx1mpGsaGLwX_LL9Y/edit?usp=sharing)

Results of Scenario Confused:
[https://docs.google.com/document/d/1hd_76FUaNQnLsLVH5vZiBKJE8x8HDipulnQn2NI8y2s/edit#heading=h.4e4v4mypmbp4](https://docs.google.com/document/d/1hd_76FUaNQnLsLVH5vZiBKJE8x8HDipulnQn2NI8y2s/edit#heading=h.4e4v4mypmbp4)

Further questions about the self-image of the chatbot:
[https://docs.google.com/document/d/1xKrVjWne2XZ2UAKZTDJM5OEqGjsrJz-cO57QKYOX3Io/edit?usp=sharing](https://docs.google.com/document/d/1xKrVjWne2XZ2UAKZTDJM5OEqGjsrJz-cO57QKYOX3Io/edit?usp=sharing)


## Results and Analysis

The Tables above showed some basic word count statistics from the conversation dialogues and the frequency of the "empathy act."

We have summarized all our analysis and evaluation in this Google Docs link: 
[https://docs.google.com/spreadsheets/d/1ciNv4bCSziIkvMCQfAemF9Y8L64ewytwyzq-d-yjkpc/edit#gid=0](https://docs.google.com/spreadsheets/d/1ciNv4bCSziIkvMCQfAemF9Y8L64ewytwyzq-d-yjkpc/edit#gid=0)

The first three spreadsheets are the values of our empathy analysis and the overall score.

The following spreadsheets contain the evaluation tables for every scenario.

Furthermore, we have listed an overall overview of all the scenarios and conversations and their scores. 

Lastly, you can find our Rubric on which our evaluations are based. 

#### Bored
| Prompt type | Evaluation Score | Number of meaningful turn-taking | Number of Words* | Number of Words from the Bot | Number of empathy act |
| ------------- | ------------- | ------------- |------------- |------------- |------------- |
| 1st: female friend, with example | 21 | 8 | 124  | 70 | 10 | |
| 2nd: unisex friend, no example | 20 | 9 | 246 | 157 | 11 | |
| 3rd: unisex assistant, with example | 18 | 4 | 50 | 26 | 6 | |
| 3rd: unisex friend, with example | 18 | 4 | 50 | 30 | 6 | |

#### Scared
| Prompt  | Evaluation Score | Number of meaningful turn-taking | Number of Words* | Number of Words from the Bot | Number of empathy act |
| ------------- | ------------- | ------------- |------------- |------------- |------------- |
| 1st: male assistant, no example | 30 | 6 | 173  | 105 | 9 | |
| 2nd: female assistant, no example  | 29 | 6 | 112 | 54 | 8 | |
| 3rd: female friend, no example | 28 | 6 | 140 | 79 | 6 |  |
| 3rd: male assistant, no example | 28 | 2 | 61 | 32 | 13 | |

#### Confused
| Prompt  | Evaluation Score | Number of meaningful turn-taking | Number of Words* | Number of Words from the Bot | Number of empathy act |
| ------------- | ------------- | ------------- |------------- |------------- |------------- |
| 1st: male friend, no example | 28 | 9 | 278  | 199 | 12 | |
| 2nd: unisex assistant, no example  | 27 | 6 | 168 | 106 | 6 | |
| 3rd: female assistant, no example | 25 | 7 | 298 | 194 | 14 | |
| 3rd: unisex friend, with example | 20 | 6 | 220 | 153 | 11 | |

#### Evaluation Score
A measure that combines qualitative and quantitative metrics. It is calculated by summing up the evaluation points and then subtracting the errors that were made during interactions. It provides a holistic view of the chatbot's effectiveness, which considers successes and areas of improvement.

#### Meaningful turn-taking
The meaningful turn-taking is counted in conversation pairs. For example, a question and an answer will be counted as one turn-taking. Only turn-taking created by the user and bot together was regarded as meaningful turn-taking. Self-made dialogue from the bot was excluded from the count, even though it also created or simulated the user's statement or response.

#### Empathy Acts
In order to take a closer look at the responses generated by the bot in terms of being playful / engaged / empathetic, hence determining its "social engagedness", we followed the framework from Anuradha Welivita and Pearl Pu's Taxonomy of Empathetic Response Intents for a more fine-grained analysis of what kind of engagement the bot will show in the dialogues. As the original classification was based on empathy dialogues, it may not be enough to cover our testing. For example, in the bored situation, there may not be such "empathetic" utterances, so we further added some categories to the framework to enrich the classification.
   
| Category | Description 
| --- | --- |
| Questioning | The bot asks questions for further information or clarification |
| Acknowledging | The bot recognizes or admits the user's feelings |
| Agreeing | The bot shows that it has the same opinion towards something |
| Consoling | The bot expresses care or concern and gives comfort to the user to lessen grief |
| Sympathizing | The bot feels sorry or pitiful for the user's problem or trouble |
| Wishing | The bot expresses hope for the user |
| Suggesting | The bot provides suggestions to the user |
| Sharing own thoughts/opinion | The bot expresses opinions with no obvious attitude regarding the user's previous input |
| Advising | The bot formally or strongly expresses suggestions to the user |
| Expressing relief | The bot expresses a feeling of relaxation after some degree of stress or anxiety |
| Disapproving | The bot expresses negative judgment to the user |
| Appreciating | The bot expresses the value worth of someone or something |
| Rejecting | The bot shows an opposite opinion towards something | 
| Joking | The bot says funny or humorous things 
| Doubting | The bot expresses uncertainty or reservation
| Others | to be added

####  Basic Dialogue Acts 
In the conversation logs, we also annotated each conversation turn with a dialogue act. The tags are adopted from Stolcke et al. (2000). It was designed to classify utterances according to a combination of pragmatic, semantic, and syntactic criteria. We labeled each utterance with a tag and saw the "dialogue-pair" patterns (e.g. question-answer, question-statement, etc.).

| Tag | Description 
| --- | --- |
| Statement| Descriptive and narrative statements|
| Opinion | Value-judged statements|
| Backchannel | a short utterance that plays discourse-structuring roles, e.g., uh-huh, oh, alright |
| Yes-No Question | Formally syntactically structured polar questions, "Are you going to school?" |
| Wh- Question | Formally syntactically structured open-ended questions with wh- syntactic markers e.g., "When are you going to school?" |
| Declarative Question | Utterances with normal declarative word order ending in ? e.g., "You are going to school tomorrow?" |
| Answers | Response to the previous question, opinion, or statement |
| Request | Polite or formal act to ask for something |
| Command | Direction instruction to do something |
| Greeting | Strutual opening of a conversation |
| Closing | Structural of a conversation |
| Apology | Formal recognition of failure |
| Turn-break | Utterances that the speaker breaks off without finishing |
| Others | Uninterpretable utterances | 

## Discussion of Results 
Through evaluating the conversations of the different scenarios, we aimed to comprehensively understand the performance of the chatbot's interaction with the users. Each conversation type was evaluated based on scoring a maximum of 30 points. This allowed us to evaluate the chatbot's response's quantitative and qualitative aspects.

#### Bored Scenario

When looking at conversations held when users expressed boredom, the chatbot overall demonstrated the ability to engage effectively and provide relevant information. Overall, it scored well when it comes to the quantitative and qualitative aspects but is challenged by the errors related to ignoring previous context, not finishing sentences, and creating whole dialogues by itself. These errors hinder the chatbot from maintaining a coherent conversation flow and robbing it of its naturalness. The total conversation score shows that this scenario has the lowest overall points and, therefore, has the worst performance of all three scenarios. 

#### Scared Scenario

The best scoring scenario was when the users were in a state of fear. This is where the chatbot provides reassuring information. By balancing both quantitative and qualitative responses, the users receive valuable guidance. This performance shows its potential as a tool to comfort users when they need comfort or are anxious. However, even if the chatbot offers support and seems to meet users' needs, a few areas of concern emerge in terms of errors. Those errors include spelling mistakes and not complete responses. These might impact the overall user experience, especially during sensitive conversations. The scared scenario had the least errors and the highest overall rank, providing a good base for future work. 

#### Confused Scenario

In the confused scenario, the chatbot showed its capability to address users' confusion by providing informative responses. Overall, the quantitative and qualitative scores were high, which indicates that the chatbot often successfully helped the users with their problems. Nevertheless, a common problem was that the chat did not answer certain questions or create a whole dialogue by itself. It sometimes also forgot the previous context, making it hard to continue the conversation. The errors in this scenario were more diverse, highlighting the complexity of the chatbot adapting responses to users’ inquiries. This scenario was ranked second highest in total score. 

#### Common challenges 

The responses are raw but promising for further research. There are still some errors that must be tackled in many conversations. The most common errors are the bot creating a part of the dialogue by itself, not finishing sentences, and just ending the dialogue by itself. Addressing these challenges in the future will be vital as they directly influence users’ comprehension and interaction experience.

#### Correlations between the prompts and the evaluation scores
Different prompt variables were designed at first because we hypothesized that the gender role may have an impact on the conversation quality, given that there may be stereotypical thoughts that "female" is usually a better listener or counselor than a "male" or "unisex". From our results, there seems to be no such correlation between the gender role and their evaluation scores, and the prompts with the male role even ranked the highest in confused and scared scenarios.

The prompts were distinguished between the role of friend and assistant for the same reason. However, prompts with the assistant role scored, as well as prompts with the friend role. From the results, we predicted that these two variables had no obvious impact on the conversation quality of a chatbot in providing emotional support.

#### Empathy Aspects 

Empathy aspects are crucial in human interactions since they contribute to developing trust and understanding. In our scenario, they help reflect the ability of the chatbot to respond to users' emotions and concerns. The data evaluated suggests that there is a positive correlation between the presence of empathy aspects and a higher evaluation score. Furthermore, it can lead to the assumption that a variety of empathy acts may lead to a higher evaluation score. Still, the numbers are mixed and range between six and 14 across the highest-rated evaluations. Even though the number of empathy acts could depend on the total words spoken, which might explain why there is such a difference in those acts, there are still some deviations. For example, when looking at the scared scenario, there are conversations with many words and not as many empathy acts, but also conversations with a few words and comparably many empathy acts. Overall, there is a tendency toward the more words spoken by the bot, the more empathy acts are expressed, and the higher the empathy acts, the better the evaluation score. This can lead to the assumption that the accuracy of the response or relevance of information plays a role in whether the chatbot shows itself as empathic or not. 

#### For further improvement

The evaluation has provided insights that can guide future improvements. The main focus will be maintaining context and minimizing common errors, particularly regarding response coherence. 
For this, it might be vital to include more natural language processing techniques but also context-aware algorithms. This can help with more fluid interactions.
Since we could not filter out one prompt that gave clear results and the conversations seemed dependent on the situation, it was not possible to continue with the text-to-speech phase. In order to get clear results, further tests are needed and would, therefore, be the next step in optimizing the friendly chatbot.


## Limitations
1. Capacity of the chatbot: The number of maximum tokens may be too small. If the bot mistakenly created the dialogues by itself, it would have already taken up a lot of tokens, and the chat could not proceed before so the goal was reached.

2. Interaction variation during the chat test: When talking to the bot during the test in different scenarios, different testers had different reactions to the bot's errors. For example, one tester may have continued with the chat without mentioning the error, while another tester may have first pointed out to the bot that there was a mistake. In the end, the difference here may have yielded different conversation outcomes.

3. Evaluation procedure: Only two separate raters are available for the evaluation. The evaluation results would sound more valid if more raters were involved.

## Ethical Considerations
Our chatbot project aims to help users emotionally in different scenarios, so addressing this technology's ethical implications is important. These ethical considerations play an essential role in ensuring that this kind of chatbot serves users responsibly and respects their needs and rights.

This ethical framework is rooted in a broader context of chatbot ethics and AI. It is drawn from the insights already discussed in “The Ethical Chatbot: A Viable Solution to socio-legal Issues” (Ng et al., 2022), which also helps us in our project to underline the central role that ethics plays in AI.

### Privacy and transparency

One key consideration is focusing on users’ privacy and transparency in our chatbot’s interactions. As Ng et al. (2022) discussed, this involves clarifying terms and informing users of the chatbot about terms and how personal information is used.  A problem might be that it conflicts with creating human-like interactions. The balance between keeping a natural conversation and ensuring transparency might be more difficult since users should not mistakenly believe they are interacting with a human being. 

### Vulnerability and inclusivity of different users

Another critical point includes addressing the needs of vulnerable users and ensuring inclusivity without looking down on them or marginalizing certain users. On the one hand, diverse user requirements should be supported according to their individual needs and not be too generic so that it will not sound or look like a cold robotic assistant. On the other hand, a one-size-fits-all approach should be avoided while providing ethical and practical assistance. 

### Ethical and responsible innovations

Another part discussed by Ng et al. (2022) includes the concept of responsible innovation. This includes listening to different points of view, concerns, and needs of individuals who interact with or are affected by the chatbot. By considering different viewpoints, a more well-rounded chatbot can be created to address a broader range of needs and concerns. 

### Legal advice from a bot

In line with the legal chatbots explored by Ng et al. (2022), giving legal advice might be another struggle to face in the future evolvement of the chatbot. Balancing offering informative guidance and steering clear of legally binding recommendations might be challenging. The problem will lie in how we can provide helpful information without crossing the line of personalized legal counsel.

### Summary

After taking a closer look at ethics and the design of a chatbot, it is clear that a few challenges must be faced. When creating a chatbot in the future, it is essential to recognize aspects like privacy, transparency, human likeness, and meeting users' needs.
By openly addressing these complex dynamics, chatbots in the future might be considered more ethical and, therefore, more trustworthy, which, in the end, might lead to a higher degree of acceptance among us.

## Conclusion and Prospects

This project has attempted to build a chatbot aiming to address user's emotional needs. We came up with different prompts with varying roles and task descriptions, hoping to see which prompt performed the best across different emotion scenarios. The performances were evaluated mainly in two categories: linguistic performance and empathy support. We found our prompt design had little effect, and there is no clear pattern in the chatbot's performance. Several errors, such as turn-breaks or self-made partial or complete dialogues, were found during the chats. More work on the prompts is needed to improve the interaction experience.

This project focuses on the chat performance generated in English, which is an extremely high-resource language in the LLM field. However, it will be interesting as well as significant to see how well the chatbot functions in other languages. Moreover, we are aware that people use audio messages as frequently as text messages. A study of the chatbot's text-to-speech function is also reletable to make a more human-like chatbot.


## Appendix files 

Evaluation Rubric in detail: https://docs.google.com/document/d/1gOaaY3d_I28JIt3fXaiT5L-yzv_hVJDMZeaXyHw8oWs/edit

Analysis of the Scared Scenario: https://docs.google.com/document/d/1Oo8U38M-EHf6hgKF6PGxFbscvVyxfVMiEHupjmadg0E/edit

Analysis of the Bored Scenario: https://docs.google.com/document/d/1U5NoqbhALW4ParoZqnXdixMxoog6Vc3u_FJKdpfcoDg/edit

Analysis of the Confused Scenario: https://docs.google.com/document/d/1m1apP49jim9Wd48ayMjUnAj1Md0VVmMgUfHXFvZdLEA/edit#heading=h.d3z0eepp1zvp

Sample screenshots of the chat tests: https://docs.google.com/document/d/1XkowyXiqza9gEirCU_qvXWtFFWZSCyDP9-2Lwa3mjjQ/edit

## References
- [A Taxonomy of Empathetic Response Intents in Human Social Conversations](https://aclanthology.org/2020.coling-main.429) (Welivita & Pu, COLING 2020)
- Adiwardana, D., Luong, M. T., So, D. R., Hall, J., Fiedel, N., Thoppilan, R., ... & Le, Q. V. (2020). Towards a human-like open-domain chatbot. arXiv preprint arXiv:2001.09977.
- Dinan, E., Logacheva, V., Malykh, V., Miller, A., Shuster, K., Urbanek, J., ... & Weston, J. (2020). The second conversational intelligence challenge (convai2). In The NeurIPS'18 Competition: From Machine Learning to Intelligent Conversations (pp. 187-208). Springer International Publishing.
- Ng, J., Haller, E., & Murray, A. (2022). The ethical chatbot: A viable solution to socio-legal issues. Alternative Law Journal, 47(4), 308-313. https://doi.org/10.1177/1037969X221113598
- Stockle 20000. Dialogue Act Modeling for Automatic Tagging and Recognition of Conversational Speech
- See, A., Roller, S., Kiela, D., & Weston, J. (2019). What makes a good conversation? how controllable attributes affect human judgments. arXiv preprint arXiv:1902.08654.
- Veselica, Rozana, Gordana Dukic, and Khalid Hammes, eds. "Economic and Social Development (Book of Proceedings), 36th International Scientific Conference on Economic and Social Development–." Journal of Personal Selling & Sales Management 32.3 (2018): 333-348.
- Wei, J., Kim, S., Jung, H., & Kim, Y. H. (2023). Leveraging large language models to power chatbots for collecting user self-reported data. arXiv preprint arXiv:2301.05843.
- Daniel Jurafsky & James H. Martin. (2023). Speech and Language Processing. Pearson Education.
- https://www.jmir.org/2020/3/e16235/
- https://abetlen.github.io/llama-cpp-python/
- https://github.com/viktor02/llama_telegram_bot/blob/master/main.py
- https://github.com/aneeshjoy/llama-telegram-bot/blob/main/bot.py





