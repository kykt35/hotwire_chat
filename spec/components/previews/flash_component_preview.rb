class FlashComponentPreview < ViewComponent::Preview
  def default
    render(FlashComponent.new(flash: { notice: 'This is a notice' }))
  end
end
