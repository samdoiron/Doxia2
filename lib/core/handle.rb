module Core
  class Handle
    extend Forwardable

    def initialize(repo_handle)
      @repo_handle = repo_handle
    end

    def view_page_index
      repo_handle.fetch_pages_newest_to_oldest
    end

    def show_page(slug)
      repo_handle.fetch_page_by_slug(slug)
    end

    private

    attr_accessor :repo_handle
  end
end
