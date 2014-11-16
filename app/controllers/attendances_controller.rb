class AttendancesController < ApplicationController
  
  expose(:event)

  def new
    Attendance.create(event_id: event.id, user_id: 1)
    redirect_to events_path
  end

  def create
  end

end
