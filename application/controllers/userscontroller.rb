class UsersController < AppController

  get '/login' do
    if is_logged_in?
      erb :'user/user_home'
    else
      erb :"/user/login"
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect '/login'
    end
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/user/user_home'
  end

  get 'logout' do
    session[:user_id].clear
  end

end
