class Campaigns::CommentsController < CommentsController
  before_action :set_commentable

  private

   def set_commentable
     @commentable =  Campaign.find(params[:campaign_id])
   end
end
