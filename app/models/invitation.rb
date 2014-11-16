class Invitation < ActiveRecord::Base
  validates_presence_of :message, :user_id
  belongs_to :user
  belongs_to :event
  after_save :defaults

  private
    def defaults
      message ||= "false"
    end
end
