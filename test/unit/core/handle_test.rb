require 'test_helper'

module Core
  class HandleTest < ActiveSupport::TestCase
    test "#view_page_index retrieves all stored pages" do
      repo = InMemory::Repository.new
      repo.transaction do |t|
        t.create_page(slug: 'my-older-page', title: 'My Older Page')
        t.create_page(slug: 'my-newer-page', title: 'My Newer Page')
        handle = Handle.new(t)
        pages = handle.view_page_index
        assert_equal 'my-newer-page', pages.first.slug
        assert_equal 'my-older-page', pages.second.slug
      end
    end

    test "#show_page retrieves the given page by its handle" do
      repo = InMemory::Repository.new
      repo.transaction do |t|
        t.create_page(slug: 'my-page-id', title: 'My Page')

        handle = Handle.new(t)
        page = handle.show_page('my-page-id')

        assert_predicate page, :some?
        assert_equal 'My Page', page.value!.title
      end
    end
  end
end
