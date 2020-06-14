json.user do
  json.partial! 'users/sessions/user', user: @user
end
