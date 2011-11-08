module ApplicationHelper

  require "uri"

  def form_errors!(resource)
    if resource.errors.present?
      content_tag :div, :class => "alert-message error" do
        (content_tag :p, "Whoops, Try Again", :style => "margin-bottom: 3px; font-weight: bold;").html_safe +
          resource.errors.full_messages.map { |msg| content_tag(:p, msg) }.join.html_safe
      end
    end
  end

  def markdown_render(text)
    markdown = Redcarpet.new(text)
    markdown.to_html.html_safe
  end

  def format_url(url)
    return nil if url.nil?
    uri = URI.parse(url)
    url.match(/:\/\//) ? uri.to_s : "http://#{uri.to_s}"
  rescue URI::InvalidURIError => e
    return nil
  end

end
