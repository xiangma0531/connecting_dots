require 'rails_helper'

RSpec.describe Student, type: :model do
  before do
    @student = FactoryBot.build(:student)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '必要な情報をすべて正しく入力していれば登録できる' do
        expect(@student).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @student.email = ''
        @student.valid?
        expect(@student.errors.full_messages).to include("Eメールを入力してください")
      end

      it '重複したemailは保存できない' do
        @student.save
        another_student = FactoryBot.build(:student)
        another_student.email = @student.email
        another_student.valid?
        expect(another_student.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it '@がついていないemailは保存できない' do
        @student.email = 'testexample.com'
        @student.valid?
        expect(@student.errors.full_messages).to include("Eメールは不正な値です")
      end

      it 'passwordが空では登録できない' do
        @student.password = ''
        @student.valid?
        expect(@student.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @student.password = '000000'
        @student.password_confirmation = '0000000'
        @student.valid?
        expect(@student.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordが5文字以下では登録できない' do
        @student.password = '00000'
        @student.password_confirmation = '00000'
        @student.valid?
        expect(@student.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it 'nameが空では登録できない' do
        @student.name = ''
        @student.valid?
        expect(@student.errors.full_messages).to include("名前を入力してください")
      end

      it 'gradeが空では登録できない' do
        @student.grade = nil
        @student.valid?
        expect(@student.errors.full_messages).to include("学年を入力してください")
      end

      it 'teamが空では登録できない' do
        @student.team = nil
        @student.valid?
        expect(@student.errors.full_messages).to include("クラスを入力してください")
      end

      it 'numberが空では登録できない' do
        @student.number = nil
        @student.valid?
        expect(@student.errors.full_messages).to include("出席番号を入力してください")
      end
    end
  end
end
