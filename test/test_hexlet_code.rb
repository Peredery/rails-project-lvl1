# frozen_string_literal: true

require 'test_helper'
class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_single_tag
    assert_equal('<br>', HexletCode::Tag.build('br'))
  end

  def test_tag_with_body
    assert_equal('<label>Email</label>', HexletCode::Tag.build('label') { 'Email' })
  end

  def test_form_for
    user = User.new name: 'rob', job: 'hexlet'

    # rubocop:disable Lint/EmptyBlock
    form = HexletCode.form_for(user) do |f|
    end
    # rubocop:enable Lint/EmptyBlock

    assert_equal('<form action="#" method="post"></form>', form)
  end

  def test_form_for_with_url
    user = User.new name: 'rob', job: 'hexlet'

    # rubocop:disable Lint/EmptyBlock
    form = HexletCode.form_for(user, url: '/users') do |f|
    end
    # rubocop:enable Lint/EmptyBlock

    assert_equal('<form action="/users" method="post"></form>', form)
  end
end
