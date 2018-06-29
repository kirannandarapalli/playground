# frozen_string_literal: true

Given(/^(?:user|lead|mandate) is as the following$/) do |table|
  @customer = build_single(table, Model::Customer)
end

Given(/^(?:user|lead|mandate) has the following inquiry categories$/) do |table|
  inquiry_categories = build_multiple(table, Model::InquiryCategory)
  @customer.inquiry_categories = inquiry_categories.map { |inquiry_category|
    {
      category: Repository::Category.get_id(inquiry_category.category),
      company: Repository::Company.get_id(inquiry_category.company)
    }.with_indifferent_access
  }
end
