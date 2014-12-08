json.array!(@packages) do |package|
  json.extract! package, :id, :name, :versions, :publication, :title, :description
  json.url package_url(package, format: :json)
end
