
require 'rails_helper'

RSpec.describe User, type: :model do






  describe 'バリデーション' do

    before do
      @user = create(:nakagawa)
    end
    
    it 'nameとemailとパスワード値が設定されていれば、OK' do
      expect(@user.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it 'passwordが空だとNG' do

      @user.password_digest = ''
      expect(@user.valid?).to eq(false)

    end

    it '名前の長さが50文字より長いとNG' do

      @user.name = 'a' * 51
      expect(@user.valid?).to eq(false)


    end

    it '名前の長さが50文字以内だとOK' do
      @user.name = 'a' * 49
      expect(@user.valid?).to eq(true)
    end

    it 'メールの長さが255文字以内だとOK' do

      @user.email = 'b' * 254
      expect(@user.valid?).to eq(true)

    end

    it 'メールの長さが256文字異常だとNG' do

      @user.email = "b" * 256
      expect(@user.valid?).to eq(false)
    end

  end

  describe 'letの勉強1' do
    let(:params){{ name: 'ナカガワ'}}

    context 'メールアドレスがない場合' do
      before do
        params.merge!(password: "nh102301023")
      end

      it 'エラーになる' do
        user = User.new(params)

        expect(user.valid?).to eq(false)


      end

    end
  end

#  expect(user.greet).to が呼ばれる => user って何だ？
# let(:user) { User.new(params) } が呼ばれる => params って何だ？
# let(:params) { { name: 'たろう', age: age } } が呼ばれる => age って何だ？
# let(:age) { 12 } （または13） が呼ばれる
# 結果として expect(User.new(name: 'たろう', age: 12).greet).to を呼んだことになる

  describe 'letの勉強2' do
    let(:user){ User.new(name: "中川", email: email, password: password) }

    context 'メールアドレスもパスワードもない場合' do

      let(:email){""}
      let(:password){""}

      it 'エラーになる' do

        expect(user.valid?).to eq(false)
      end
    end
    context 'パスワードがない場合' do


      let(:email){"iwbb1022@icloud.com"}
      let(:password){""}


      it 'エラーになる' do
        expect(user.valid?).to eq(false)
      end
    end

    context '全部ある場合' do


        let(:email){"iwbb1023@icloud.com"}
        let(:password){"nh10221022"}

      it 'エラーにならない'do
        expect(user.valid?).to eq (true)
        puts user.errors.full_messages
      end

    end
  end
end
