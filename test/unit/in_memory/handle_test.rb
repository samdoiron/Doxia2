require 'test_helper'

module InMemory
  class HandleTest < ActiveSupport::TestCase
    test "#fetch_pages_newest_to_oldest retrieves all stored pages" do
      handle = Handle.new
      handle.create_page(handle: 'my-older-page', title: 'My Older Page')
      handle.create_page(handle: 'my-newer-page', title: 'My Newer Page')
      pages = handle.fetch_pages_newest_to_oldest
      assert_equal 'my-newer-page', pages.first.handle
      assert_equal 'my-older-page', pages.second.handle
    end
  end
end
