class SessionsController < ApplicationController
  layout "signup", only: [ :new ]
  allow_unauthenticated_access only: %i[ new create ]

  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { 
    redirect_to new_session_url, alert: "Try again later.", status: :see_other 
  }

  def new
  end

  def create
    if user = User.authenticate_by(email_address: params[:email_address], password: params[:password])
      start_new_session_for user
      redirect_to root_path, notice: "We}elcome to Elysium.", status: :see_other
    else
      redirect_to new_session_path, alert: "Email o contraseña incorrectos", status: :see_other
    end
  end

  def destroy
    terminate_session
    redirect_to root_path, notice: "Has cerrado sesión correctamente.", status: :see_other
  end
end