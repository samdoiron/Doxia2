class DevContainer
  extend Dry::Container::Mixin

  register "application" do
    repo = InMemory::Repository.new
    repo.transaction do |t|
      t.create_page(slug: 'hello-world', title: 'Hello World!')
      t.create_page(slug: 'goodbye-world', title: 'Goodbye World!')
    end
    Core::Application.new(repo)
  end
end