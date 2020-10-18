require 'test_helper'

module InMemory
  class RepositoryTest < ActiveSupport::TestCase
    test "#transaction yields the provided block" do
      run = false
      Repository.new.transaction do
        run = true
      end
      assert run
    end
  end
end
