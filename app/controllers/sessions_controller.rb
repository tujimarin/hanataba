class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by( tel: params[:session][:tel] )
    if user && user.authenticate( params[:session][:password] )
      login user
      redirect_to root_path, notice: "ログインしました。"
    else
      redirect_to root_path, notice: "電話番号、もしくはパスワードが間違っています。"
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "ログアウトしました。"
  end
end
