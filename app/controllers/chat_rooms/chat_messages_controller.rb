class ChatRooms::ChatMessagesController < ApplicationController
  before_action :_set_chat_room

  def create
    @chat_messages = []
    @chat_messages << @chat_room.chat_messages.create!(chat_message_params.merge(role: 'user'))
    @chat_messages << @chat_room.chat_messages.create!(role: 'assistant', content: 'Hello, World!')

    # flash.now.notice = 'Chat message created'
    render :create, locals: { chat_messages: @chat_messages }
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    # render 'chat_rooms/show'
  end

  private
    def _set_chat_room
      @chat_room = ChatRoom.find(params[:chat_room_id])
    end

    def chat_message_params
      params.require(:chat_message).permit(:content)
    end
end
