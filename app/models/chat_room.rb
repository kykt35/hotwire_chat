class ChatRoom < ApplicationRecord
  has_many :chat_messages, dependent: :destroy

  validates :name, presence: true
end
