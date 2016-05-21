post '/entries/:id/comment' do 
	@comments = Comment.all
	@comment = Comment.new(params[:comment])
	@entry = Entry.find(params[:id])
	@user = current_user
	if @comment.save
		erb :'/comments/new'
		@user.comments << @comment
		@entry.comments << @comment
		redirect "/entries/#{@entry.id}"
	else
		erb :'/entries/show'
	end
end

