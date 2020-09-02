require 'rails_helper'

RSpec.describe HomeController, type: :controller do


  describe "Homesコントローラーのテスト" do

    it "GET#top" do

      get :top
      # 正常に動作しているか (http status)
      expect(response.status).to eq 200
      # 正常にhttpメソッドを呼び出せているか
      expect(response.status).to render_template :top


    end

    it "GET#about" do

      get :about

      expect(response.status).to eq 200
      expect(response.status).to render_template :about

    end


  end
end
