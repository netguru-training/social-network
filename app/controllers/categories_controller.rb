class CategoriesController < ApplicationController

  expose(:categories)
  expose(:category)
  expose(:events) { category.events}

  def index
  end

  def show

  end

end
