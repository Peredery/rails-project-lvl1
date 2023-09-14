# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'
  autoload :FormFields, 'hexlet_code/form_fields/form_fields'
  autoload :FormRender, 'hexlet_code/form_render'

  def self.form_for(entity, **attributes)
    form = Form.new(entity, **attributes)
    yield form if block_given?
    form.build
  end
end
