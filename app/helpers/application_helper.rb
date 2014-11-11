module ApplicationHelper

  def create_markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, highlight: true)
    markdown.render(text).html_safe
  end

  def truncate(text, options = {}, &block)
  if text
    length  = options.fetch(:length, 300)

    content = text.truncate(length, options)
    content = options[:escape] == false ? content.html_safe : ERB::Util.html_escape(content)
    content << capture(&block) if block_given? && text.length > length
    content
  end
  end

  def hashtag_search(text)
    hashtag = text.scan(/#\w+/)
    hashtag.each { |tag|
      unless tag == '#39'
        url = tag.gsub('#', '')
        text.gsub!(tag, "<a href='/searches?utf8=✓&search=#{url}'>#{tag}</a>")
      end
    }
    text.html_safe
  end

  end


