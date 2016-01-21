# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sf = City.create(name:"San Francisco", country:"USA", img_url: "/images/sanfrancisco.jpg")
london = City.create(name:"London", country:"England", img_url: "/images/london.jpg")
gibraltar = City.create(name:"Gibraltar", country:"Spain", img_url: "/images/gibraltar.jpg")


10.times do

  # build the user params
  user_params = Hash.new
  user_params[:email] = FFaker::Internet.email
  user_params[:password]  = "123456"
  user_params[:password_confirmation] = user_params[:password]
  user_params[:first_name] = FFaker::Name.first_name
  user_params[:last_name] = FFaker::Name.last_name


  # save the user
  new_user = User.create(user_params)
  new_user.current_city = sf
  new_user.home_city = london
  new_user.save

  # create 10 articles for each user
  2.times do
    new_entry = Entry.new
    new_entry.title = FFaker::HipsterIpsum.words(rand(8)+2).join(" ")
    new_entry.body = FFaker::HipsterIpsum.paragraphs(1+ rand(4)).join("\n")
    # save the article
    new_entry.city = sf
    new_entry.save
    # associate the article with the user
    new_user.entries << new_entry
  end
end
