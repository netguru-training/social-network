class Category < ActiveRecord::Base
  has_many :groups
  has_many :events
end
