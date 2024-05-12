class ChatRoomComponentPreview < ViewComponent::Preview
  def default
    chat_room = ChatRoom.new(name: 'Room1')
    render(ChatRoomComponent.new(chat_room: chat_room))
  end
end
