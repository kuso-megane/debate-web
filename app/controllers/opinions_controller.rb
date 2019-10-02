class OpinionsController < ApplicationController
  
  before_action :set_theme
  
  def index
    @agree_opinions = Opinion.agree
    @disagree_opinions = Opinion.disagree
    @neutral_opinions = Opinion.neutral
  end  
  
  def new
    @opinion = Opinion.new
  end  
  
  def create
    @opinion = Opinion.new(opinion_params)
    @opinion.user = current_user
    @opinion.theme = @theme
    @opinion.opinion_type = @opinion.content.present? ? 'exist' : 'nothing'
    if @opinion.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end  
  
  
  private
  
  def  opinion_params
   params.require(:opinion).permit(:content, :position)
  end
  
  def set_theme
    @theme = Theme.find(params[:theme_id])
  end
end
