require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  context 'バリデーションチェック' do
    it "正常ケース" do
      expect(@user).to be_valid
    end

    it "ユーザー名が21字以上(異常)" do
      @user.name = "a" * 21
      @user.valid?
      expect(@user.errors[:name]).to include("は20文字以内で入力してください")
    end

    it "ユーザー名が空(異常)" do
      @user.name = ""
      @user.valid?
      expect(@user.errors[:name]).to include("を入力してください")
    end

    it "ユーザー名がnil(異常)" do
      @user.name = nil
      @user.valid?
      expect(@user.errors[:name]).to include("を入力してください")
    end

    it "メールアドレスのフォーマットが不正(異常)" do
      @user.mail = "aaa"
      @user.valid?
      expect(@user.errors[:mail]).to include("は不正な値です")
    end

    it "メールアドレスが空(異常)" do
      @user.mail = ""
      @user.valid?
      expect(@user.errors[:mail]).to include("を入力してください")
    end

    it "メールアドレスがnil(異常)" do
      @user.mail = nil
      @user.valid?
      expect(@user.errors[:mail]).to include("を入力してください")
    end

    it "メールアドレスが重複(異常)" do
      @user.save!
      @user = build(:user)
      @user.valid?
      expect(@user.errors[:mail]).to include("はすでに存在します")
    end

  end

end
