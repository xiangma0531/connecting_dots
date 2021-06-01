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
        expect(@student.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailは保存できない' do
        @student.save
        another_student = FactoryBot.build(:student)
        another_student.email = @student.email
        another_student.valid?
        expect(another_student.errors.full_messages).to include("Email has already been taken")
      end

      it '@がついていないemailは保存できない' do
        @student.email = 'testexample.com'
        @student.valid?
        expect(@student.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @student.password = ''
        @student.valid?
        expect(@student.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @student.password = '000000'
        @student.password_confirmation = '0000000'
        @student.valid?
        expect(@student.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが5文字以下では登録できない' do
        @student.password = '00000'
        @student.password_confirmation = '00000'
        @student.valid?
        expect(@student.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'nameが空では登録できない' do
        @student.name = ''
        @student.valid?
        expect(@student.errors.full_messages).to include("Name can't be blank")
      end

      it 'gradeが空では登録できない' do
        @student.grade = nil
        @student.valid?
        expect(@student.errors.full_messages).to include("Grade can't be blank")
      end

      it 'teamが空では登録できない' do
        @student.team = nil
        @student.valid?
        expect(@student.errors.full_messages).to include("Team can't be blank")
      end

      it 'numberが空では登録できない' do
        @student.number = nil
        @student.valid?
        expect(@student.errors.full_messages).to include("Number can't be blank")
      end
    end
  end
end
