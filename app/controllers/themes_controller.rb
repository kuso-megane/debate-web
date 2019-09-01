class ThemesController < ApplicationController
  def index
    @themes = Theme.all
  end
  
  def new
    @theme = Theme.new
  end  
  
  
  def create
    @theme = Theme.new(themes_params)
    
    if @theme.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  
  private
  
  def themes_params
    params.require(:theme).permit(:content)
  end
end
