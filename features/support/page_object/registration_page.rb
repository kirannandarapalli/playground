# frozen_string_literal: true

module PageObject
  class RegistrationPage < Base
    attr_reader :customer, :profiling_page

    def initialize(customer, profiling_page=ProfilingPage.new)
      @customer = customer
      @profiling_page = profiling_page
    end

    def go
      visit "signup"
    end

    def fill_profiling_form
      profiling_page.fill_first_name(customer.first_name)
      profiling_page.fill_last_name(customer.last_name)
      profiling_page.fill_birthdate(customer.birthdate)
      profiling_page.fill_street(customer.address_line1)
      profiling_page.fill_house_number(customer.house_number)
      profiling_page.fill_place(customer.place)
      profiling_page.fill_zip_code(customer.zip_code)
      profiling_page.fill_email(customer.email)
    end

    def fill_phone_number
      page.assert_current_path(phone_verification_path)
      fill_in "text-field-phone", with: customer.phone_number
    end

    def assert_registration_steps(table)
      elems = find("ol.circle-list").all("li p")
      actual = elems.map(&:text)

      expect(actual).to eq table.rows.flatten
    end

    def assert_confirming_path
      page.assert_current_path confirming_path
    end

    def assert_phone_verification_content(content)
      expect(page).to have_content content
    end

    def assert_cockpit_preview_url
      page.assert_current_path(cockpit_preview_path)
    end

    def fill_verification_token(token)
      (1..4).each { |num| find("#digit-input-#{num}").set(token[num - 1]) }
    end

    def obtain_verification_token
      phone_verification_service.(customer.phone_number)
    end

    def click_add_insurances_button
      force_click ".manager__cockpit__add-insurances-cta__btn"
    end

    def click_add_signature_button
      force_click ".mandate-confirmation__signature__cta"
    end

    def click_complete_targeting
      find(".btn-primary", visible: true)
      click_next_arrow_cta
    end

    def draw_signature
      within_frame(find("#insign-iframe")) do
        element = find("canvas.wizard-confirmation__signature__canvas-wrapper__canvas")
        page.driver.browser.action.move_to(element.native, 122, 91)
          .click_and_hold
          .move_to(element.native, 60, 90)
          .move_to(element.native, 50, -80)
          .move_to(element.native, 60, 90)
          .move_to(element.native, -70, -70)
          .move_to(element.native, -80, 90)
          .release
          .perform
      end
    end

    def phone_verification_path
      "/de/app/mandate/phone-verification"
    end

    def cockpit_preview_path
      "/de/app/mandate/cockpit-preview"
    end

    def confirming_path
      "/de/app/mandate/confirming"
    end

    def click_cta_in_signature_modal
      force_click ".mandate-confirmation__signature-modal__cta"
    end

    def enter_password
      fill_in 'mandate_register_password', with: 'Test1234'
    end

    def finished_path
      "/de/app/mandate/finished"
    end

    def assert_finished_path
      page.assert_current_path finished_path
    end

    def manager_path
      "/de/app/manager"
    end

    def assert_manager_path
      page.assert_current_path manager_path
    end

    def click_cta_zur_ubersicht
      force_click ".btn--mobile-block"
    end

    def cockpit_preview_variation(variation_name)
      variation = {variation: variation_name}.to_json
      js = "window.localStorage.setItem('cockpit-preview-experiment', '#{variation}')"

      Capybara.current_session.execute_script(js)
    end
  end
end
