class ChatRooms::ChatMessagesController < ApplicationController
  before_action :set_chat_room

  def create
    user_message = @chat_room.add_user_message!(content: chat_message_params[:content])
    # This is where the user message is broadcasted
    bloadcast_message user_message

    # This is where the assistant responds
    asistant_message = @chat_room.chat_completion

    # This is where the assistant message is broadcasted
    bloadcast_message asistant_message
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
  end

  private
    def set_chat_room
      @chat_room = ChatRoom.find(params[:chat_room_id])
    end

    def chat_message_params
      params.require(:chat_message).permit(:content)
    end

    def bloadcast_message(message)
      Turbo::StreamsChannel.broadcast_append_to(
        @chat_room,
        target: 'chat-messages',
        html: ChatMessageComponent.new(chat_message: message).render_in(view_context)
      )
    end
end
