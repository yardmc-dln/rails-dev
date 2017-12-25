
class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:edit,:update]
    before_action :check_authorization, only: [:edit, :update]
    before_action :set_user 
    def show
        @user = User.find(params[:id])
    end
    
    def edit
        
    end
    
    def update
      if @user.update(user_params)
        redirect_to @user
      else
        flash.now[:alert] = "Hata oluştu. Tekrar deneyin."
        render :edit
      end
    end
    
    private
    
    def check_authorization
      unless current_user.id == params[:id].to_i
        redirect_to root_url
      end
    end
    
    def set_user
        @user = User.find(params[:id])
    end
        
    def user_params
      params.require(:user).permit(:email, :avatar, :descriptions)
    end
end
