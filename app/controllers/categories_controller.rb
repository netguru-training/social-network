class CategoriesController < ApplicationController

  before_action :authenticate_user

  expose(:categories)
  expose(:category)
  expose(:events) { category.events}

  def index
  end

  def show

  end

end
