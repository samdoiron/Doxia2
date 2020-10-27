require 'forwardable'

module Core
  class Handle
    extend Forwardable

    def initialize(repo_handle)
      @repo_handle = repo_handle
    end

    def view_page_index
      repo_handle.fetch_pages_newest_to_oldest
    end

    private

    attr_accessor :repo_handle
  end
end
