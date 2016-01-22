#WDI Project 2: Backpack Story

## Intro

Backpack story is a web application where users can create blog entries about cities they've visited and also see other users' blog entries for cities around the world.

Below is an overview of the process and the tools my group used to build a full-stack web application in. We were given very basic wire frames and user stories from our "client" with freedom to improve and build upon the wire frames.

#####Our group:

* [Reva Bhatt](https://github.com/revalidate)
* [Daniel Lwo](https://github.com/danielxji6)
* [Breon Knight](https://github.com/breonknight)
* [Matthew Seegan](https://github.com/mseegan)

![Alt homepage](http://i.imgur.com/77HXTpS.png)
![Alt homepage2](http://i.imgur.com/FYjXpZE.png)
![Alt city-showpage](http://i.imgur.com/6wCBKsN.png)
![Alt entry-showpage](http://i.imgur.com/AohFpLF.png)

## Technologies Used
* **Ruby on Rails**
	* **PaperClip Gem** to allow users to upload avatar images and to add different images per city
	* **Bcrypt Gem** for user authentication
* **PostgreSQL** as our backend database
* **HTML + CSS** for all our front-end engineering. Also used **SCSS** framework to design each page
* **Bootstrap** for responsive design that works on all web platform sizes
* **RESTful Routes** designed CRUD routes using the REST convention relevant to user experience.
* **Data Validation** input forms require different types of data (accept dates, numbers & strings) and handle incorrect form inputs during create/update by validating data.
* **Git** version control used at every stage of project articulating progress throughout the week
* **Visual Design** wire framing & user stories were essential to keep branding consistent. Enhanced basic wire frames to build a beautiful app
* **Heroku**

## Features

#####1. Login & Signup
 * Log into our site if you already have an acount (I mean, who doesn't?)
 * Create a new account if you feel you are "well travelled" enough to participate in our vibrant community.
 * If the user is logged in, they may click on a link to their profile and admire themselves.
 * Go back to the homepage from any of our other end points.

#####2. City Pages
* Include an iconic image from that particular city (or territory in the case of Gibraltar
* Users can add an entry 
* These entries are then displayed on at the top of the page, under entries, with links to each individual entry

#####3. Entry Pages
* The title of the entry with the name of the user that wrote the entry
* Include city the entry is referring to (with a link to the city's page)
* The content of their post. 

#####4. User Profile
* Can edit their user information (first and last name, current city, and profile picture)
* Can edit and delete any their own existing entries

## Installation

#####Step 1
Fork and clone this project repo. This app requires Ruby version >= 2.0.0 and Rails version 3.2, >= 4.1

#####Step 2 
To run this application, you will need to install [ImageMagick](https://github.com/thoughtbot/paperclip) with Homebrew onto your computer (Mac OS X recommended)

```
$ brew install imagemagick
```

#####Step 3
In your terminal, install the proper dependencies(paperclip and bcrypt) by running the following

```
$ bundle install
```

#####Step 4
To create and setup migrations, run the following commands. To populate your database with city data, run seed.rb file in terminal. 

```
$ rake db:create db:migrate 
$ rake db:seed
```

#####Step 5
You're ready to go! Go to [http://localhost:3000/](http://localhost:3000/) to check out my project.

## Deployment
This application is already deployed on heroku [here](https://backpack-story.heroku.com/).

## Planned Features

* **Pretty URLs** to make search engine friendly URLs. There is a gem called FriendlyID creates "pretty URLs and work with human-friendly strings as if they were numeric ids".
