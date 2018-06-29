# frozen_string_literal: true

module PageObject
  class HomePage < Base
    def goto_home_page
      visit root_path
    end
  end
end
