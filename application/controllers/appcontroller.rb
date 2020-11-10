class AppController < Sinatra::Base

  configure do
    set :session_secret, "Penguins_in_paradise"
    set :views, Proc.new { File.join(root, "../views/") }
  end

  get '/' do
    erb :homepage
  end

  get '/signup' do
    erb :"/registration/signup"
  end


  post '/signup' do
    if User.all.include? (params[:username])
      redirect '/signup'
    else
      user = User.new(:username => params[:username], :password => params[:password])
      if user.save && user.username != ""
        session[:user_id] = user.id
        erb :'/test'
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
