require 'test_helper'

module InMemory
  class RepositoryTest < ActiveSupport::TestCase
    test "#transaction yields the provided block" do
      assert_equal 123, Repository.new.transaction { 123 }
    end

    test "#transaction provides the given block with a handle" do
      Repository.new.transaction do |t|
        assert_respond_to t, :create_page
      end
    end

    test "#transaction provided handle expires after transaction completes" do
      assert_raises Expireable::ExpiredError do
        handle = Repository.new.transaction { |t| t }
        handle.fetch_pages_newest_to_oldest
      end
    end
  end
end
