class ArmiesController < AppController

  #create route
  get '/armies/new' do
    erb :'/armies/army_create'
  end

  post '/armies' do
    @army = Army.new(params)
    @army.user_id = current_user.id
    if @army.save
      redirect "/armies/#{@army.id}"
    end
  end

  #read route
  get '/armies/:id' do
    set_army
    if is_logged_in? && my_army?
      erb :'/armies/show'
    else
      erb :'not_authorized'
    end
  end

  get '/armies' do
    erb :'/armies/index'
  end

  #update route
  get '/armies/:id/edit' do
    if is_logged_in?
      set_army
      erb :'armies/army_edit'
    end
  end

  patch '/armies/:id' do
    set_army
    @army.update(:army_name => params[:army_name], :faction => params[:faction], :army_point_cost => params[:army_point_cost])
    redirect "/armies/#{@army.id}"
  end


  #delete route
  delete '/armies/:id/delete' do
    set_army.delete
    redirect "/armies"
  end

  helpers do
    def set_army
      @army = Army.find_by_id(params[:id])
    end

    def my_army?
      set_army.user_id == current_user.id
    end

  end


end
