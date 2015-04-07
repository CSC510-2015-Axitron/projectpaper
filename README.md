##Group 9 - Procedural Content
###Project Report

###Background
A large portion of game development time is spent on content development, from the time it takes to make the tools to create the content, to the time it takes to create the content itself. In order to reduce the effort required to develop sufficient content to keep players happy, some developers have turned to procedural content generation, in which content is produced algorithmically rather than manually. In his article [Nine Paths To Indie Game Greatness][indiegreatness], David Marsh recommends to aspiring developers to lean heavily on user-generated and procedural content, in order to keep development time down. This is citing another developer, Introversion Software, who cut their development time down from 3 years (Darwinia) to 1 year (DEFCON) by switching from hand-crafted content to publicly available and procedural content.
The algorithms can be varied and quite complicated, and can take a significant portion of development time. In addition, because the results of the algorithms can vary, the resulting product may differ from what the developers' or players' initial expectations were. Developers must then either adjust their expectations accordingly, or spend time fine-tuning the algorithms. Usually, it is a combination of both. These are the difficulties our project hopes to take a measure of.

###Goals
Our goals with this project are twofold: First, to determine how difficult it is to design the tools and content itself by hand an compare this with the difficulty of designing procedural generation algorithms that produce content of acceptable quality, and second, to make it feasible to deliver both sets of content to users, and determine via survey any differences between the users' enjoyment of the sets. In order to accomplish these, we decided to develop a simple maze game. We chose this format because we believe that making a game engine to play mazes was of more fitting scope than other options such as voxel-world games which can also greatly utilize procedural generation. This is combined with the fact that there was already a [mountain of work][mazealgs] available on generating and solving mazes, which greatly hastened the procedural portion of our development process.
Since we have GitHub's issue and commit tracking systems, we can easily quantify how many man-hours we spent manually designing content, including the development time of the tools we used, as well as quantify time we spent developing the procedural generation algorithms. Quantifying how much users enjoy handwritten or procedural content would be a much more difficult endeavor, so instead of attempting to do it ourselves, we left it for another group of people to play our game. We felt that a proof-of-concept system was enough, but a future group can expand upon our work if necessary.

###Infrastructure

####Continuous Integration

When defining Continuous Integration it is unnecessary to look further than Martin Fowler's article [Continuous Integration][contint].  Fowler defines it as: "a software development practice where members of a team integrate their work frequently, usually each person integrates at least daily - leading to multiple integrations per day. Each integration is verified by an automated build (including test) to detect integration errors as quickly as possible. Many teams find that this approach leads to significantly reduced integration problems and allows a team to develop cohesive software more rapidly."  Our team chose to use continuous integration as a means of running static analysis and unit testing.  The structure of our process is as shown in the following image:

![infrastructure](./img/infrastructure.png)

