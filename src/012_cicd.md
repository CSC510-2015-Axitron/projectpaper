####Continuous Delivery/Continuous Deployment

Deployment is an important feature with our particular project. Initially we received feedback that it would be a major fault in our design if the games needed to be installed locally to be played. Taking that feedback to heart we looked for a good way to deploy our game to the web in a way that it would be easy to visit for any particular user. Given that prior to this feedback we already were using Travis CI it seemed most logical to look for a deployment option that would sync well with our continuous integration system.

This is where the idea of Continuous Deployment comes in to play.  Per [Fitzgerald and Stol][fitzstol], "Continuous deployment is the practice of continuously deploying good software builds automatically to some environment, but not necessarily to actual users." While continuous delivery is an extension of that process to deployment to actual customers.  Initially our process would have been defined as continuous deployment, but if we ever have "customers" we would be in a position of continuous delivery.

