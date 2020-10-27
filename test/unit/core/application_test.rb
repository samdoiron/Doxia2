require 'test_helper'

module Core
  class ApplicationTest < ActiveSupport::TestCase
    test "#transaction yields the provided block" do
      assert_equal 123, Application.new(InMemory::Repository.new).transaction { 123 }
    end

    test "#transaction provides the given block with a handle" do
      Application.new(InMemory::Repository.new).transaction do |t|
        assert_respond_to t, :view_page_index
      end
    end

    test "#transaction provided handle expires after transaction completes" do
      assert_raises Expireable::ExpiredError do
        handle = Application.new(InMemory::Repository.new).transaction { |t| t }
        handle.view_page_index
      end
    end
  end
end
