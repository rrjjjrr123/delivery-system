class AdminsController < ApplicationController
  
  def index
    @users = User.all_except(current_user)        
  end 
end
