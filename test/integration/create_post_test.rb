# frozen_string_literal: true

require 'test_helper'

class CreatePostTest < ActionDispatch::IntegrationTest
  test 'cannot create an invalid post' do
    post posts_path, params: { post: { title: '', body: '' } }, headers: turbo_stream

    assert_response 422
  end

  test 'create a valid post' do
    post posts_path, params: { post: { title: 'Some title', body: 'Some text' } }, headers: turbo_stream

    assert_response 200
  end

  private

  def turbo_stream
    { "Accept" => "text/vnd.turbo-stream.html, text/html, application/xhtml+xml" }
  end
end
