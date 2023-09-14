# frozen_string_literal: true

module HexletCode
  module FormFields
    class Text < Base
      DEFAULT_ATTRIBUTES = {
        cols: 20,
        rows: 40
      }.freeze
      TAG_NAME = 'textarea'

      def attributes
        @attributes ||= {
          name: entity_field_name,
          **DEFAULT_ATTRIBUTES,
          **custom_attributes
        }
      end
    end
  end
end
