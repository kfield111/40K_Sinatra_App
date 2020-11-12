class UsersController < AppController

  get '/login' do
    if is_logged_in?
      erb :'users/user_home'
    else
      erb :'/users/login'
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
    erb :'/users/user_home'
  end

  get '/logout' do
    session.clear
    erb :'/homepage'
  end

end
