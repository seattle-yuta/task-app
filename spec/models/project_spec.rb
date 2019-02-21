require 'rails_helper'

RSpec.describe Project, type: :model do
  before do
    @project = build(:project)
  end

  context 'バリデーションチェック' do
    it "正常ケース" do
      expect(@project).to be_valid
    end

    it "プロジェクト名が空(異常)" do
      @project.name = ""
      @project.valid?
      expect(@project.errors[:name]).to include("を入力してください")
    end

    it "プロジェクト名がnil(異常)" do
      @project.name = nil
      @project.valid?
      expect(@project.errors[:name]).to include("を入力してください")
    end

    it "プロジェクト名が21字以上(異常)" do
      @project.name = "a" * 21
      @project.valid?
      expect(@project.errors[:name]).to include("は20文字以内で入力してください")
    end

  end

end
