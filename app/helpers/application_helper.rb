module ApplicationHelper
  def description_substring(description)
    if description.length > 15
    "#{description[0..15]} ..."
    else
    "#{description}"
    end
  end 
end
