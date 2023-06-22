module HexletCode
  class Form
    attr_reader :entity, :attributes
    DEFAULT_ACTION = '#'.freeze
    DEFAULT_METHOD = 'post'.freeze

    def initialize(entity, **attributes)
      @entity = entity
      @attributes = attributes
    end

    def normalized_attributes
      action = attributes[:url] || DEFAULT_ACTION
      method = attributes[:method] || DEFAULT_METHOD
      attributes
        .except(:url, :method)
        .merge({ action:, method: })
    end

    def build
      Tag.build('form', **normalized_attributes)
    end
  end
end
