class ArmiesController < AppController

  #create route
  get '/armies/new' do
    erb :'/armies/army_create'
  end

  post '/armies' do
    @army = Army.create(:army_name => params[:army_name], :faction => params[:faction], :unit_count => params[:unit_count])
    @army.user_id = session[:user_id]
    redirect "/armies/#{@army.id}"
  end

  #read route
  get '/armies/:id' do
    @army = Army.find(params[:id])
    erb :'/armies/show'
  end

  get '/armies' do
    @armies = []
    Army.all.each do |temp|
      if temp.user_id == current_user
        @armies << temp
      end
    end
    erb :'/armies/index'
  end



  #update route



  #delete route



end
