# frozen_string_literal: true

require 'test_helper'

class CreatePostTest < ActionDispatch::IntegrationTest
  test 'cannot create an invalid post' do
    post posts_path(format: :turbo_stream),
          params: { post: { title: '', body: '' } }

    assert_response 422
  end

  test 'create a valid post' do
    post posts_path(format: :turbo_stream),
          params: { post: { title: 'Some title', body: 'Some text' } }

    assert_response 200
  end
end
