module InMemory
  class Repository

    def transaction
      handle = Expireable.new(Handle.new(store: store))
      yield handle
    ensure
      handle.expire!
    end

    private

    def store
      @store ||= Store.new
    end
  end
end
