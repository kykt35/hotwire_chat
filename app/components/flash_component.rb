# frozen_string_literal: true

class FlashComponent < ViewComponent::Base
  def initialize(flash:)
    super
    @flash = flash
  end
end
