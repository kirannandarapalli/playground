# frozen_string_literal: true

module Model
  Customer = Struct.new(:first_name,
                        :last_name,
                        :birthdate,
                        :address_line1,
                        :house_number,
                        :place,
                        :zip_code,
                        :email,
                        :phone_number,
                        :inquiry_categories,
                        :brutto,
                        :seite)
end
