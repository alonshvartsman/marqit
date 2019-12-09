class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attendance = Attendance.new

    @chat_room = Event.includes(messages: :user).find(params[:id])
  end
end
