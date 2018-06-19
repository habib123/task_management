require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before(:each) do
    @expert = create(:expert)
    create(:expert_detail, expert: @expert)
    sign_in @expert
  end

  context 'User Session' do
    it 'sign in' do
      get :index
      expect(response).to render_template :index
    end

    it 'sign out' do
      sign_out @expert
      expect(controller.current_user).to be_nil
    end

    it 'authentication check' do
      sign_out @expert
      get :index
      expect(response).to redirect_to new_expert_session_path
    end
  end

  context "Action" do
    it'#index' do
      get :index
      expect(response).to render_template :index
    end

    it 'show' do
      get :show, params: { id: @expert.id }
      expect(response).to render_template :show
    end
  end

end
