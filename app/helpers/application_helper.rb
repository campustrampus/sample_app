module ApplicationHelper
  
  #Returns the full title or default title
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sampl App"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
