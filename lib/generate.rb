# frozen_string_literal: true
require 'grover'

class Generate
  def initialize type, name
    @type = type
    @name = name
  end

  def get_html
    MarkdownFile.new(@type, @name).to_html
  end

  def path
    "dist/#{@type}/#{@name}.pdf"
  end

  def styles
    {
      viewport: {
        width: 595,
        height: 842,
      },
      margin: { top: '64px', right: '42px', bottom: '64px', left: '42px' },
      style_tag_options: [{
        path: 'assets/styles/style.css'
      }],
      omitBackground: true,
      printBackground: true,
      path: path,
      extra_http_headers: { 'Accept-Language': 'en-US' },
    }
  end

  def to_pdf
    Grover.new(get_html, **styles).to_pdf
    
    "Saved to #{path}"
  end
end
