# frozen_string_literal: true

# Populate database when it is not smoke testing
Before "not @smoke" do
  FactoryBot.create(:admin)
end
