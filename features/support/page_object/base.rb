# frozen_string_literal: true

module PageObject
  class Base
    include Capybara::DSL
    include RSpec::Matchers
    include ActionDispatch::Routing::PolymorphicRoutes
    include Rails.application.routes.url_helpers
  end
end
