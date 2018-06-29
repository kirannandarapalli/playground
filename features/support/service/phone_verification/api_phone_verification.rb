# frozen_string_literal: true

module Service
  module PhoneVerification
    class ApiPhoneVerification
      def initialize(base_url)
        @base_url = base_url
        @accept_header = "application/vnd.clark-automation_helpers_v1+json"

        @max_tries = 10
        @backoff = 2
      end

      def call(phone_number)
        @phone_number = phone_number

        data = nil
        tries = @max_tries

        while tries.positive?
          response = make_request
          status_code = response.code.to_i

          unless status_code.in?([200, 403])
            tries -= 1
            sleep @backoff += 1
            next
          end

          data = JSON.parse(response.body)

          unless data["token"]
            tries -= 1
            sleep @backoff += 1
            next
          end

          break if data["token"]
        end

        raise "Unable to obtain the verification token" if tries.zero?

        data["token"]
      end

      private

      def path
        "/api/phone_verification/+49#{@phone_number}"
      end

      def make_request
        uri = URI(@base_url + path)

        http = Net::HTTP.new(uri.hostname, uri.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(uri)
        request.add_field "Accept", @accept_header
        request.basic_auth "test_automation", "clarkkent"

        http.request(request)
      end
    end
  end
end
