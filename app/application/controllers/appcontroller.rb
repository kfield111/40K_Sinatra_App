class AppController < Sinatra::Base

  set :session_secret, "Penguins_in_paradise"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :homepage
  end

  get '/signup' do
    erb :"/registration/signup"
  end

  post '/signup' do
    erb :"/user/user_home"
  end

end
