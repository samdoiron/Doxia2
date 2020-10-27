require 'test_helper'
require 'in_memory/handle'

module InMemory
  class HandleTest < Minitest::Spec
    it "#fetch_pages_newest_to_oldest retrieves all stored pages" do
      handle = Handle.new
      handle.create_page(handle: 'my-older-page', title: 'My Older Page')
      handle.create_page(handle: 'my-newer-page', title: 'My Newer Page')
      pages = handle.fetch_pages_newest_to_oldest
      assert_equal 'my-newer-page', pages[0].handle
      assert_equal 'my-older-page', pages[1].handle
    end
  end
end
