class UserDecorator < Draper::Decorator
  delegate_all

  def image
    info['image'] || '' if info
  end
end
