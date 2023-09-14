# frozen_string_literal: true

require 'pry'

class Base
  attr_reader :tag_name, :entity_field_name, :entity_field_value, :result_attributes

  def initialize(entity_field_name: nil, entity_field_value: nil, **custom_attrs)
    @tag_name = self.class.name.downcase
    @entity_field_name = entity_field_name
    @entity_field_value = entity_field_value
    @result_attributes = custom_attrs
  end

  def self.inner_attributes(**attrs)
    @inner_attributes ||= attrs
  end

  def attributes
    self.class.inner_attributes.each do |(name, value)|
      @result_attributes[name] = value.respond_to?(:call) ? instance_exec(&value) : value
    end
    @result_attributes
  end

  def self.body(value)
    @body ||= value
  end

  def body
    @body_value ||= self.class.instance_variable_get(:@body_value)
    @body_value.respond_to?(:call) ? instance_exec(&@body_value) : @body_value
  end
end

class Input < Base
  inner_attributes name: -> { entity_field_name },
                   type: :text,
                   value: -> { entity_field_value }
end

class Label < Base
  inner_attributes for: -> { entity_field_name }
  body -> { entity_field_name.capitalize.to_s }
end

label = Label.new(entity_field_name: :name)
input_field = Input.new(entity_field_name: :name, entity_field_value: 'foo', color: :red, size: 10)

p input_field.attributes # => { name: :name, type: :text, value: 'foo', color: :red, size: 10 }
p label.attributes # => { for: :name }
p label.body # => "Name"
