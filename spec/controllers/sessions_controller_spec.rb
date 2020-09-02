require 'rails_helper'

RSpec.describe SessionsController, type: :controller do


  describe "sessionsコントローラーのテスト" do

    it "Get#new" do
      get :new
      expect(response.status).to eq 200
    end

  end
end
