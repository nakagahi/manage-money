require 'rails_helper'

RSpec.describe SessionsController, type: :controller do


  describe "sessionsコントローラーのnewメソッドのテスト" do


    context "ユーザがログインしていない時" do

      it "newアクションにgetリクエストを送るとログインページにリダイレクトされる" do

        get :new

        expect(flash.empty?).to be true

        expect(response).to render_template  "sessions/new"

      end

    context "ユーザがログインしている時" do

      before do

        user = create(:nakagawa)
        log_in(user)
      end

      it "newアクションにgetリクエストを送るとトップページにリダイレクトされる" do

        get :new

        expect(flash.empty?).to be false

        expect(flash[:danger]).to eq "ログアウトしてください"

        expect(response).to render_template "main/top"

      end

      end
    end


    end

    describe "SessionsControllerのcreateアクションのテスト" do

      before do

        @user = create(:nakagawa)

      end

      context "ログインしていない状態でcreateアクションにpostリクエストを送信" do

        it "すべての項目を入力してpostメソッドを送信" do

          post :create, params: {session: {

            email: "iwbb1022@icloud.com",
            password: "nh10221022",
            }}

          expect(flash[:success]).to eq "nakagawaさんようこそ!"


          expect(response).to redirect_to user_path(@user)

          assert is_logged_in?

        end

        it "メールアドレスだけ入力してpostメソッドを送信" do

          post :create, params: {session: {

            email: "iwbb1022@icloud.com",
            password: ""

            }}

            expect(flash[:danger]).to eq "ログインに失敗しました"

            expect(response).to render_template "sessions/new"

            expect(is_logged_in?).to eq false

        end

        it "パスワードを入力してパスワードを送信" do

          post :create, params: {session: {

            email: "",
            password: "nh10221022"
            }}

            expect(flash[:danger]).to eq "ログインに失敗しました"

            # expect(response).to render_template "sessions/new"
            assert_template 'sessions/new'

            expect(is_logged_in?).to eq false

        end


      end


    end


  end
