# frozen_string_literal: true

When(/^(?:user|lead|mandate) clicks on "([^"]*)" link$/) do |text|
  find("a", text: text).click
end

When(/^(?:user|lead|mandate) clicks on "([^"]*)" button$/) do |text|
  find_button(text).click
end

When(/^(?:user|lead|mandate) clicks on the primary CTA$/) do
  force_click ".btn-primary.btn--mobile-block"
end

When(/^(?:user|lead|mandate) clicks on primary CTA$/) do
  force_click ".btn-primary"
end
