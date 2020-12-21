require 'test_helper'

module InMemory
  class HandleTest < ActiveSupport::TestCase
    test "#fetch_pages_newest_to_oldest retrieves all stored pages" do
      handle = Handle.new
      handle.create_page(slug: 'my-older-page', title: 'My Older Page')
      handle.create_page(slug: 'my-newer-page', title: 'My Newer Page')
      pages = handle.fetch_pages_newest_to_oldest
      assert_equal 'my-newer-page', pages.first.slug
      assert_equal 'my-older-page', pages.second.slug
    end

    test "#fetch_page_by_slug retrieves a page by its slug" do
      handle = Handle.new
      handle.create_page(slug: 'my-page', title: 'My Page')

      page = handle.fetch_page_by_slug('my-page')

      assert_predicate page, :some?
      assert_equal 'My Page', page.value!.title
    end
  end
end
