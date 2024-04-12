# frozen_string_literal: true

Dir['./lib/*.rb'].each { |file| require file }

class ResumeGenerator
  def initialize type, file
    generator = Constants::TYPE[type.to_sym] || Constants::TYPE[:Resume]
    gen = Generate.new(generator, file).to_pdf
    puts gen
  end
end
