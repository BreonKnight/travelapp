class User < ActiveRecord::Base
  has_many :entries
  belongs_to :current_city, :class_name => "City", :foreign_key => "current_city_id"
  belongs_to :home_city, :class_name => "City", :foreign_key => "home_city_id"

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  has_secure_password

  validates_uniqueness_of :email

end
