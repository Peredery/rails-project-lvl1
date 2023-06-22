# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[img input br].freeze
    def self.build(tag_name, **options)
      body = yield if block_given?
      attributes = options.map { |key, value| " #{key}=\"#{value}\"" }.join
      if SINGLE_TAGS.include?(tag_name)
        "<#{tag_name}#{attributes}>"
      else
        "<#{tag_name}#{attributes}>#{body}</#{tag_name}>"
      end
    end
  end
end
