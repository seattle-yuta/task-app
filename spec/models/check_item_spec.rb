require 'rails_helper'

RSpec.describe CheckItem, type: :model do
  before do
    @check_item = build(:check_item)
  end

  context 'バリデーションチェック' do
    it "正常ケース" do
      expect(@check_item).to be_valid
    end

    it "チェック項目名が空(異常)" do
      @check_item.name = ""
      @check_item.valid?
      expect(@check_item.errors[:name]).to include("を入力してください")
    end

    it "チェック項目名がnil(異常)" do
      @check_item.name = nil
      @check_item.valid?
      expect(@check_item.errors[:name]).to include("を入力してください")
    end
    
  end
  
end
