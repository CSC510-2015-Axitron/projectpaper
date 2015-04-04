##Group 9 - Procedural Content
###Project Report

###Background
A large portion of game development time is spent on content development, from the time it takes to make the tools to create the content to create the content itself. In order to reduce the effort required to develop sufficient content to keep players happy, some developers have turned to Procedural content generation, in which content is produced via an algorithm. In his article [Nine Paths To Indie Game Greatness][indiegreatness], David Marsh recommends aspiring developers lean heavily on user-generated and proceudral content to keep development time down, citing another developer, Introversion Software, who cut their development time down from 3 years (Darwinia) to 1 year (DEFCON) by switching from hand-crafted content to publicly available and procedural content.
These algorithms are varied and can be quite complicated, taking up a significant portion of development time themselves. Not only this, but because the results of the algorithms are not always the same, the eventual product may not be exactly what the developer or player expect. Developers then either have to adjust their expectations accordingly or spend time fine-tuning the algorithms, usually some combination of both.
These difficulties are what our project hopes to take some measure of.

###Goals
Our goals with this project are twofold:
Firstly, to determine how difficult it is to produce the tools and content itself by hand and compare this to how difficult it is to produce procedural generation algorithms to produce content of acceptable quality.
Secondly, to make it easily possible to give both sets of content to users and determine what, if any, difference in game enjoyment these two methods result in via survey.
In order to accomplish these goals, we decided to use a simple maze game. We decided on this format because making a game engine to play mazes would be easier than a more complicated game. Not to mention, there is already a [mountain of work][mazealgs] on generating and solving mazes out there, which would make the procedural portion of the development process much quicker.
We can easily quantify how many man hours we spent on producing the tools and content for hand written content, as well as the time spent on creating procedural generation algorithms, since we have GitHub's issues and commit tracking systems. Quantifying how much users enjoy handwritten or procedural content is much more difficult to do, and so instead of attempt to do it ourselves, we've left it for another group of people to attempt using our game. A proof-of-concept system is enough, the later group can go in and expand upon our work if it is necessary to do so.

###Discussion
####Difficult in testing GUI
A lot of our project's functionality depends on the GUI working properly, which is difficult to test. We ended up making up a series of informal functional tests that one of the development team would have to work through manually if they felt like testing, but more often our testing process was even less formal than that. While working on a feature, each developer tended to only test new features added to the GUI, expecting old features to continue to work. This bit us a few times, with some new feature breaking old functionality. A tool to automate interacting with the GUI would be useful, but we found nothing easy enough to setup to justify the effort of setting it up.
####Prevalence of free resources
Much of our project relies on freely available cloud resources, namely Heroku, TravisCI, and GitHub. While working on this project we marveled at how easy it is to setup and deploy code in an automated fashion, all for free. We believe it's safe to say that software engineering has never been this easy to do right, and for free, with a minimum of in-house expense for small projects.

###Conclusion
Both procedural and hand crafted content provide their own challenges of implementation. Some of our favorite games include both, and from our small experience in creating both, we feel it's safe to say that a mix of both is the best path for an aspiring developer.
Without being able to say for certain that people tend to prefer one or the other, we can say with certainty that hand crafted content is time consuming, but procedural content can become in turns "samey" or unpredictable, depending on how much time was spent on tuning the generator. Reigning in a procedural generation engine to exact specifications is, however, very time consuming, almost on the same level as producing enough content by hand, so excessive tuning is also not the answer. Thus, a balance of both is the best use of a devloper's time, using procedural engines for portions of the game that don't need to be very carefully tuned and handcrafted content for portions that need to be exacting.

###Future Work
We did not have the time or resources to deploy our application to the world at large to record useful statistics, therefore we recommend another group inherit our code and attempt to do so. We utilized several services that may or may not continue to give out time for free if used on a large scale, so another service, or self hosting, may be required, which would necessitate changing our codebase slightly.
In addition, we did not have enough time to create enough hand-crafted content to reduce the chance of a user seeing the same maze twice, therefore we also recommend that whoever resumes work on this project also make more mazes.

###References
[Nine Paths to Indie Game Greatness - David Marsh][indiegreatness]

[Think Labyrinth: Maze Algorithms - Walter D. Pullen][mazealgs]

[indiegreatness]: http://www.gamasutra.com/view/feature/131952/nine_paths_to_indie_game_greatness.php?print=1 "Nine Paths to Indie Game Greatness - David Marsh"
[mazealgs]: http://www.astrolog.org/labyrnth/algrithm.htm#create "Think Labyrinth: Maze Algorithms - Walter D. Pullen"

