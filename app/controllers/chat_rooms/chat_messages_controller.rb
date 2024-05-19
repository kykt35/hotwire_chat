class ChatRooms::ChatMessagesController < ApplicationController
  before_action :_set_chat_room

  def create
    user_message = @chat_room.chat_messages.create!(chat_message_params.merge(role: 'user'))
    user_message.broadcast_append_to(
      @chat_room,
      target: 'chat-messages',
      html: ChatMessageComponent.new(chat_message: user_message).render_in(view_context)
    )

    asistant_message = @chat_room.chat_messages.create!(role: 'assistant', content: 'Hello, World!')

    sleep 1 # Simulate a delay in the assistant's response

    asistant_message.broadcast_append_to(
      @chat_room,
      target: 'chat-messages',
      html: ChatMessageComponent.new(chat_message: asistant_message).render_in(view_context)
    )
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
  end

  private
    def _set_chat_room
      @chat_room = ChatRoom.find(params[:chat_room_id])
    end

    def chat_message_params
      params.require(:chat_message).permit(:content)
    end
end
