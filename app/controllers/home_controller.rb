class HomeController < ApplicationController
  def top
    @themes = Theme.all
  end
  
  def about
  end 
  
  def how_to_use
  end
  
  def my_page
   @user = current_user 
   @themes = current_user.themes
   @opinions = current_user.opinions.includes(:theme)
  end  
  
  
end
