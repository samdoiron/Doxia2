require 'test_helper'

module Core
  class SlugGeneratorTest
    test '#for_text does nothing if given a valid slug' do
      assert_equal 'my-slug', SlugGenerator.for_text('my-slug')
    end
  end
end