module InMemory
  class Repository
    def transaction
      yield
    end
  end
end
