get '/entries' do
	@entries = Entry.all
	erb :'index'
end  

get '/entries/new' do
 if logged_in?
    erb :'entries/new'
  else
    redirect '/login'
  end
end

post '/entries' do
	redirect '/login' unless logged_in?
	@entry = Entry.new(params[:entry])
	if @entry.save 
		current_user.entries << @entry
		redirect '/entries'
	else
	    @errors = @entry.errors.full_messages
	    erb :'/entries/new'
	end
end 

get '/entries/:id' do
	@entry = Entry.find(params[:id])
	erb :'/entries/show'
end

# I MOVED THE EDIT FORM ONTO THE SHOW PAGE

# get '/entries/:id/edit' do
# 	@entry = Entry.find(params[:id])
# 	erb :'/entries/edit'
# end

put '/entries/:id' do
	@entry = Entry.find(params[:id])
	halt(403) unless @entry.user == current_user	
	if @entry.user == current_user && @entry.save
		@entry.update_attributes(params[:entry]) 
		redirect '/entries'
	else
		@errors = @entry.errors.full_messages
		erb :'/entries/show'
	end
end



delete '/entries/:id' do
	@entry = Entry.find(params[:id])
	@user = current_user
	if @entry.user_id == current_user.id
	
	@entry.destroy
	redirect '/entries'
	else
		@errors = @entry.errors.full_messages
		erb :'/entries/show'
	end
end


