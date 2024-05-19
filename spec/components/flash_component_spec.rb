# frozen_string_literal: true

require "rails_helper"

RSpec.describe FlashComponent, type: :component do
  it "renders a flash message" do
    render_preview(:default)
    expect(page).to be_truthy
  end
end
