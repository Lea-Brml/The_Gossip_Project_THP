class DashboardController < ApplicationController
  def profile

    @user = User.all

  end
end
