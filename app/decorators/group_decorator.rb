class GroupDecorator < Draper::Decorator
  delegate_all

  def cat_name
    object.category.name
  end

end
