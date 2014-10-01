module ApplicationHelper

  def create_markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, highlight: true)
    markdown.render(text).html_safe
  end

end

