class CampaignsController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :json

  def index
    @campaings = Campaign.all
    respond_with(@campaings)
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.new(campaign_params)
    flash[:notice] = "Campaign was successfully created." if @campaign.save
    respond_with(@campaign)
  end

  def show
    @campaign = Campaign.find(params[:id])
    respond_with(@campaign)
  end

  private
    def campaign_params
      params.require(:campaign).permit(:title, :tags, :start_date, :end_date)
    end
end
