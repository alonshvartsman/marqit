class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attendance = current_user.attending?(@event) ? Attendance.find_by(event: @event, user: current_user) : Attendance.new
    @chat_room = @event.chat_room
    # authorize @messages
  end
end
