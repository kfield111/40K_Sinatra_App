class UsersController < AppController

  get '/login' do
    if is_logged_in?
      erb :'user/user_home'
    else
      erb :"/registration/login"
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      erb :'/user/user_home'
    else
      redirect '/login'
    end
  end

end
