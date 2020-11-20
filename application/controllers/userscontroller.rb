class UsersController < AppController

  get '/login' do
    if is_logged_in?
      redirect "users/#{current_user.id}"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by_id(params[:id])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect '/login'
    end
  end

  #limit users from being able to use the URL to access another user page
  get '/users/:id' do
    @user = User.find(params[:id])
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
