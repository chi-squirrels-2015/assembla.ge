get '/auth/login' do 
  erb :'auth/login'
end

post '/auth/login' do
  if user = User.authenticate(params) 
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/auth/login'
  end
end

get '/auth/logout' do
  session.delete(:user_id)
  redirect '/'
end
