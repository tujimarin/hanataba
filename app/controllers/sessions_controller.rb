class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by( tel: params[:session][:tel] )
    if user && user.authenticate( params[:session][:password] )
      login user
      redirect_to user
    else
      flash[:error] = "電話番号、もしくはパスワードが間違っています。"
      render :new
    end
  end

  def destroy
  end
end
