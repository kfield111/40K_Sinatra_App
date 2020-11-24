class ArmiesController < AppController

  #create route
  get '/armies/new' do
    if is_logged_in?
      erb :'/armies/army_create'
    else
      redirect "/login"
    end
  end

  post '/armies' do
    @army = current_user.armies.new(params)
    if @army.save
      redirect "/armies/#{@army.id}"
    else
      erb :'/armies/army_not_created'
    end
  end

  #read route
  get '/armies/:id' do
    set_army
    if authorized?
      erb :'armies/show'
    else
      erb :'not_authorized'
    end
  end

  get '/armies' do
    erb :'/armies/index'
  end

  #update route
  get '/armies/:id/edit' do
    if authorized?
      set_army
      erb :'armies/army_edit'
    else
      erb :'not_authorized'
    end
  end

  patch '/armies/:id' do
    set_army
    params.delete(:_method)
    @army.update(params)
    redirect "/armies/#{@army.id}"
  end


  #delete route
  delete '/armies/:id/delete' do
    if authorized?
      set_army.delete
      redirect "/armies"
    end
  end

#--------------------------HELPERS--------------------------------------------
  helpers do
    def set_army
      @army = Army.find_by_id(params[:id])
    end

    def my_army?
      set_army.user_id == current_user.id
    end

    def authorized?
      is_logged_in? && my_army?
    end

  end
#--------------------------/HELPERS--------------------------------------------

end
