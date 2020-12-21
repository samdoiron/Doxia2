module InMemory
  class Handle
    include Dry::Monads[:result]
    include Dry::Monads[:maybe]
    # TODO: Validate the uniqueness of page slugs
    # TODO: Make all of these `reuslts` because it could fail if
    #       it was a database.

    def initialize(store: Store.new)
      @store = store
    end

    def create_page(slug:, title:)
      page = PageRecord.new(slug: slug, title: title, created_at: Time.now)
      store.pages << page
      Success(page)
    end

    def fetch_pages_newest_to_oldest
      store.pages.reverse.map do |record|
        Core::Page.new(slug: record.slug, title: record.title, created_at: record.created_at)
      end
    end

    def fetch_page_by_slug(slug)
      Maybe(store.pages.find { |p| p.slug == slug })
    end

    private

    attr_reader :store
  end
end
