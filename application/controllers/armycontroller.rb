class UsersController < AppController

  #create route
  get '/army/new' do
    erb :'/army/army_create'
  end

  post '/army/new' do
    @army = Army.create(:army_name => params[:army_name], :faction => params[:faction], :unit_count => params[:unit_count])
    @army.user_id = session[:user_id]
    redirect "/army/#{@army.id}"
  end

  #read route
  get '/army/:id' do
    @army = Army.find(params[:id])
    erb :'/army/show'
  end



  #update route



  #delete route



end
