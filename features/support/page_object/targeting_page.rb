# frozen_string_literal: true

module PageObject
  class TargetingPage < Base
    def go
      visit targeting_path
    end

    def search_with_term(search_term)
      find("#search_input").send_keys(search_term)

      # Overcome the bug affecting CTAs are not always shown
      Capybara.current_session.execute_script("scrollTo(100, 0)")
    end

    def select_category(category_identifier)
      click_selection(category_identifier)
    end

    def select_company(company_identifier)
      click_selection(company_identifier)
    end

    def assert_company_targeting_path(category_identifier)
      page.assert_current_path company_targeting_path(category_identifier)
    end

    def assert_selected_inquiry_category(inquiry_category)
      within(".manager__cat-select__categories--selected") do
        find("[data-id='#{inquiry_category[:category]}']", visible: true)
      end
    end

    def company_targeting_path(category_identifier)
      "/de/app/mandate/targeting/company/#{category_identifier}"
    end

    def targeting_path
      "/de/app/mandate/targeting"
    end

    private

    def click_selection(id)
      find("[data-id='#{id}']").click
    end
  end
end
