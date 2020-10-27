require 'test_helper'
require 'expirable'

require 'in_memory/repository'

module InMemory
  class RepositoryTest < MiniTest::Spec
    it "#transaction yields the provided block" do
      assert_equal 123, Repository.new.transaction { 123 }
    end

    it "#transaction provides the given block with a handle" do
      Repository.new.transaction do |t|
        assert_respond_to t, :create_page
      end
    end

    it "#transaction provided handle expires after transaction completes" do
      assert_raises Expirable::ExpiredError do
        handle = Repository.new.transaction { |t| t }
        handle.fetch_pages_newest_to_oldest
      end
    end
  end
end
