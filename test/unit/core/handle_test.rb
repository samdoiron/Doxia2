require 'test_helper'

module Core
  class HandleTest < ActiveSupport::TestCase
    test "#fetch_pages_newest_to_oldest retrieves all stored pages" do
      repo = InMemory::Repository.new
      repo.transaction do |t|
        t.create_page(handle: 'my-older-page', title: 'My Older Page')
        t.create_page(handle: 'my-newer-page', title: 'My Newer Page')
      end
      handle = Handle.new(repo)
      pages = handle.fetch_pages_newest_to_oldest
      assert_equal 'my-newer-page', pages.first.handle
      assert_equal 'my-older-page', pages.second.handle
    end
  end
end
