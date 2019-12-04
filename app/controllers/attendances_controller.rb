class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new
    @event = Event.find(params[:event_id])
    @attendance.event = @event
    @attendance.user = current_user
    if @attendance.save
      redirect_to dashboard_path
    else
      render 'events/show'
    end
  end
end
