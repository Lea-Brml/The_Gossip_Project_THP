class CitiesController < ApplicationController

  def index

    @cityy = City.all

  end


  def show

    @city = City.find(params[:id])
    @gossip = Gossip.all
    @user = User.all

  end



end
