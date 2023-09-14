# frozen_string_literal: true

module HexletCode
  module FormFields
    class Submit < Base
      TAG_NAME = 'input'
      DEFAULT_VALUE = 'Save'

      def attributes
        @attributes ||= {
          type: :submit,
          value: custom_attributes[:value] || DEFAULT_VALUE,
          **custom_attributes
        }
      end
    end
  end
end
