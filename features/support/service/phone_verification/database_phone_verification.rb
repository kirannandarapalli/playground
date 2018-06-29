# frozen_string_literal: true

module Service
  module PhoneVerification
    class DatabasePhoneVerification
      def call(_phone_number)
        Phone.last.verification_token
      end
    end
  end
end
