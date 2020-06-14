json.user do
  json.id @user.id
  json.email @user.email
  if @user.is_admin
    json.is_admin true
  end
  json.company do
    json.id @user.company.id
    json.title @user.company.title
    if @user.company.is_admin
      json.is_admin true
    end
  end
end
