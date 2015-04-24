json.array!(@contracts) do |contract|
  json.extract! contract, :id, :title, :company, :description, :image_url, :pay
  json.url contract_url(contract, format: :json)
end
