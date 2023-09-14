# frozen_string_literal: true

module HexletCode
  module FormRender
    def self.call(form)
      Tag.build('form', **form.normalized_attributes) do
        form.fields.map do |field|
          Tag.build(field.tag_name, **field.attributes) { field.body }
        end.join
      end
    end
  end
end
