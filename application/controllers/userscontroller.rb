class UsersController < AppController

  get '/login' do
    if is_logged_in?
      redirect "users/#{current_user.id}"
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
    if !is_logged_in?
      redirect "/login"
    else
      erb :'/users/user_home'
    end
  end

  get '/logout' do
    session.clear
    erb :'/homepage'
  end

end
