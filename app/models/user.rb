class User < ActiveRecord::Base
  serialize :info, Hash
  def image
    auth_data['image'] || '' if auth_data
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name || '' if auth.info
      user.info = auth.info
    end
  end
end
