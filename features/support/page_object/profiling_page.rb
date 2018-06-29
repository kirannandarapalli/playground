# frozen_string_literal: true

module PageObject
  class ProfilingPage < Base
    def assert_profiling_page
      page.assert_current_path profiling_page_path
    end

    def fill_first_name(first_name)
      fill_in "mandate_first_name", with: first_name
    end

    def fill_last_name(last_name)
      fill_in "mandate_last_name", with: last_name
    end

    def fill_birthdate(birthdate)
      fill_in "mandate_birthdate", with: birthdate
    end

    def fill_street(street)
      fill_in "mandate_street", with: street
    end

    def fill_house_number(house_number)
      fill_in "mandate_house_number", with: house_number
    end

    def fill_zip_code(zip_code)
      fill_in "mandate_zipcode", with: zip_code
    end

    def fill_place(place)
      fill_in "mandate_place", with: place
    end

    def fill_email(email)
      customer_email = email_service.(email)
      fill_in "mandate_email", with: customer_email
    end

    def profiling_page_path
      "/de/app/mandate/profiling"
    end
  end
end
