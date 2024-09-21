# frozen_string_literal: true
require 'github/markup'

class MarkdownFile
  def initialize file, invert=false
    @file = file
  end
  
  def file_contents
    begin
      File.read(@file)
    rescue Errno::ENOENT
      raise "Cannot find file at #{@file}"
    end
  end

  def to_html
    "<html>
      <meta http-equiv='content-type' content='text/html; charset=utf-8' />
      <body class='markdown-body'>
        #{GitHub::Markup.render_s(GitHub::Markups::MARKUP_MARKDOWN, file_contents)}
      </body>
    </html>"
  end
end
