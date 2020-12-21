module InMemory
  PageRecord = Struct.new(:slug, :title, :created_at, keyword_init: true)
end
