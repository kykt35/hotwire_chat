# frozen_string_literal: true

class ChatMessageComponent < ViewComponent::Base
  def initialize(chat_message:)
    super
    @chat_message = chat_message
  end
end
