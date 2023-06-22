module HexletCode
  class Form
    attr_reader :entity, :attributes

    def initialize(entity, **attributes)
      @entity = entity
      @attributes = attributes
    end

    def build
      Tag.build('form', **attributes)
    end
  end
end
