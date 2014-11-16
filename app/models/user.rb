class User < ActiveRecord::Base
  serialize :info, Hash
<<<<<<< HEAD
  has_many :events, :foreign_key => "user_id" 
=======
  has_many :invitation

>>>>>>> 8c31d95a8ad688152b133d9781e9242f0590bbfc
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.try(:name)
      user.info = auth.info
    end
  end
end
