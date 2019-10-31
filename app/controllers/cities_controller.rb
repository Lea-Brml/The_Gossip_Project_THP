class CitiesController < ApplicationController


  include SessionsHelper
  before_action :authenticate_user, only: [:index, :show,]

  
  def index

    @cityy = City.all

  end


  def show

    @city = City.find(params[:id])
    @gossip = Gossip.all
    @user = User.all

  end



end
