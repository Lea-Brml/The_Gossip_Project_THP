class ApplicationController < ActionController::Base


  def compare_user(session_id, user_id)

    if session_id == user_id
      true
    else
      false
    end

  end


end
