class ApplicationController < ActionController::Base


  def compare_user(session_id, user_id)

    return session_id == user_id

  end

  def authenticate_user

    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end

  end


end
