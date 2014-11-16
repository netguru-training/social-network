class Category < ActiveRecord::Base
  has_many :groups
  has_many :events, :foreign_key => "cetegory_id" 
end
