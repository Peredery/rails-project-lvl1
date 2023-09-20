# frozen_string_literal: true

module HexletCode
  class Form
    attr_accessor :fields, :attributes

    FORM_FIELDS_CLASS_PATH = 'HexletCode::FormFields::'
    DEFAULT_ACTION = '#'
    DEFAULT_METHOD = 'post'

    def initialize(entity, **attributes)
      @entity = entity
      @attributes = normalize_attributes(attributes)
      @fields = []
    end

    def input(entity_field_name, **attributes)
      entity_field_value = entity.public_send(entity_field_name)
      field_attributes = attributes.except(:as)
      fields << field(attributes[:as]).new(entity_field_name:, entity_field_value:, **field_attributes) do
        entity_field_value if attributes[:as] == :text
      end
    end

    def submit(value = nil, **attributes)
      field_attributes = attributes
      field_attributes.merge!({ value: }) if value
      fields << field(:submit).new(**field_attributes)
    end

    def build
      FormRender.call(self)
    end

    private

    attr_reader :entity

    def normalize_attributes(attributes)
      action = attributes[:url] || DEFAULT_ACTION
      method = attributes[:method] || DEFAULT_METHOD
      attributes
        .except(:url, :method)
        .merge({ action:, method: })
    end

    def field(type = nil)
      Object.const_get("#{FORM_FIELDS_CLASS_PATH}#{(type || 'input').capitalize}")
    end
  end
end
