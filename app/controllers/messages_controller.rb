class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @message.chat_room = @chat_room
    @message.user = current_user
    @message.event = current_event
    if @message.save
      respond_to do |format|
        format.html { redirect_to event(current_event) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "events/show" }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
