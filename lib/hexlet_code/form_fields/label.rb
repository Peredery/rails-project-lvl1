# frozen_string_literal: true

module HexletCode
  module FormFields
    class Label < Base
      TAG_NAME = 'label'

      def attributes
        @attributes ||= {
          for: entity_field_name
        }
      end
    end
  end
end
