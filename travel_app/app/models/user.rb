class User < ActiveRecord::Base
  has_many :entries
  has_many :primary_tickets, :class_name => "City", :foreign_key => "current_user"
  has_many :secondary_tickets, :class_name => "City", :foreign_key => "home_city"

  has_secure_password
end
