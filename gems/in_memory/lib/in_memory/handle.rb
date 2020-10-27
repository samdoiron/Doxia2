require 'dry-monads'
require 'in_memory/page_record'
require 'core/page'

module InMemory
  class Handle
    include Dry::Monads[:result]
    # TODO: Validate the uniqueness of page handles

    def initialize(store: Store.new)
      @store = store
    end

    def create_page(handle:, title:)
      page = PageRecord.new(handle: handle, title: title, created_at: Time.now)
      store.pages << page
      Success(page)
    end

    def fetch_pages_newest_to_oldest
      store.pages.reverse.map do |record|
        Core::Page.new(handle: record.handle, title: record.title, created_at: record.created_at)
      end
    end

    private

    attr_reader :store
  end
end
