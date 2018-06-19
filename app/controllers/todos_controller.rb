class TodosController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :json
  before_action :current_campaign, only: :create

  def index
  end

  def new
    @todo =  Todo.new
  end

  def create
    @todo = @campaign.todos.new(todo_params)
    @todo.user = current_user
    flash[:notice] = "Todo was successfully created." if @todo.save
    respond_with(@todos, location: campaign_path(@campaign))
  end

  def show
    @todo = Todo.find(params[:id])
    respond_with(@todo)
  end

  private

    def todo_params
      params.require(:todo).permit(:task)
    end

    def current_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end
end
