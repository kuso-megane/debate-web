class OpinionsController < ApplicationController
  
  before_action :set_theme
  
  def index
    @agree_opinions = @theme.opinions.agree
    @disagree_opinions = @theme.opinions.disagree
    @neutral_opinions = @theme.opinions.neutral
    
    @agree_count = @agree_opinions.distinct.count(:user_id)
    @disagree_count = @disagree_opinions.distinct.count(:user_id)
    @neutral_count = @neutral_opinions.distinct.count(:user_id)
    
    @user_position = if user_signed_in? 
                       current_user.opinions.find_by(theme: @theme, content: nil)
                    else
                      nil
                    end  
  end
  
  def new
    @opinion = Opinion.new
  end  
  
  def create
    @opinion = if params.dig(:opinion, :content).present?
                 opinion = Opinion.new
                 opinion.assign_attributes(opinion_params)
                 opinion
               else
                 opinion = @theme.opinions.find_or_initialize_by(user: current_user, content: nil)
                 opinion.assign_attributes(opinion_params)
                 opinion
               end
    
    @opinion.user = current_user
    @opinion.theme = @theme
    @opinion.opinion_type = @opinion.content.nil? ? 'nothing' : 'exist'
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
