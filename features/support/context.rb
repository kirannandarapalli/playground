# frozen_string_literal: true

## File to make context specific configurations.

def smoke_test_enabled(tags)
  tags.include?("@smoke") && ENV.fetch("CUCUMBER_TARGET_URL", nil)
end

Before do |scenario|
  tags = scenario.source_tag_names

  phone_verification_service = nil
  email_service = nil

  if smoke_test_enabled(tags)
    phone_verification_service = Service::PhoneVerification::ApiPhoneVerification.new(ENV.fetch("CUCUMBER_TARGET_URL"))
    email_service = Service::Email::RandomEmail.new
  else
    phone_verification_service = Service::PhoneVerification::DatabasePhoneVerification.new
    email_service = Service::Email::LocalEmail.new
  end

  PageObject::Base.send(:define_method, :phone_verification_service) { phone_verification_service }
  PageObject::Base.send(:define_method, :email_service) { email_service }
end

