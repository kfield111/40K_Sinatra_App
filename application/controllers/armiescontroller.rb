class ArmiesController < AppController

  #create route
  get '/armies/new' do
    erb :'/armies/army_create'
  end

  post '/armies' do
    @army = current_user.armies.new(:army_name => params[:army_name], :faction => params[:faction], :army_point_cost => params[:army_point_cost]) #utilize mass assignment
    if @army.save

      redirect "/armies/#{@army.id}"
    else
      erb :'/armies/army_create'
    end
  end

  #read route
  get '/armies/:id' do
    @army = Army.find_by_id(params[:id])
    if @army.user_id == current_user.id
      erb :'/armies/show'
    else
      erb :'/users/user_home'
    end
  end

  get '/armies' do
    @armies = current_user.armies
    @user = current_user.id
    erb :'/armies/index'
  end

  #update route
  get '/armies/:id/edit' do
    #Is a user logged in?
    @army = Army.find(params[:id]) #does this record exist?
    # does the logged in user own this record?
    erb :'armies/army_edit'
  end

  patch '/armies/:id' do
    @army = Army.find(params[:id])
    @army.update(:army_name => params[:army_name], :faction => params[:faction], :army_point_cost => params[:army_point_cost])
    redirect "/armies/#{@army.id}"
  end


  #delete route
  delete '/armies/:id/delete' do
    @army = Army.find(params[:id])
    @army.delete
    redirect "/armies"
  end


end
