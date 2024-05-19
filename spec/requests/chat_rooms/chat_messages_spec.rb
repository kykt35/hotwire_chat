require 'rails_helper'

RSpec.describe "ChatRooms::ChatMessages", type: :request do
  describe "POST /chat_rooms/:chat_room_id/chat_messages" do
    let(:chat_room) { create(:chat_room) }
    let(:valid_attributes) { { chat_message: { content: "Hello, World!" } } }
    let(:headers) { { Accept: 'text/vnd.turbo-stream.html' } }

    subject { post chat_room_chat_messages_url(chat_room), params:, xhr: true, headers: headers }

    context "with valid parameters" do
      let!(:params) { valid_attributes }
      it "creates a new ChatMessage" do
        expect { subject }.to change(ChatMessage, :count).by(+2)
      end
    end

    context "with invalid parameters" do
      let!(:params) { { chat_message: { content: "" } } }
      it "does not create a new ChatMessage" do
        expect { subject }.not_to change(ChatMessage, :count)
      end
    end
  end
end
