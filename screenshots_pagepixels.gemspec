# frozen_string_literal: true

require_relative "lib/screenshots_pagepixels/version"

Gem::Specification.new do |spec|
  spec.name = "screenshots_pagepixels"
  spec.version = ScreenshotsPagepixels::VERSION
  spec.authors = ["PagePixels LLC"]
  spec.email = ["support@pagepixels.com"]

  spec.summary = "A Ruby Gem for interacting with the PagePixels API for automated screenshot capturing, multi-step screenshots (login to web pages, click links, etc), and change notifications"
  spec.description = "PagePixels Screenshots is a Ruby Gem that provides a simple and easy-to-use interface for working with the PagePixels API. With this gem, you can easily capture screenshots, manage screenshot configurations, create recurring screenshot schedules, setup multi-step screenshots, and more. PagePixels Screenshots provides convenient methods that wrap around the API endpoints, making it easy to get started and integrate with your application."
  spec.homepage = "https://pagepixels.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/PagePixels/screenshots_pagepixels-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/PagePixels/screenshots_pagepixels-ruby/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      puts f.inspect
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor]) || File.extname(f) == '.gem'
    end
  end
  puts spec.files.inspect
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'httparty', '~> 0.18.1'
  spec.add_development_dependency "rspec", "~> 3.0"
end
