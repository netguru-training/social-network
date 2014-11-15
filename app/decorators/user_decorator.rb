class UserDecorator < Draper::Decorator
  delegate_all

  def image
    info.image || '' if info
  end

  def location
    info.location if info
  end
end
