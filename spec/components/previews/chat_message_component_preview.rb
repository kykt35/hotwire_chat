class ChatMessageComponentPreview < ViewComponent::Preview
  def default
    chat_message = ChatMessage.new(role: 'user', content: 'Hello, World!')
    render(ChatMessageComponent.new(chat_message: chat_message))
  end

  def assistant
    chat_message = ChatMessage.new(role: 'assistant', content: 'Hello, World!')
    render(ChatMessageComponent.new(chat_message: chat_message))
  end
end
