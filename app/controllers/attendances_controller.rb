class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new
    @event = Event.find(params[:event_id])
    @attendance.event = @event
    @attendance.user = current_user
    # render 'events/show' if @attendance.save
    if @attendance.save
      redirect_to event_path(@event)
    else

      raise
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @event = @attendance.event
    @attendance.destroy
    redirect_to event_path(@event)
  end
end
