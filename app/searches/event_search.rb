class EventSearch < Searchlight::Search

  search_on Event.includes(:category)

  searches :name, :category_name, :nearby, :nearby_radius

  def search_category_name
    search.where('`categories.name` = ?', category_name)
  end
  
  def search_nearby
    search.near(nearby, nearby_radius || 50)
  end
end