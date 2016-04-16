json.array!(@comments) do |comment|
  json.extract! comment, :id, :nickname, :body, :item_id
  json.url comment_url(comment, format: :json)
end
