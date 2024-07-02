class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])

    if user 
      session[:user_id] = user.id
      redirect_to "/"
    else
    # If user's login doesn't work, send them back to the login form.
      flash.now[:alert] = 'Invalid email/password combination'
      redirect_to "/login"
    end
  end

  def destroy
    # session.delete(:user_id)
    session[:user_id] = nil
    redirect_to '/login'
  end
end
