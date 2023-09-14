# frozen_string_literal: true

require 'test_helper'
class HexleotCodeTest < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

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

    form = HexletCode.form_for(user)

    assert_equal('<form action="#" method="post"></form>', form)
  end

  def test_form_for_with_user_fields
    user = User.new job: 'hexlet'
    result = html_oneline(load_fixture('form_for_with_user_fields.html'))
    form = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert_equal(result, form)
  end

  def test_form_for_custom_submit_button
    user = User.new job: 'hexlet'
    result = html_oneline(load_fixture('form_for_with_custom_submit.html'))
    form = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

    assert_equal(result, form)
  end

  def test_form_with_textarea
    user = User.new job: 'hexlet', name: 'rob'
    result = html_oneline(load_fixture('form_with_textarea.html'))
    form = HexletCode.form_for user, url: '#' do |f|
      f.input :job, as: :text
    end

    assert_equal(result, form)
  end

  def test_form_with_textarea_and_custom_class
    user = User.new job: 'hexlet', name: 'rob'
    result = html_oneline(load_fixture('form_with_textarea_and_custom_class.html'))
    form = HexletCode.form_for user, url: '#' do |f|
      f.input :job, as: :text, class: 'foo'
    end

    assert_equal(result, form)
  end

  def test_empty_form_with_default
    user = User.new job: 'hexlet'
    result = html_oneline(load_fixture('form_for_default.html'))
    form = HexletCode.form_for user

    assert_equal(result, form)
  end
end
