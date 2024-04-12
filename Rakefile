# frozen_string_literal: true

require "./lib/resume_generator"
require "standard/rake"

task default: %i[spec standard]

namespace :gen do
  task :resume, [:file] do |_, args|
    ResumeGenerator.new 'resume', args[:file]
  end

  task :cover, [:file] do |_, args|
    ResumeGenerator.generate 'cover', args[:file]
  end
end
