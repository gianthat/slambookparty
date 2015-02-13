json.array!(@entries) do |entry|
  json.extract! entry, :id, :user_id, :page_id, :content
  json.url entry_url(entry, format: :json)
end
