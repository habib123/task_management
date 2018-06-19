class UsersController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :json

  def index
    respond_with(@users)
  end

  def edit
    @user = User.find(params[:id])
    if @user.try(:type) == 'Expert'
      @user.build_expert_detail if @user.expert_detail.blank?
    end
  end

  def update
    @user = User.find(params[:id])
    flash[:notice] = "User was successfully updated." if @user.update(user_params)
    respond_with(@user, location: root_path )
  end

  def show
    @user = User.find(params[:id])
    respond_with(@user)
  end

  def edit_assign
    @user = User.find(params[:id])
  end

  def assign
    @user = User.find(params[:user_id])
    flash[:notice] = "User was successfully updated." if @user.update(assign_params)
    respond_with(@user, location: root_path )
  end

  private

    def user_type
      @user.type.empty? ? :user : @user.type.underscore.to_sym
    end

    def user_params
     params.require(user_type).permit(:username, :status, expert_detail_attributes:[:service, :profession])
    end

    def assign_params
      params.require(user_type).permit(:status, role_ids: [])
    end
end
