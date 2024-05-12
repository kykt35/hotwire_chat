# frozen_string_literal: true

class ChatRoomComponent < ViewComponent::Base
  def initialize(chat_room:)
    super
    @chat_room = chat_room
  end
end
