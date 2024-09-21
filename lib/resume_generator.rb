# frozen_string_literal: true

Dir['./lib/*.rb'].each { |file| require file }

class ResumeWatcher
  def initialize path, dir, name
    gen = Generate.new(path, dir, name).to_pdf
    puts gen
  end
end
