# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do

  # build the user params
  user_params = Hash.new
  user_params[:email] = FFaker::Internet.email
  user_params[:password]  = "123456"
  user_params[:password_confirmation] = user_params[:password]
  user_params[:first_name] = FFaker::Name.first_name
  user_params[:last_name] = FFaker::Name.last_name

  city_params = Hash.new
  city_params[:name] = FFaker::Address.city
  city_params[:country]  = FFaker::Address.country

  # save the user
  new_user = User.create(user_params)
  # save the city
  new_city = City.create(city_params)

  # create 10 articles for each user
  2.times do
    new_entry = Entry.new
    new_entry.title = FFaker::HipsterIpsum.words(rand(8)+2).join(" ")
    new_entry.body = FFaker::HipsterIpsum.paragraphs(1+ rand(4)).join("\n")
    # save the article
    new_entry.save
    # associate the article with the user
    new_user.entries.push new_entry
  end

end
