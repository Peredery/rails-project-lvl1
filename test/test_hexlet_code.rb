# frozen_string_literal: true

require 'test_helper'
class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_single_tag
    assert HexletCode::Tag.build('br'), 'br'
  end

  def test_tag_with_body
    assert HexletCode::Tag.build('label') { 'Email' }, '<label>Email</label>'
  end

  def test_form_for
    user = User.new name: 'rob', job: 'hexlet'

    # rubocop:disable Lint/EmptyBlock
    form = HexletCode.form_for(user) do |f|
    end
    # rubocop:enable Lint/EmptyBlock

    assert form, '<form action="#" method="post"></form>'
  end
end
