get '/users/new' do
  erb :'/users/new'
end

post '/users/new' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect "/users/#{user.id}"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end
