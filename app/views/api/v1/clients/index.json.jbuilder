json.array! @clients do |client|
  json.id client.id
  if current_user.is_admin
    json.company_id client.company_id
  end
  json.client_code client.client_code
  json.created_at client.created_at
  json.updated_at client.updated_at
end
