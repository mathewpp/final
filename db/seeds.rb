# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

GroupUser.delete_all
Group.delete_all
Tweet.delete_all
Follow.delete_all
User.delete_all

user_data = JSON.parse(open('db/users.json').read)
tweet_data = JSON.parse(open('db/tweets.json').read)
group_data = JSON.parse(open('db/groups.json').read)
group_user_data = JSON.parse(open('db/groupuser.json').read)
follow_data = JSON.parse(open('db/follow.json').read)

user_data.each do |user_hash|
  user = User.new
  user.user_name = user_hash['user_name'].downcase
  user.password = user_hash['password'].downcase
  user.email = user_hash['email'].downcase
  user.photo_url = user_hash['photo_url']
  user.name = user_hash['name']
  user.save
end

tweet_data.each do |tweet_hash|
  user = User.find_by(user_name: tweet_hash['user_name'].downcase)
  tweet = Tweet.new
  tweet.user_id = user.id
  tweet.content = tweet_hash['content']
  tweet.photo_url = tweet_hash['photo_url']
  tweet.create_time = tweet_hash['create_time']
  tweet.save
end

group_data.each do |group_hash|
  group = Group.new
  group.name = group_hash['name']
  group.description = group_hash['description']
  group.save
end

group_user_data.each do |group_user_data_hash|
  group_user = GroupUser.new
  group_user.group_id = Group.find_by(name: group_user_data_hash['group_name']).id
  group_user.user_id = User.find_by(user_name: group_user_data_hash['user_name'].downcase).id
  group_user.save
end

follow_data.each do |follow_hash|
  follow = Follow.new
  follow.followed_id =  User.find_by(user_name: follow_hash['followed'].downcase).id
  follow.follower_id = User.find_by(user_name: follow_hash['follower'].downcase).id
  follow.save
end