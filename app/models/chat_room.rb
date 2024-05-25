require "langchain"

class ChatRoom < ApplicationRecord
  has_many :chat_messages, dependent: :destroy

  validates :name, presence: true

  def add_user_message!(content:)
    chat_messages.create!(content: content, role: "user")
  end

  def chat_completion
    messages = chat_messages.map { |msg| { role: msg.role, content: msg.content }}
    res = llm.chat(messages: messages).completion

    chat_messages.create!(content: res, role: "assistant")
  end

  def llm
    @llm ||= Langchain::LLM::OpenAI.new(api_key: ENV["OPENAI_API_KEY"])
  end

  def thread
    @thread ||= Langchain::Thread.new
  end
end
