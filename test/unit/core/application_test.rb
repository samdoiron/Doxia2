require 'test_helper'

module Core
  class ApplicationTest < ActiveSupport::TestCase
    test "#transaction yields the provided block" do
      assert_equal 123, Application.new.transaction { 123 }
    end
  end
end
