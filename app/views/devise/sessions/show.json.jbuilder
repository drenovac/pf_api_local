if user_signed_in?
  json.user do
    json.id current_user.id
    json.email current_user.email
    if current_user.is_admin
      json.is_admin true
    end
    json.company do
      json.id current_user.company.id
      json.title current_user.company.title
      if current_user.company.is_admin
        json.is_admin true
      end
    end
  end
end
