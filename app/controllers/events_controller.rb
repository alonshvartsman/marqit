class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attendance = Attendance.new

    @chat_room = @event.chat_room
    # authorize @messages
  end
end
