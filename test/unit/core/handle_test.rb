require 'test_helper'

module Core
  class HandleTest < ActiveSupport::TestCase
    test "#view_page_index retrieves all stored pages" do
      repo = InMemory::Repository.new
      repo.transaction do |t|
        t.create_page(handle: 'my-older-page', title: 'My Older Page')
        t.create_page(handle: 'my-newer-page', title: 'My Newer Page')
        handle = Handle.new(t)
        pages = handle.view_page_index
        assert_equal 'my-newer-page', pages.first.handle
        assert_equal 'my-older-page', pages.second.handle
      end
    end
  end
end
