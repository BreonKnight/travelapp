class User < ActiveRecord::Base
  has_many :entries
  belongs_to :current_city, :class_name => "City", :foreign_key => "current_city_id"
  belongs_to :home_city, :class_name => "City", :foreign_key => "home_city_id"

  has_secure_password
end
