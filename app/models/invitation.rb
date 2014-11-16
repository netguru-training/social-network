class Invitation < ActiveRecord::Base
  validates_presence_of :message
  belongs_to :user
  belongs_to :event
  after_save :defaults

  private
    def defaults
      message ||= "User #{self.user.name} invited you to join #{self.event.name} event"
    end
end
