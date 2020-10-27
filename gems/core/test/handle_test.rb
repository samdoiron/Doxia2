require 'test_helper'
require 'ostruct'

require 'core/page'
require 'core/handle'

module Core
  class HandleTest < MiniTest::Spec
    it "#view_page_index retrieves all stored pages" do
      repo_handle = OpenStruct.new(
        fetch_pages_newest_to_oldest: [
          Core::Page.new(handle: 'my-newer-page', title: 'My Newer Page'),
          Core::Page.new(handle: 'my-older-page', title: 'My Older Page')
        ]
      )
      handle = Handle.new(repo_handle)
      pages = handle.view_page_index

      assert_equal 'my-newer-page', pages[0].handle
      assert_equal 'my-older-page', pages[1].handle
    end
  end
end
