#############################################################
#### User Posts                                          ####
#############################################################
before '/users/:user_id/posts/:id' do
# make sure that the correct user and post is being viewed
  if params[:id] == "new" and current_user.id == params[:user_id].to_i
    pass
  else
    poster_id = Post.find(params[:id]).poster_id
    p poster_id
    unless  poster_id == params[:user_id].to_i
      redirect "/users/#{poster_id}/posts/#{params[:id]}"
    end
  end
end

# refactor later change to be like the before above and write a helper method
before '/users/:user_id/posts/:id/edit' do
  unless current_user.id == params[:user_id].to_i
    redirect "/users/#{params[:user_id]}/posts/#{params[:id]}"
  end
end

before '/users/:user_id/posts/:id/delete' do
  unless current_user.id == params[:user_id].to_i
    redirect "/users/#{params[:user_id]}/posts/#{params[:id]}"
  end
end

#show
get '/users/:id/posts' do
  @user = User.find(params[:id])
  @posts = @user.posts
  
  erb :'/posts/index'
end

# create
get '/users/:id/posts/new' do
  @tags = Tag.all
  erb :'/posts/new'
end

post '/users/:id/posts' do
  @post = Post.new(poster_id: current_user.id, content: params[:content])

  if @post.save
    @post.id
    params[:tags].each { |id| Tagging.create(post_id: @post.id, tag_id: id)}
    redirect "/users/:id/posts/#{@post.id}"
  else
    redirect "/users/:id/posts/new"
  end
end

#show individual
get '/users/:user_id/posts/:id' do
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    erb :'/posts/show'
end

#edit
get '/users/:user_id/posts/:id/edit' do
  @post = Post.find(params[:id])
  @tags = Tag.all
  erb :'posts/edit'
end


put '/users/:user_id/posts/:id' do

  post = Post.find(params[:id])

  if post.update(content: params[:content])
    redirect "/users/#{params[:user_id]}/posts/#{params[:id]}"
  else
    redirect "/users/#{params[:user_id]}/posts/#{params[:id]}/edit"
  end
end

#delete
delete '/users/:user_id/posts/:id' do
  post = Post.find(params[:id])
  post.destroy
  redirect "/users/#{current_user.id}/posts"
end
