module Core
  class Application
    def initialize(repo)
      @repo = repo
    end

    def transaction
      repo.transaction do |repo_handle|
        begin
          handle = Expireable.new(Handle.new(repo_handle))
          yield handle
        ensure
          handle.expire!
        end
      end
    end

    private

    attr_reader :repo

  end
end
