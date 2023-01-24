module ApplicationHelper

  def format_date(date)
    layout_format = date.strftime("%Y-%m-%d %H:%M")
    layout_format
  end

end
