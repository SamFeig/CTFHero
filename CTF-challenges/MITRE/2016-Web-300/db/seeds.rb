# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

first_user = User.create(name: 'fank', email: 'fank@fank.com', password: 'f2rekus5eX_P8ya5ru2rapREyeruf83w', password_confirmation: 'f2rekus5eX_P8ya5ru2rapREyeruf83w')
Message.create(title: 'Hey there', body: 'Need to remember this: 763d661f088cbd9e83ed2d3f6c4865cca6f1d284', receiving_user: first_user, sending_user: first_user)