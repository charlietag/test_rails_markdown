module ApplicationHelper
  def kramdown(text)
    sanitize Kramdown::Document.new(text,  {auto_ids: false, footnote_nr: 5}).to_html
  end
end
