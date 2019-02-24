require 'rails_helper'

RSpec.describe CheckList, type: :model do

  before do
    @check_list = build(:check_list)
  end
  
  context 'バリデーションチェック' do
    it "正常ケース" do
      expect(@check_list).to be_valid
    end

    it "チェックリスト名が空(異常)" do
      @check_list.name = ""
      @check_list.valid?
      expect(@check_list.errors[:name]).to include("を入力してください")
    end

    it "チェックリスト名がnil(異常)" do
      @check_list.name = nil
      @check_list.valid?
      expect(@check_list.errors[:name]).to include("を入力してください")
    end

  end

end
