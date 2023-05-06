# frozen_string_literal: true

require 'httparty'
require_relative "screenshots_pagepixels/version"
require_relative "screenshots_pagepixels/client"

module ScreenshotsPagepixels
  class Error < StandardError; end
end