# frozen_string_literal: true

module HexletCode
  module FormRender
    def self.call(form)
      Tag.build('form', **form.attributes) do
        form.fields.map(&:build).join
      end
    end
  end
end
