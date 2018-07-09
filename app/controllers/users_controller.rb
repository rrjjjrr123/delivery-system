class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index

  end
  
  def show
  end

  def new 
    @user = User.new
  end   

  def create
    @user = User.create!(user_params)
    if @user.save
      redirect_to admins_path
    else
      render 'new'
    end
  end

  def confirm_order 
  end  

  def update_user  
    if current_user!= user.admin? && current_user!= user.shopkeeper?      
      current_user.update_attributes(user_type:0)
      current_user.orders.create(order:params[:order])
      redirect_to root_path
    end  
  end                                                                                                                                   
  
  private

  def user_params
   params.require(:user).permit(:first_name, :last_name,
  :phone_no,:user_type,:email,:password,:password_confirmation)
  end  
end