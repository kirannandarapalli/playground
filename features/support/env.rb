# frozen_string_literal: true

require "cucumber/rails"
require "cucumber/formatter/unicode"
require "capybara/rspec"
require "spreewald_support/tolerance_for_selenium_sync_issues"

Dir.glob(Rails.root.join("features", "support", "**", "*.rb")).each { |file| require file }

ActionController::Base.allow_rescue = false

Before "@smoke" do
  Capybara.app_host = ENV.fetch("CUCUMBER_TARGET_URL")
end

Capybara.server_port = 3001
Capybara.app_host = nil

include PageObject
include Helpers::TableHelper
include Helpers::ClickHelper
