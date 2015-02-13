json.array!(@slambooks) do |slambook|
  json.extract! slambook, :id, :name
  json.url slambook_url(slambook, format: :json)
end
