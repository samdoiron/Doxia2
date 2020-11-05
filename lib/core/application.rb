module Core
  class Application
    def initialize(repo)
      @repo = repo
    end

    def transaction
      repo.transaction do |repo_handle|
        begin
          handle = Expirable.new(Handle.new(repo_handle))
          yield handle
        ensure
          handle.expire! if handle
        end
      end
    end

    private

    attr_reader :repo

  end
end
