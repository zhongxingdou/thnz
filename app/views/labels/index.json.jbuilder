json.array!(@labels) do |label|
  json.extract! label, :id, :name, :content
  json.url label_url(label, format: :json)
end
