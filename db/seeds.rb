# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tweet.delete_all
User.delete_all

user_data = JSON.parse(open('db/users.json').read)
tweet_data = JSON.parse(open('db/tweets.json').read)

user_data.each do |user_hash|
  user = User.new
  user.user_name = user_hash['user_name']
  user.password = user_hash['password']
  user.email = user_hash['email']
  user.photo_url = user_hash['photo_url']
  user.name = user_hash['name']
  user.save
end

tweet_data.each do |tweet_hash|
  user = User.find_by(user_name: tweet_hash['user_name'])
  tweet = Tweet.new
  tweet.user_id = user.id
  tweet.content = tweet_hash['content']
  tweet.photo_url = tweet_hash['photo_url']
  tweet.create_time = tweet_hash['create_time']
  tweet.save
end