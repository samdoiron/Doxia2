require 'test_helper'

module Core
  class ApplicationTest < ActiveSupport::TestCase
    class StubRepository
      def transaction
        yield :dummy_handle
      end
    end

    test "#transaction yields the provided block" do
      assert_equal 123, Application.new(StubRepository.new).transaction { 123 }
    end

    test "#transaction provides the given block with a handle" do
      Application.new(StubRepository.new).transaction do |t|
        assert_respond_to t, :view_page_index
      end
    end

    test "#transaction provided handle expires after transaction completes" do
      assert_raises Expirable::UseAfterExpire do
        handle = Application.new(StubRepository.new).transaction { |t| t }
        handle.view_page_index
      end
    end
  end
end
