# frozen_string_literal: true

Given(/^(?:user|lead|mandate) is on the registration page$/) do
  @profiling_page = ProfilingPage.new
  @registration_page = RegistrationPage.new(@customer, @profiling_page)

  @registration_page.go
end

Given(/^cockpit preview experiment is set to "([^"]*)" variation$/) do |variation_name|
  @registration_page.cockpit_preview_variation(variation_name)
end

Then(/^(?:user|lead|mandate) sees the following five registration steps$/) do |table|
  patiently do
    @registration_page.assert_registration_steps(table)
  end
end

When(/^(?:user|lead|mandate) enters the phone number$/) do
  patiently do
    @registration_page.fill_phone_number
  end
end

When(/^(?:user|lead|mandate) clicks on Code senden button$/) do
  @registration_page.click_cta
end

When(/^(?:user|lead|mandate) enters the verification token$/) do
  patiently do
    find "h3", text: "Code eingeben" # A hack to wait for the verification token
  end
  token = @registration_page.obtain_verification_token
  @registration_page.fill_verification_token(token)
end

Then(/^(?:user|lead|mandate) is on the cockpit preview page$/) do
  @registration_page.assert_cockpit_preview_url
end

When(/^(?:user|lead|mandate) clicks on Versicherungen hinzufügen button$/) do
  patiently do
    @registration_page.click_add_insurances_button
  end
end

Then(/^(?:user|lead|mandate) is on the confirming page$/) do
  patiently do
    @registration_page.assert_confirming_path
  end
end

When(/^(?:user|lead|mandate) clicks on Jetzt unterschreiben button$/) do
  @registration_page.click_add_signature_button
end

When(/^(?:user|lead|mandate) clicks on Weiter button$/) do
  @registration_page.click_complete_targeting
end

When(/^(?:user|lead|mandate) enters their signature$/) do
  patiently do
    @registration_page.draw_signature
  end
end

When(/^(?:user|lead|mandate) enters his password$/) do
  @registration_page.enter_password
end


And(/^(?:user|lead|mandate) clicks on the signature CTA$/) do
  @registration_page.click_cta_in_signature_modal
end


Then(/^(?:user|lead|mandate) is on the finished page$/) do
  @registration_page.assert_finished_path
end


Then(/^(?:user|lead|mandate) is on the manager page$/) do
  @registration_page.assert_manager_path
end

And(/^(?:user|lead|mandate) sees "([^"]*)" card$/) do |arg|
  #@registration_page.assert_placeholder_card
end


When(/^(?:user|lead|mandate) clicks on Zur Übersicht button$/) do
  @registration_page.click_cta_zur_ubersicht
end
