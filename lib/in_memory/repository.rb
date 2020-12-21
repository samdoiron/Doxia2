module InMemory
  class Repository
    def transaction
      handle = Expirable.new(Handle.new(store: store))
      yield handle
    ensure
      handle.expire! if handle
    end

    private

    def store
      @store ||= Store.new
    end
  end
end
