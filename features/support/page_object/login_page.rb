# frozen_string_literal: true

module PageObject
  class LoginPageNew < Base

    $password = "Test1234"

    def click_vergessen_link
      force_click ".new_password"
    end

    def assert_password_overlay
    find(".forgot-password__title", visible: true)
    end

    def assert_password_overlay_elements(table)
      ["#user_email", ".btn-primary", ".modal__link"].map do |selector|
        find(selector)
      end.map(&:text)

    end

    def enter_email
      fill_in('user_email', with: 'clark.qatester@gmail.com')
    end

    def click_reset_password
      force_click ".btn-primary"
    end

    def assert_successful_message
      find('.password__title').text.should ==
        'Vielen Dank, bitte überprüfe deinen Posteingang!'
    end

    def accessWebEmail
      #navigates to web email
      visit ('https://gmail.com')

      #enters the email username
      fill_in('identifierId', with: 'clark.qatester')
      force_click "#identifierNext"

      #enters the email password
      fill_in 'password', with: "Clark123$"
      force_click "#passwordNext"
    end

    def open_password_reset_email
      email = find("div.xT>div.y6>span>b")
      email.each {|email_subject|
        if email_subject.text.eq("Passwort vergessen? Kein Problem - Clark") == true
          email_subject.click
        end
      }
    end

    def click_password_reset_button
      element = find("img.ajT")
      if element.visible?
        element.click
      end
      find_button("Passwort zurücksetzen").click
    end

    def verify_password_andern_page
      find('.modal__title').text.should == 'Passwort ändern'
    end

    def enters_new_password
      fill_in('#user_password', with: $password)
    end

    def enters_confirmation_password
      fill_in('user_password_confirmation', with: $password)
    end

  end
end
