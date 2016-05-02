json.array!(@messages) do |message|
  json.extract! message, :id, :user_id, :category_id_integer, :visibility, :group_ids, :body
  json.url message_url(message, format: :json)
end
