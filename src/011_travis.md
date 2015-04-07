####Travis-CI

Our continuous integration process is orchestrated using a tool called [Travis CI](https://travis-ci.org "Travis CI"). Travis CI is a company that offers cloud based build server functionality for free. The build server is what takes care of the automated build part of Fowler's definition of continuous integration. There are a number of advantages in going with a hosted build server:

- It's free: This is obviously one of the biggest advantages, but may not be the case in the future.
- Setting up a build server yourself can be time consuming.
- Running a build server for a team can require either using IAAS (infrastructure as a service) based servers from a provider such as [Amazon Web Services](http://aws.amazon.com/ "Amazon Web Services"), or having your own hardware infrastructure.  Both of which can be quite costly.
- Travis CI is very simple to configure, all configuration takes place in a file called `.travis.yml`.  It uses the [.yml](http://yaml.org/ "YAML Ain't Markup Language") file format which is very quick to pick up for any seasoned developer.

Travis CI has a nice notification system for broken builds. When a user makes a commit that breaks the build they are emailed with a broken build notice. The default setting has debatable merit: Only the user that made the faulty commit is notified. This is great when all team members check their email and respond to broken builds quickly, but not so great with group members that ignore their email. That said, Travis-CI provides badges for github repos to indicate whether the build is broken or not. This badge is at the top of our README in our github repo.

Our project used Travis CI to conduct a number of different tasks that needed to be completed to determine whether the project was successfully building or failing. The tasks are as follows: First and most importantly we used Travis CI to run our unit tests. Travis CI's build boxes are in effect normal Linux virtual machines running on cloud infrastructure that have a very particular boot and run proceedure. Whenever a push is made to our git repository, Travis CI receives a build request. Their system boots up a virtual machine according to the specifications indicated in the .travis.yml file and pulls the contents of the repository into a directory on the build box. The build box then installs any needed modules per our package.json file and runs our test proceedure.

The testing and static analysis is as follows: 

- Run unit tests using [Mocha](http://mochajs.org/ "Mocha") as detailed elsewhere in the paper
- Run unit test coverage analysis using [istanbul](https://github.com/gotwarlost/istanbul "gotwarlost/istanbul")
- Run static analysis using [JSHint](http://jshint.com/ "JSHint")
- Finally run Heroku deployment, as will be discussed later

