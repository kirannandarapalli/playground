# frozen_string_literal: true

module Repository
  class Company
    class << self
      def lookup
        @lookup ||= ::Company.active.inject({}) { |memo, company|
          memo.merge company.name => {
            id: company.id,
            ident: company.ident
          }
        }
      end

      def get_ident(company_name)
        lookup[company_name][:ident]
      end

      def get_id(company_name)
        lookup[company_name][:id]
      end
    end
  end
end
