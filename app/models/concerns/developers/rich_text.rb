module Developers
  module RichText
    require 'redcarpet/render_strip'

    def rich_text_bio
      @rich_text_bio ||= markdown.render(bio).strip
    end

    def plain_text_bio
      @plain_text_bio ||= plain_text_markdown.render(bio).strip
    end

    private

    # https://github.com/vmg/redcarpet#darling-i-packed-you-a-couple-renderers-for-lunch
    MARKDOWN_OPTIONS = {
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      highlight: true,
      strikethrough: true,
      superscript: true,
      underline: true
    }.freeze
    RENDER_OPTIONS = {
      filter_html: true,
      hard_wrap: true,
      no_images: true,
      no_links: true,
      no_styles: true
    }.freeze

    def renderer
      @renderer ||= Redcarpet::Render::HTML.new(RENDER_OPTIONS)
    end

    def markdown
      @markdown ||= Redcarpet::Markdown.new(renderer, MARKDOWN_OPTIONS)
    end

    def plain_text_renderer
      @plain_text_renderer ||= Redcarpet::Render::StripDown
    end

    def plain_text_markdown
      @plain_text_markdown ||= Redcarpet::Markdown.new(plain_text_renderer, MARKDOWN_OPTIONS)
    end
  end
end