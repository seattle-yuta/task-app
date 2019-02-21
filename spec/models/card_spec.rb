require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = build(:card)
  end

  context 'バリデーションチェック' do
    it "正常ケース" do
      expect(@card).to be_valid
    end

    it "カード名が空(異常)" do
      @card.name = ""
      @card.valid?
      expect(@card.errors[:name]).to include("を入力してください")
    end

    it "カード名がnil(異常)" do
      @card.name = nil
      @card.valid?
      expect(@card.errors[:name]).to include("を入力してください")
    end

  end
  
end