The first stop for most of our code is, as with many projects, [GitHub](http://wwww.github.com "GitHub").  This paper's home is planned to be on github, so whoever is reading it should be likely to know about git and github, but for the truly uninitiated git is a system for version control, and github is used for hosting git projects.  

####Travis-CI

Our continuous integration process is orchestrated using a tool called [Travis CI](https://travis-ci.org "Travis CI"). Travis CI is an organization that offers cloud based build server functionality for free. The build server is the part that` takes care of the automated build part of Fowler's definition of continuous integration. There are a number of advantages to using hosted build server:

- It's free: This is clearly one of the biggest advantages, but may not be the case in the future.
- Setting up a build server yourself can be time consuming.
- Running a build server for a team can require either using servers based on IAAS (Infrastructure as a Service) from a provider such as [Amazon Web Services](http://aws.amazon.com/ "Amazon Web Services"), or having your own hardware infrastructure, both of which can be quite costly.
- Travis CI is very simple to configure, all configuration takes place in a file called `.travis.yml`.  It uses the [.yml](http://yaml.org/ "YAML Ain't Markup Language") file format which is generally very quick for seasoned developers to take up.

Travis CI has a nice notification system for broken builds. When a user makes a commit that breaks the build they are emailed with a broken build notice. The default setting has debatable merit: Only the user that made the faulty commit is notified. This is great when all team members check their email and respond to broken builds quickly, but not so great with group members that do not tend to their email on a very regular basis. That said, Travis-CI provides badges for GitHub respositories that indicate whether the build is broken or not. This badge is at the top of our README in our GitHub repository.

Our project used Travis CI to conduct a number of different tasks that needed to be completed in order to determine whether the project was successfully building or failing. The tasks are as follows: First and most importantly we used Travis CI to run our unit tests. Travis CI's build boxes are in effect normal Linux virtual machines running on cloud infrastructure that have a very particular boot and run procedure. Whenever a push is made to our git repository, Travis CI receives a build request. Their system boots up a virtual machine according to the specifications indicated in the .travis.yml file and pulls the contents of the repository into a directory on the build box. The build box then installs any needed modules per our package.json file and runs our test procedure.

The testing and static analysis is as follows: 

- Run unit tests using [Mocha](http://mochajs.org/ "Mocha") as detailed elsewhere in the paper
- Run unit test coverage analysis using [istanbul](https://github.com/gotwarlost/istanbul "gotwarlost/istanbul")
- Run static analysis using [JSHint](http://jshint.com/ "JSHint")
- Finally run Heroku deployment, as will be discussed later

####Continuous Delivery/Continuous Deployment

Deployment is an important feature with our particular project. Initially we received feedback that it would be a major fault in our design if the games needed to be installed locally to be played. Taking that feedback to heart we looked for a good way to deploy our game to the web in a way that it would be easy to visit for any particular user. Given that prior to this feedback we already were using Travis CI it seemed most logical to look for a deployment option that would sync well with our continuous integration system.

This is where the idea of Continuous Deployment comes in to play.  Per [Fitzgerald and Stol][fitzstol], "Continuous deployment is the practice of continuously deploying good software builds automatically to some environment, but not necessarily to actual users." While continuous delivery is an extension of that process to deployment to actual customers.  Initially our process would have been defined as continuous deployment, but if we ever had what might fit this description of a customer, we would be in a position of continuous delivery.

####Heroku

The last step in our continuous integration process as described above is deployment to [Heroku](http://wwww.heroku.com "Heroku"). Heroku is a full featured deployment system for web applications. It functions in somewhat the same fashion as Travis CI in that it runs on cloud infrastructure in a PAAS (Platform As A Service) configuration. The "dyno" is for Heroku what would be a node on many other services. It is essentially a virtualized server running on a cloud infrastructure. Again, for Heroku it would be possible to use an IAAS cloud service to create the same sort of setup, but Heroku has a large number of desirable features as follows:

- Heroku is free for five "dynos"
- There is no significant setup aside from knowing that Heroku exists and setting up package.json, and setting up .travis.yml to link to your account.
- Heroku creates fairly short URLs that are publicly accessible and assigned according to your specifications (as long as a particular name is available). Additionally Heroku offers the ability to use commercially available domain names should that be necessary.
- Heroku has a number of add-ons that increase the available functionality. Our project utilized an add-on that will be discussed in the database section of this paper.
- Scalability is another strong factor in favor of Heroku, since it is straightforward to add more "dynos" if necessary.

Our project is using two dynos currently. One dyno is being used to run the game ([Axemaze](http://axemaze.herokuapp.com/ "Axemaze")), and the other dyno is being used for our database and REST API ([Axemaze-DB](http://axemaze-db.herokuapp.com)). The benefit of using Heroku for both was that we could build our database functionality in another branch of the same GitHub repository and then, upon pushes to either branch, Travis CI performs a build and then deploy the result to Heroku. This configuration is shown in the image at the top of this section.

In a sense, Travis CI operates as a form of gatekeeper in this configuration. The deploy routine to Heroku is only ever run if our unit tests pass. That can be expanded to taking into account factors such as test coverage and static analysis. For instance, should a particular commit be tested and only have ten percent statement coverage, that commit can be rejected and not be delployed. This enforces code quality and can be a very powerful tool. Our process had simply not reached a point of maturity where those metrics were relevant to employ beyond passing unit tests.

####Database

Discussion of deployment and Heroku leads naturally into the database setup that we created for this project. [JawsDB](http://www.jawsdb.com/ "JawsDB") is a cloud based MySQL database that is being offered as an add-on to Heroku. The beneficial thing with an add-on is that it does not count against your 5 dyno limit with Heroku, but it really operates on a cloud instance that is likely the same size as a dyno. JawsDB is a SAAS (Software as a Service) cloud service for creating MySQL databases.

The obvious question at this point is why bother with a database at all for this type of software? Initially we were using JSON objects for the mazes and storing those in a directory local to the running instance of the game. For the near term this would be a fine choice, but in thinking to the future of the application, we believe that it will not be suitable going forward. Any future use that may contribute to the number of mazes would quickly necessitate the use of a more structured method of data storage that is not tied as closely to the actual repository for the game. JawsDB presented a way to deal with many of those issues in a very streamlined fashion with nightly backups and scalability should the database need to grow beyond the free tier that JawsDB offers.

The team initially had very little experience using databases in a Web App environment, and went through a number of dead ends before coming to JawsDB and quickly realizing that the instance of the database should not be accessible directly by the game.  There are a number of posts on Stack Overflow concerning this very issue, but the one we found to be most straightforward was [here](http://stackoverflow.com/questions/659970/why-is-it-not-advisable-to-have-the-database-and-web-server-on-the-same-machine "Why is it not advisable to have the database and web server on the same machine?").  As the post made clear, there are a number of reasons to separate these two facets of a system, but security and performance are the strongest.

This separation necessitated the creation of a RESTful API for communication with the database.  [Pautasso][restbook] states that, REST "in case of the HTTP protocol, a set of methods (e.g., GET, PUT, DELETE, POST, HEAD, OPTIONS, etc.) with well defined semantics in terms of the effect on the state of the resource, are defined. HTTP methods can be applied to all Web resource identifiers (e.g., URIs which conform to the HTTP scheme)."  This is how our team used the RESTful API to communicate between the MySQL database and the application.  The API is hosted on the same dyno as the database, and all communication with the outside world is handled through the API.  A diagram is shown below to describe the relationship of the app, server, database, and API.

![apidiagram](./img/apicommunication.png)

####Analytics

This brings us around to the final piece of our infrastructure: Analytics.  To prove or disprove the hypotheses set forth in this paper, we needed data.  Extracting users' likes and dislikes can be challenging, but we chose a very simple mechanism to get, store, and analyze this data.  When users visit the site, they are presented with a pseudo-randomly chosen maze, which may be either procedurally generated or hand-written.  Upon completion of a maze, the user is asked for a binary opinion on whether they enjoyed or did not enjoy the maze.

We have utilized a service called [Keen IO](https://keen.io/ "Keen IO") to capture this information. It stores a large amount of information on clicks for either like or dislike, including the time of the click, IP information, and simple geolocation data. The information we store consists of whether the maze was procedurally generated or not, and whether they liked the maze. This information is stored on keen.io's servers in a relational database that is easy to query and generate visualizations from. We have created a simple visualization that uses this click data and that can be seen [here](http://axemaze.herokuapp.com/pie.html "Pie Chart"). Obviously the game has not been played by real users in the wild yet, and the only opinions that are currently represented in the graphs are our own opinions. Luckily though, the system allows us to quickly dump all stored data should we end up having real users, so that we can begin to store only their information.

####Upsides and Downsides of Infrastructure

This final section on our infrastructure attempts to answer whether all of this is worth it or not and what we are really getting for all of this effort.  It seems clear from the above material that there are many strong benefits to the way our process came together, but the most important benefits are the ways that this infrastructure allowed us to work together efficiently.  Those benefits are as follows:

- Notifications on broken builds
- Prevention of faulty builds being deployed
- Quick feedback on work's success or failure
- Simple automatic deployment
- It is all free so no one person had to pay for it

The downsides are also easy to spell out: First and most detrimental is the fact that all of these services represent a risk to whether the application can be deployed or built. If one service was to go down our work flow and our game may not work at all, or may only work partially. This risk is present for many companies that run their businesses on the web today. A large number of massive companies, as seen in Amazon's case studies page [here](http://aws.amazon.com/solutions/case-studies/ "Customer Success. Powered by the AWS Cloud.") use AWS (Amazon Web Services), and those services are very similar to the services we have leveraged, so it does represent a sort of risk for the industry as a whole. 

That said, our project makes use of multiple services that are backed by potentially a higher multiple of services which makes our risk level much higher than it would be using only one provider. That is to say that we simply do not know where Heroku, Travis CI, JawsDB, etc are being hosted. They could be hosted on a large number of different architectures, or all consolidated (as is likely) on a service like AWS. It is fair to say that not knowing by itself presents a fairly large risk.

Another potential downside here is the possibility that all of these services in the future could become pay to play.  Right now all of this is free, but it seems hard to believe that that will be the case in perpetuity.  We have already dealt with this downside in the fact that during the time we worked on this project JawsDB went from a free beta offering to a monthly subscription fee.  Luckily the fee will only begin to be charged at the beginning of May.  This is an area where we could easily create the same service in Heroku or elsewhere, but should a service like Travis CI or Heroku become a paid service it would be difficult to replace.

Finally the amount of time required to research, set up, and put into place all of these services is non-trivial. One member of the team spent a large portion of his time doing the work required to set up all of the services involved. That represents a trade-off for the team overall: Would the project have been better off with the work of this extra team member on the project itself, or do the benefits to productivity for the team as a whole outstrip any additional effort that would have been leveraged on the project? That call is best left to the reader, rather than be made by an over-presumptuous writer.

###Project Components

####User Interface

We adopted [single-page menu](http://en.wikipedia.org/wiki/Single-page_application) design for its simplicity and compatibility across platforms. There are three UI components on the page: status bar, button bar, and the main maze canvas. The status bar displays four pieces of information: the level size, the time spent on the current maze, step count, and total score. The score is a function of time, steps, and level number and may be used as a single parameter for evaluating the performance of players. The button bar gives players the following controls: 

- RESTART to restart at the beginning of the current maze
- LEVEL to choose the difficulty level (small, medium, large, and huge mazes)
- LOAD to load a maze by its maze number
- MUTE/SOUND to toggle music and sound effects
- LOGIN to login as a registered player
- CREATE to create user-defined mazes (only available for registered players)

To engage the game, players may use keyboard (e.g., up, down, left, and right keys) or mouse device to move the main character. To simulate Joystick functionality, mouse button and its movement and velocity are constantly monitored. Such a feature allows players to enjoy the game on mobile devices as well. The main canvas consists of two overlapped layers. The top layer is responsible for rendering main character (i.e., the knight). The bottom layer displays the maze and trail dots. To reduce CPU load, only a small portion of the maze about 10 x 8 blocks is displayed on the screen. In our implementation, the main character remains on the center of canvas while the background is redrawn for each step. To make such movement appeal to the gamers, background is rendered at a rate of 50 frame per second. At the end of each level, two events are triggered: a short triumph music is played if available followed by a short question on a jQuery UI in-screen floater. The response of players (e.g., Yes or No) may change the selection probability of the next maze.

![main_menu](./img/the_game_menu.png)

####Procedural Generation

We employed six different procedural maze generation algorithms in this project, each of which has an equal chance of being chosen when a random maze is given to the user. We refer to the six algorithms as Recursive Backtracking, Coherent Recursive Backtracking, Randomized Prim's Algorithm, Randomized Kruskal's Algorithm, Random Wall Removal, and Random Wall Addition.

Recursive Backtracking and Coherent Recursive Backtracking both make use of backtracking, which is a technique that recursively explores a solution space and backtracks when no further options occur at a given point. These algorithms pick a start point, and pseudo-randomly choose the branching directions at each step of the way. The difference between the two is that the former uses a basic uniform pseudo-random number generator, and the latter chooses its directions according to a coherent direction field produced by a pair of instances of simplex noise: a function that generates smooth randomness over an n-dimensional space.

Randomized Prim's and Randomized Kruskal's are based respectively off of the concepts utilized in Prim's and Kruskal's minimum spanning tree algorithms. Both algorithms start with the maze as separate groups, and pseudo-randomly join groups together until there is only one group left. The difference between the two is that Randomized Kruskal's starts with a full list of walls and iterates through each wall in a randomized order, removing the walls when they join separate groups, and Randomized Prim's only adds the walls to the list once one of their corresponding cells has been visited.

Random Wall Removal and Random Wall Addition both work by starting with all walls in one state, and iteratively changing the state of pseudo-randomly chosen walls until the maze reaches a desired state. Random Wall Removal starts with all walls enabled, and Random Wall Addition starts with all walls removed. While these mazes do guarantee a solution, they do not avoid closed loops, and they do not avoid isolated groups. These algorithms were added as a means of providing additional variation, and their user ratings may differ from those of the other four algorithms.

Because each algorithm starts with its endpoints in the corners, an extra piece of functionality was added that iteratively moves the endpoints single units in the cardinal directions if there exists such a move that increases the length of the shortest path from start to finish. This decision came as a result of the fact that there were frequently more relevant points nearby those chosen in the corners.

####Maze Designer

![designer](./img/maze-designer.png)

We built out a maze designer, as shown in the image above, basically to aid us in production of hand created mazes. Maze creation in code was incredbily tedious prior to its construction, so the idea was that if we were going to create even a tehe limited number of mazes that we have created to date we would need to have some tool to create them in a visual fashion. We found after its construction that it could actually become a feature of the game. In its current configuration users can log in on the main game page, design, and save the mazes they have created.

The great thing is that when a user is logged in he/she can see all of the mazes they have created in the levels menu. Hitting the levels button on the main page and opening My Mazes in the menu, shows all of a users mazes as shown in the image below:

![sidemenu](./img/sidemenu.png)

Users can also share mazes that they have created using a maze nubmer. A user only has to click on the load button and add in the number of the maze to jump to their own or another users' maze. That function is shown below:

![load](./img/load.png)

Maze numbers are created upon saving mazes in the designer. Looking at the image below you can see the number of the maze next to the text box at the top of the image.

![save](./img/save.png)

###Testing

An automatic testing platform is expected to reduce the chance of existing components being broken by the addition and revision to the code. Therefore, we made testing an important part of our project and have been developing unit test methods along with the development of the code. Due to the nature of our web-based application, a headless testing platform is also required. Here, [Node.js](https://nodejs.org "Node.js"), a general-purpose server site tool, is chosen to carry out both static and dynamic analysis. Four components of our project are constantly being tested at each push to the GitHub repository. The components are listed below:

- mazeModel.js
- backtrack.js
- apiclient.js
- mazeMenu.js

The mazeModel.js component is the engine of the maze game and responsible for I/O, constructing, and gaming logics of the mazes. The backtrack.js component is designed to keep track of the player's footsteps and path taken while leaving breadcrumbs on the screen. A multi-node tree data structure has been built in the code. Apiclient is a node.js based client used to verify RESTful web services between the database server and client sites (i.e., player's browser). The frontend interface is implemented in mazeMenu.js which takes care of sound effects, information display, menu, mouse and keystroke detection and other general I/O of the game.

One challenge of developing test cases for gaming is how to test UI components in the headless environment. Although Node.js provides a few browser-like APIs and tools, we found these tools to be very limited. In addition to relying on humans to perform functional tests, we have also created UI mock objects to tackle this issue. These UI mock objects were created inside the mocha test files to act as browser window, page document, [jQuery library](https://jquery.com "jQuery"), jQuery AJAX, [CanvasEngine](http://canvasengine.net "Canvas Engine"), [Buzz audio library](http://buzz.jaysalvat.com "Buzz Audio Library"), remoteDB, and AMaze model itself. Using these mock objects allows us to monitor status, responses, and behavior of the game via internal flags.

These dynamic tests can be carried out on local sites as well as on server site such as Travis-CI. We have utilized [npm](https://www.npmjs.com), short for Node.js Package Manager, to streamline all of our installation, testing procedure, and deployment. Defined in package.json file, the required node.js packages and tools can be installed in just one step. In addition to the aforementioned tools, [Grunt](http://gruntjs.com), the automatic task runner, will be executed during the last step. As part of Continuous-Integration and Continuous-Deployment, once test is passed, the task runner will duplicate JavaScript files, minify them and move them into deployment folder called "Publichtml."

###Discussion
####Difficulty in testing GUI
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
[CIS 680: DATA STRUCTURES: Chapter 19: Backtracking Algorithms][cis680]

[Continuous Integration - Martin Fowler][contint]

[Continuous Software Engineering and Beyond: Trends and Challenges - Brian Fitzgerald & Klaas-Jan Stol][fitzstol]

[Nine Paths to Indie Game Greatness - David Marsh][indiegreatness]

[REST: Advanced Research Topics and Practical Applications - Cesare Pautasso, Erik Wilde, Rosa Alarcon][restbook]

[Think Labyrinth: Maze Algorithms - Walter D. Pullen][mazealgs]

[indiegreatness]: http://www.gamasutra.com/view/feature/131952/nine_paths_to_indie_game_greatness.php?print=1 "Nine Paths to Indie Game Greatness - David Marsh"
[mazealgs]: http://www.astrolog.org/labyrnth/algrithm.htm#create "Think Labyrinth: Maze Algorithms - Walter D. Pullen"
[contint]: http://www.martinfowler.com/articles/continuousIntegration.html "Continuous Integration - Martin Fowler"
[fitzstol]: http://staff.lero.ie/stol/files/2014/03/rcose2014_fitzgerald.pdf "Continuous Software Engineering and Beyond: Trends and Challenges - Brian Fitzgerald & Klaas-Jan Stol"
[restbook]: http://www.springer.com/us/book/9781461492986 "REST: Advanced Research Topics and Practical Applications - Cesare Pautasso, Erik Wilde, Rosa Alarcon"
[cis680]: http://web.cse.ohio-state.edu/~gurari/course/cis680/cis680Ch19.html "CIS 680: DATA STRUCTURES: Chapter 19: Backtracking Algorithms"

