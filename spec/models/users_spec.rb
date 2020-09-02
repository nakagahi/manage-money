
require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:nakagawa)
  end


  describe 'バリデーション' do
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
end
