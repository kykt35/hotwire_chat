require 'rails_helper'

RSpec.describe ChatMessage, type: :model do
  describe 'associations' do
    it { should belong_to(:chat_room) }
  end

  describe 'validations' do
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:content) }
  end
end
