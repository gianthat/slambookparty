json.array!(@pages) do |page|
  json.extract! page, :id, :slambook_id, :page_type, :title
  json.url page_url(page, format: :json)
end
