json.array!(@cliques) do |clique|
  json.extract! clique, :id, :name
  json.url clique_url(clique, format: :json)
end