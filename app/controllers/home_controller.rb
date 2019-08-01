class HomeController < ApplicationController
  def top
    @themes = Theme.all
  end
  
  def about
  end 
  
  def how_to_use
  end
  
  def sample_contribution
  end 
end
