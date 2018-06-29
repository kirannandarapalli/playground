# frozen_string_literal: true

module Helpers
  module ClickHelper
    def force_click(css_selector)
      Capybara.current_session.execute_script("document.querySelector('#{css_selector}').click()")
    end

    def click_cta
      force_click(".btn-primary.btn--mobile-block")
    end

    def click_next_arrow_cta
      force_click(".btn--arrow.btn-primary")
    end
  end
end
