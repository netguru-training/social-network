class User < ActiveRecord::Base
  serialize :info, Hash
  has_many :invitation
  has_many :attendances
  has_many :events, through: :attendances
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.try(:name)
      user.info = auth.info
    end
  end
end
