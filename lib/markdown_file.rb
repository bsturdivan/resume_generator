# frozen_string_literal: true
require 'github/markup'

class MarkdownFile
  def initialize type, name, invert=false
    @type = type
    @name = name
  end

  def path
    "assets/#{@type}/#{@name}.md"
  end
  
  def file_contents
    begin
      File.read(path)
    rescue Errno::ENOENT
      raise "Cannot find file at #{path}"
    end
  end

  def to_html
    "<html>
      <meta http-equiv='content-type' content='text/html; charset=utf-8' />
      <body>
        #{GitHub::Markup.render_s(GitHub::Markups::MARKUP_MARKDOWN, file_contents)}
      </body>
    </html>"
  end
end
