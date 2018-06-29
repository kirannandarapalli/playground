# frozen_string_literal: true

Then(/^(?:user|lead|mandate) is on the profiling page$/) do
  @profiling_page.assert_profiling_page
end

When(/^(?:user|lead|mandate) fills the profiling form$/) do
  @registration_page.fill_profiling_form
end
