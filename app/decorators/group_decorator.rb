class GroupDecorator < Draper::Decorator
  delegate_all
  decorates :group

  def cat_name
    object.category.name
  end

end
