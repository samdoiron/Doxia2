require 'test_helper'

module Core
  class ApplicationTest < ActiveSupport::TestCase
    test "#transaction yields the provided block" do
      run = false
      Application.new.transaction do
        run = true
      end
      assert run
    end
  end
end
