# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChatRoomComponent, type: :component do
  it "renders" do
    render_preview(:default)
    expect(page).to be_truthy
  end
end
