# frozen_string_literal: true

module HexletCode
  module FormFields
    class Input < Base
      TAG_NAME = 'input'

      def attributes
        @attributes ||= {
          name: entity_field_name,
          type: :text,
          value: entity_field_value,
          **custom_attributes
        }
      end

      def build
        [
          Label.new(entity_field_name:) { entity_field_name.capitalize }.build,
          super
        ]
      end
    end
  end
end
