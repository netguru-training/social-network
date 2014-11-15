class User < ActiveRecord::Base
  serialize :info, Hash

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name || '' if auth.info
      user.info = auth.info
    end
  end
end
