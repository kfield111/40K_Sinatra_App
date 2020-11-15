class ArmiesController < AppController

  get '/action_page.php' do
    @unit = Unit.create(:unit_name => params[:unit_name])
    user = current_user
    @army = Army.find_by(id: params[:army_id])
    @army.units << @unit
    @unit.user = user
    redirect "/armies/#{@army.id}"
  end
end
