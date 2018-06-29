# frozen_string_literal: true

module Repository
  class Category
    class << self
      def lookup
        @lookup ||= Domain::MasterData::Categories.regular.inject({}) { |memo, category|
          memo.merge category.name => {
            id: category.id,
            ident: category.ident
          }
        }
      end

      def get_ident(category_name)
        lookup[category_name][:ident]
      end

      def get_id(category_name)
        lookup[category_name][:id]
      end
    end
  end
end
