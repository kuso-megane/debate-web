class ThemesController < ApplicationController
  def index
    pp '-------index'
    @themes = if params[:search]
                Theme.where('content like ?', "%#{params[:search]}%")
              else
                Theme.all
              end
    
  end
  
  def new
    @theme = Theme.new
  end  
  
  def create
    @theme = Theme.new(themes_params)
    @theme.user = current_user
    if @theme.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
  

  
  private
  
  def themes_params
    params.require(:theme).permit(:content, :image)
  end
end
