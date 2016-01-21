class City < ActiveRecord::Base
  has_many :users, class_name: "User", foreign_key: "current_city_id"
  has_many :entries
end
