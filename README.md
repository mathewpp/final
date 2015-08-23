Readme
==============

To run this Rails app on your laptop:

1. Clone this repository
1. bundle install
1. rake db:migrate
1. rake db:seed
1. rails server

At this point, you should be able to browse to http://localhost:3000 and you should see a list of tweets.

About the app:
--------------
The app is inspired by twitter, but its not even close in terms of functionalities offered by twitter.
	- You need to be logged in for making tweets
	- Currently all the tweets are displayed to everyone, follower/following or joining a group does not determine in anyway how tweets are displayed to user


Models/Tables
--------------
User, Tweet, Follow, Group, GroupUser, Retweet, DirectMessage, Reply, Notification and Favorite
Notification and Favorite is not used with this version

Many To Many Relationship
--------------
- Group and GroupUser tables are conceptually similar to Lists in twitter, but only added to get a better understanding of many to many implementation, the application does not yet use values of these in any form
- User/Follow - another many to many without a relation table

Users:
--------------

- All users are lower case and alpha numeric only. 
- These are the test users, passwords are set same as username for test purposes : 
  - mathew, mit, stanford, uchicago, cnn, google, facebook, worldbank, financialtimes, wsj, nyse, cmegroup

Functionalities Supported
--------------
1. Add/Edit/Delete/Sign in and Sign Out of Users
1. Add/Edit/Delete of Tweet
1. Sending Private Messages
1. Add a group, join a group and unjoin group
1. Search for Users to follow and follow/unfollow


GitRepo:
--------------
*https://github.com/mathewpp/final*

Public Url:
--------------
*https://mathewptwitter.herokuapp.com*