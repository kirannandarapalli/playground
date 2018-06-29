# frozen_string_literal: true

Given(/^(?:user|lead|mandate) is on the homepage$/) do
  @homepage = HomePage.new

  @homepage.goto_home_page
end
