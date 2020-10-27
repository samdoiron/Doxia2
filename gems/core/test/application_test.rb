require 'test_helper'
require 'ostruct'
require 'expirable'

require 'core/application'

module Core
  class ApplicationTest < MiniTest::Spec
    class StubRepository
      def transaction
        yield :dummy_handle
      end
    end

    it "#transaction yields the provided block" do
      assert_equal 123, Application.new(StubRepository.new).transaction { 123 }
    end

    it "#transaction provides the given block with a handle" do
      Application.new(StubRepository.new).transaction do |t|
        assert_respond_to t, :view_page_index
      end
    end

    it "#transaction provided handle expires after transaction completes" do
      assert_raises Expirable::ExpiredError do
        handle = Application.new(StubRepository.new).transaction { |t| t }
        handle.view_page_index
      end
    end
  end
end
