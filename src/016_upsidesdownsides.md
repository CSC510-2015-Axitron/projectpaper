####Upsides and Downsides of Infrastructure

This final section on our infrastructure attempts to answer whether all of this is worth it or not and what we are really getting for all of this effort.  It seems clear from the above material that there are many strong benefits to the way our process came together, but the most important benefits are the ways that this infrastructure allowed us to work together efficiently.  Those benefits are as follows:

- Notifications on broken builds
- Prevention of faulty builds being deployed
- Quick feedback on work's success or failure
- Simple automatic deployment
- It is all free so no one person had to pay for it

The downsides are also easy to spell out:  First and most detrimental is the fact that all of these services represent a risk to whether the application can be deployed or built.  If one service was to go down our work flow and our game may not work at all, or may only work partially.  This risk is present for many companies that run their businesses on the web today.  A large number of massive companies, as seen in Amazon's case studies page [here](http://aws.amazon.com/solutions/case-studies/ "Customer Success. Powered by the AWS Cloud.") use AWS (Amazon Web Services), services that are very similar to the services we have leveraged, so it does represent a sort of risk for the industry as a whole.  That said, our project makes use of multiple services that are backed by potentially a higher multiple of services which makes our risk level much higher than it would be using only one provider.  

Another potential downside here is the possibility that all of these services in the future could become pay to play.  Right now all of this is free, but it seems hard to believe that that will be the case in perpetuity.  We have already dealt with this downside in the fact that during the time we worked on this project JawsDB went from a free beta offering to a monthly subscription fee.  Luckily the fee will only begin to be charged at the beginning of May.  This is an area where we could easily create the same service in Heroku or elsewhere, but should a service like Travis CI or Heroku become a paid service it would be difficult to replace.

Finally the amount of time required to research, set up, and put into place all of these services is non-trivial.  One member of the team spent a large portion of his time doing the work required to set all of the services involved up.  That represents a trade-off for the team overall:  Would the project have been better off with the work of this extra team member on the project itself, or do the benefits to productivity for the team as a whole outstrip any additional effort that would have been leveraged on the project? That call is best left to the reader, rather than be made by an over-presumptuous writer.

