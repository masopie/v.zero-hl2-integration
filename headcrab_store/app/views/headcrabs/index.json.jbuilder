json.array!(@headcrabs) do |headcrab|
  json.extract! headcrab, :id, :name, :birthday, :price, :description, :pic_url
  json.url headcrab_url(headcrab, format: :json)
end
