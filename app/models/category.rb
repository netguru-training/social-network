class Category < ActiveRecord::Base
  has_many :groups
  has_many :events, :foreign_key => "category_id" 

end
