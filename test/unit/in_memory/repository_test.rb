require 'test_helper'

module InMemory
  class RepositoryTest < ActiveSupport::TestCase
    test "#transaction yields the provided block" do
      assert_equal 123, Repository.new.transaction { 123 }
    end
  end
end
