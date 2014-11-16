class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.where("user_id=#{current_user.id}")
  end
end
