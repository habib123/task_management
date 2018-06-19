module CampaignsHelper
  def timeduration(campaign)
     campaign.end_date - campaign.start_date
  end
end
