# frozen_string_literal: true

module Service
  module Email
    class RandomEmail
      def call(_email)
        # returns the new email with appending current time
        "test-automation-"+Time.now.strftime('%Y%m%d%H%M%S')+"@clark.de"
      end
    end
  end
end
