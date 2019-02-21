require 'rails_helper'

RSpec.describe BoardList, type: :model do
  before do
    @board_list = build(:board_list)
  end

  context 'バリデーションチェック' do
    it "正常ケース" do
      expect(@board_list).to be_valid
    end

    it "リスト名が空(異常)" do
      @board_list.name = ""
      @board_list.valid?
      expect(@board_list.errors[:name]).to include("を入力してください")
    end

    it "リスト名がnil(異常)" do
      @board_list.name = nil
      @board_list.valid?
      expect(@board_list.errors[:name]).to include("を入力してください")
    end

  end
  
end
