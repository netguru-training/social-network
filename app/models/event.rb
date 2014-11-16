class Event < ActiveRecord::Base
  belongs_to :category
<<<<<<< HEAD
  belongs_to :user
=======
  has_many :users
>>>>>>> 8c31d95a8ad688152b133d9781e9242f0590bbfc
  validates_presence_of :title, :time, :description, :location
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
end
