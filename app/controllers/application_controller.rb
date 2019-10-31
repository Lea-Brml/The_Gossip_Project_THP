class ApplicationController < ActionController::Base


  def compare_user(session_id, user_id)

    return session_id == user_id

  end


end
