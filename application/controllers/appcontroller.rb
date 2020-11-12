require './config/environment'


class AppController < Sinatra::Base



  configure do
    enable :sessions
    set :session_secret, "Penguins_in_paradise"
    set :views, 'application/views'
  end

  get '/' do
    erb :homepage
  end

  get '/signup' do
    if is_logged_in?
      redirect "users/#{current_user.id}"
    else
      erb :"/registration/signup"
    end
  end


  post '/signup' do
    if User.all.include? (params[:username])
      redirect '/signup'
    else
      @user = User.new(:username => params[:username], :password => params[:password])
      if @user.save && @user.username != ""
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
      else
        redirect '/signup'
      end
    end
  end

  helpers do
    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end

    def is_logged_in?
      !!session[:user_id]
    end
  end

end
