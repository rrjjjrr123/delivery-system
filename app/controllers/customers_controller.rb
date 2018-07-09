class CustomersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = User.where(user_type:0)
  end  



  def show 
  end  
end
