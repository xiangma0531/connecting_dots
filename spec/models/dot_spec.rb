require 'rails_helper'

RSpec.describe Dot, type: :model do
  before do
    student = FactoryBot.create(:student)
    @dot = FactoryBot.build(:dot)
  end

  describe '新規投稿機能' do
    context '新規投稿が保存されるとき' do
      it 'すべての項目を正しく入力していれば保存される' do
        expect(@dot).to be_valid
      end
    end

    context '新規投稿が保存されないとき' do
      it 'titleが空では保存されない' do
        @dot.title = ''
        @dot.valid?
        expect(@dot.errors.full_messages).to include("タイトルを入力してください")
      end
      
      it 'acted_atが空では保存されない' do
        @dot.acted_at = ''
        @dot.valid?
        expect(@dot.errors.full_messages).to include("活動日を入力してください")
      end

      it 'categoryが空では保存されない' do
        @dot.category_id = nil
        @dot.valid?
        expect(@dot.errors.full_messages).to include("カテゴリーを入力してください")
      end

      it 'introductionが空では保存されない' do
        @dot.introduction = ''
        @dot.valid?
        expect(@dot.errors.full_messages).to include("概要を入力してください")
      end

      it 'effortが空では保存されない' do
        @dot.effort = ''
        @dot.valid?
        expect(@dot.errors.full_messages).to include("頑張ったことを入力してください")
      end

      it 'studyが空では保存されない' do
        @dot.study = ''
        @dot.valid?
        expect(@dot.errors.full_messages).to include("活動を通して学んだことを入力してください")
      end

      it '紐づくstudentがいなければ保存されない' do
        @dot.student = nil
        @dot.valid?
        expect(@dot.errors.full_messages).to include("Studentを入力してください")
      end
    end
  end
end
