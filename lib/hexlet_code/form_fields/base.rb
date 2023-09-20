# frozen_string_literal: true

module HexletCode
  module FormFields
    class Base
      TAG_NAME = ''

      attr_reader :body, :tag_name

      def initialize(entity_field_name: nil, entity_field_value: nil, **custom_attrs)
        @entity_field_name = entity_field_name
        @entity_field_value = entity_field_value
        @custom_attributes = custom_attrs
        @body = yield if block_given?
        @tag_name = self.class::TAG_NAME
      end

      def attributes
        raise NotImplementedError
      end

      def build
        Tag.build(tag_name, **attributes) { body }
      end

      private

      attr_reader :entity_field_name, :entity_field_value, :custom_attributes
    end
  end
end
