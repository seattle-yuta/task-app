require 'rails_helper'

RSpec.describe User, type: :model do

  context 'バリデーションチェック' do
    it "ユーザー名が正常(正常)" do
      user = User.new(name: "sample")
      expect(user).to be_valid
    end

    it "ユーザー名が21字以上(異常)" do
      user = User.new(name: "a" * 21)
      expect(user).to be_invalid
    end

    it "ユーザー名が空(異常)" do
      user = User.new(name: "")
      expect(user).to be_invalid
    end

    it "ユーザー名がnil(異常)" do
      user = User.new(name: nil)
      expect(user).to be_invalid
    end

  end

end
