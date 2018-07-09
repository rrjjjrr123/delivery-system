class ShopkeepersController < ApplicationController  
  
  def index
    debugger
    @users = User.where(user_type: 0)
  end  
 end
