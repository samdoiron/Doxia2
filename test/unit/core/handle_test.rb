require 'test_helper'

module Core
  class HandleTest < ActiveSupport::TestCase
    test "#list_pages returns all pages in the repository" do
      repo = InMemory::Repository.new

      Handle.new(repo).list_pages
    end
  end
end
