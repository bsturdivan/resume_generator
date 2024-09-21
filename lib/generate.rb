# frozen_string_literal: true
require 'grover'

class Generate
  def initialize file, dir, name
    @file = file
    @name = name
    @dir = dir

    FileUtils.touch path
  end

  def get_html
    MarkdownFile.new(@file).to_html
  end

  def path
    "#{@dir}/#{@name}.pdf"
  end

  def styles
    {
      viewport: {
        width: 595,
        height: 842,
      },
      margin: { top: '48px', right: '36px', bottom: '48px', left: '36px' },
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
    
    "Saved to #{@dir}"
  end
end
