class AppController < Sinatra::Base

  set :session_secret, "Penguins_in_paradise"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :homepage
  end

  get '/signup' do
    erb :"/registration/signup"
  end

  get '/login' do
    erb :"/registration/login"
  end

  post '/login' do
    @user = params[:username]
    @password = params[:password]
    erb :"/user/user_home"
  end

  post '/signup' do
    @user = params[:username]
    @password = params[:password]
    erb :"/user/user_home"
  end

end
