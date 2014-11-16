class EventSearch < Searchlight::Search

  search_on Event.joins(:category)

  searches :title, :category_name, :nearby, :nearby_radius

  def search_title
    search.where('title LIKE ?', "%#{title}%")
  end

  def search_category_name
    search.where("categories.name LIKE ?", "%#{category_name}%")
  end

  def search_nearby
    search.near(nearby, nearby_radius || 50)
  end
end
