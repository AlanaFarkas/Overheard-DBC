get '/users' do
	@users = User.all
	erb :'users/index'
end

get '/users/new' do
	erb :'/users/new'
end

post '/users' do
	@user = User.new(params[:user])
  if @user.save
  	session[:user_id] = @user.id
    redirect '/entries'
  else
  	@errors = @user.errors.full_messages
  	erb :'/users/new'
  end
end

get '/users/:id' do
	@user = User.find(params[:id])
	erb :'users/show'
end

delete '/users/:id' do
	@user = User.find(params[:id])
	@user.destroy
	redirect '/entries'
end



