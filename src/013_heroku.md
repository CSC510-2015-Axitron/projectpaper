####Heroku

The last step in our continuous integration process as described above is deployment to [Heroku](http://wwww.heroku.com "Heroku"). Heroku is a full featured deployment system for web applications. It functions in somewhat the same fashion as Travis CI in that it runs on cloud infrastructure in a PAAS (Platform As A Service) configuration. The "dyno" is for Heroku what would be a node on many other services. It is essentially a virtualized server running on some sort of cloud infrastructure. Again for Heroku it would be possible to use an IAAS cloud service to create the same sort of setup, but Heroku has a large number of features going for it as follows:

- Heroku is free for five "dynos"
- There's no real setup aside from knowing that Heroku exists and setting up package.json, and .travis.yml to link to your account.
- Heroku creates fairly short URL's that are publicly accessible and assigned according to your specifications (as long as a particular name is available), additionally Heroku offers the ability to use commercially available domain names should you own a domain name you'd like to use.
- Heroku has a number of addons that increase the functionality that is available, our project utilized an addon that will be discussed in the database section of this paper.
- Scalability is another strong factor in favor of Heroku since it is simple to add in more "dynos" if necessary to deal with load issues

Our project is using two dynos currently. One dyno is being used for running the game ([Axemaze](http://axemaze.herokuapp.com/ "Axemaze")), the other dyno is being used for our database and REST API ([Axemaze-DB](http://axemaze-db.herokuapp.com)). The benefit of using Heroku for both was that we could build our database functionality in another branch of the same GitHub repository and then on pushes to either branch Travis CI builds and then deploys to Heroku. This configuration is shown in the image at the top of this section.

Travis CI actually operates as a sort of gatekeeper in this configuration. The deploy routine to Hroku is only ever run if our unit tests pass. That can be expanded to taking into account things like test coverage, and static analysis. For instance, should a particular commit be tested and only have 10 percent statement coverage that commit can be rejected and not be delployed. This enforces code quality and can be a very powerful tool. Our process had simply not reached a point of maturity where those metrics could be employed beyond passing unit tests.

