class InvitationsController < ApplicationController
  
  before_action :authenticate_user
  def index
    @invitations = Invitation.where(user_id: current_user.id)
  end
end
