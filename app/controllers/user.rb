#############################################################
#### Basics for User RESTful CRUD                        ####
#############################################################
before '/users/:id/edit' do
	unless current_user.id == params[:id].to_i
		redirect "/users/#{params[:id]}"
	end
end

before '/users/:id/delete' do
  unless current_user.id == params[:id].to_i
    redirect "/users/#{params[:id]}"
  end
end

get '/users/new' do
  erb :'/users/new'
end

post '/users/new' do
  user = User.new(params[:user])
  
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect "/users/new"
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end

get '/users/:id/edit' do
  erb :'users/edit'
end

put '/users/:id' do	
  if current_user.update(params[:user])
    redirect "/users/#{current_user.id}"
  else
    redirect "/users/#{current_user.id}/edit"
  end
end

delete '/users/:id' do
	current_user.destroy
	redirect '/auth/logout'
end
