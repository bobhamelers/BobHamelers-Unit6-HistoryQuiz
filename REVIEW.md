# Review
Comments that I (Bob Hamelers) have written down when Dennis Broekhuizen talked about my code.

Below:

I = Dennis Broekhuizen

You = Bob Hamelers

## 1 Names
#### Aspect of code quality
Level 3

Names are well defined but sometimes it is not clear where but sometimes it is not clear where a name refers to. Refers it to a struct, function, variable or other property?

#### Where in your code are examples of good/bad quality
The QuestionViewController looks quite nice. The names describe precisely what happens. This is a really good example. 
In the ResultsViewController you use a lot of let and var names that looks actually quite the same. Make the names more different and proper. The difference between the two swift files is also not very clear. Make a UserScore and User swiftfile. This are bad examples. 

#### How to improve next time
Start with defining your names in swiftfiles, functions etcetera with logical names. When names will overlap each other to much, redefine them!


## 2 Headers
#### Aspect of code quality
Level 4

You have everywhere good header comments. The header comments are in the right Style, are short and clear.

#### Where in your code are examples of good/bad quality
You have everywhere the same style of header comments, so difference is not to be find in your code. 

#### How to improve next time
Maybe you can give more information about a specific ViewController sometimes, but give attention to it that it will not be to long. 


## 3 Comments
#### Aspect of code quality
Level 3

Sometimes your comments don't add really something and sometimes you may have more comments, but with good content!

#### Where in your code are examples of good/bad quality
Make more comments after a MARK: UI(Table)ViewController. Do this below some functions or not easy to understand code.

#### How to improve next time
Sometimes you have to be more specific and sometimes you have to add comments. 
There is no standard rule for the amount and the content, but do not try to put long pieces in 1 comment and do not post any senseless comments, for example // struct ...{name}...


## 4 Layout
#### Aspect of code quality
Level 1

Everywhere I see outcommented old code. Try to change it before you deliver it in. 

#### Where in your code are examples of good/bad quality
In the HistoryController you have a bad example. There is an old completion function with network swift file. Another bad implementation are the print-statements and the not used variables in your QuestionViewController for example. 

#### How to improve next time
Hold your code clean. When something works, delete right away the old commented code. If you want to hold it, put it outside Xcode. Delete files that you don't use, such as ViewController. 


## 5 Formatting
#### Aspect of code quality
Level 3

Most of the times the formatting is correct, but sometimes it is not very readable. 

#### Where in your code are examples of good/bad quality
Most of the times your formatting is good, but look at het LoginViewController. The SignUpButtonPressed is not really readable. Consider to change this. 

#### How to improve next time
You did well, but change it when it is not readable anymore. Maybe you have to make new fuctions to split it. 


## 6 Flow
#### Aspect of code quality
Level 3

This is the readability from 5 Formatting. Try to change the flow sometimes. You use a lot of jumps but I see that you have too sometimes, because it wouldn't be readable in one function. Think over sometimes if you need really everything.

#### Where in your code are examples of good/bad quality
As said, the SignUpButtonPressed is a really complicated function but other fuctions make it not more clear. Try to make it shorter if possible. I like the other ViewControllers. 

#### How to improve next time
Think ahead what is a good flow. If it is too long, try to make calls. If it makes a lot of call, try to make it orignal more substantive or seperate it really clear. 


## 7 Idiom
#### Aspect of code quality
Level 4

I don't see improvement on this point but maybe there is something in the libraries I don't know.

#### Where in your code are examples of good/bad quality
I don't see a lot of good or bad examples. 

#### How to improve next time
Maybe you can look to character count for password, e-mail to username or make extension for string html entities. You can download a podfile also


## 8 Expressions
#### Aspect of code quality
Level 4

Besides the outcommented ones, I don't see expressions that aren't useful.

#### Where in your code are examples of good/bad quality
I like the properties marks. It shows the usefull new constants or variables in your file. 

#### How to improve next time
Maybe you can look into lists with scores in the ResultsViewController or in the LeaderbordTableViewController


## 9 Decomposition
#### Aspect of code quality
Level 3

I see that the composition is based on the Restaurant App, the Grocr App and the PersonalityQuiz App. That's good. Start small to improve yourself on the way.

#### Where in your code are examples of good/bad quality
Try to separate the leaderbord in real from the ResultsViewController. Decomposition shared values of the HistoryController and the QuestionViewController. This are bad examples. For the rest it looks clean.

#### How to improve next time
Be carefull in passing on variables and constants to other files. It looks really awfull and it makes the code less readable. 


## 10 Modularization
#### Aspect of code quality
Level 3

The most modules are clearly seperated.

#### Where in your code are examples of good/bad quality
You have made a loadingStack seperate from the QuestionsStack. I really like that. The IntroductionViewControllor is also nice, to change questions really from logging in. But, have a better look on the ResultsViewController and the LeaderbordTableViewController. They overlap sometimes.

#### How to improve next time
Make modules really seperated. It is to much to do it this time, but try to make another SignUp controller. 


