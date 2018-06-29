# frozen_string_literal: true

Then(/^user clicks "Passwort vergessen\?" link$/) do
  @login_page = LoginPageNew.new
  @login_page.click_vergessen_link
end

When(/^user is on Passwort vergessen overlay$/) do
  @login_page.assert_password_overlay
end

And(/^user sees following elements$/) do |table|
  # table is a table.hashes.keys # => [:Email input field]
  @login_page.assert_password_overlay_elements(table)
end

Then(/^user enters the email id in passwort vergessen overlay$/) do
  @login_page.enter_email
end

When(/^user clicks Neues Passwort anfordern button$/) do
  @login_page.click_reset_password
end

Then(/^user sees the "([^"]*)" message$/) do |arg|
  @login_page.assert_successful_message
end

When(/^user logins to web mail$/) do
  @login_page.accessWebEmail
end

And(/^user opens the reset password link in email$/) do
  @login_page.open_password_reset_email
end

And(/^user clicks the password Zurücksetzen button$/) do
  @login_page.click_password_reset_button
end

Then(/^user sees the reset password page$/) do
  @login_page.verify_password_andern_page
end

When(/^user enters the new password$/) do
  @login_page.enters_new_password
end

And(/^user enters the confirm password$/) do
  @login_page.enters_confirmation_password
end

Then(/^user logged into clark and sees cockpit overview page$/) do
  @registration_page.assert_manager_path
end
