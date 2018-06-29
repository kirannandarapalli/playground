# frozen_string_literal: true

Then(/^(?:user|lead|mandate) is on the targeting page$/) do
  @targeting_page = TargetingPage.new
  @targeting_page.go
end

When(/^(?:user|lead|mandate) performs a search with the term "([^"]*)"$/) do |search_term|
  @targeting_page.search_with_term(search_term)
end

When(/^(?:user|lead|mandate) selects the category$/) do
  category_id = @customer.inquiry_categories.first[:category]
  @targeting_page.select_category(category_id)
end

Then(/^(?:user|lead|mandate) is on the company targeting page$/) do
  category_id = @customer.inquiry_categories.first[:category]
  @targeting_page.assert_company_targeting_path(category_id)
end

When(/^(?:user|lead|mandate) selects the company$/) do
  company_id = @customer.inquiry_categories.first[:company]
  @targeting_page.select_company(company_id)
end

Then(/^(?:user|lead|mandate) can see the selected inquiry category$/) do
  patiently do
    @targeting_page.assert_selected_inquiry_category(@customer.inquiry_categories.first)
  end
end
