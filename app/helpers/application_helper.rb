# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def get_color_code(i)
    case i
    when 0
      '#0000ff'
    when 1
      '#0099ff'
    when 2
      '#0ff'
    when 3
      '#c00'
    when 4
      '#99cc00'
    when 5
      '#ff0'
    when 6
      'DarkMagenta'
    when 7
      'DarkSlateGray'
    when 8
      'Blue'
    when 9
      'Gold'
    when 10
      'Gray'
    when 11
      'Black'
    end
  end
  
end
