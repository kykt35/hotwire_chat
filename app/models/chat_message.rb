class ChatMessage < ApplicationRecord
  belongs_to :chat_room

  validates_presence_of :role, :content
end
