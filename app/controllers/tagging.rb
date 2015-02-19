# get '/tags' do
#   @tags = Tag.all
#   erb :'tags/show'
# end


# create a tagging
post "/posts/:id/taggings" do
# binding.pry
  tag = Tag.find(params[:tag_id])
  Tagging.create(tag: tag, post: Post.find(params[:id]))

  content_type :json
  {message: "Added tag #{tag.content} to post."}.to_json
end

  #   if request.xhr?

  # else
