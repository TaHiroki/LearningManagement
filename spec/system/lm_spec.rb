require 'rails_helper'

describe 'LM管理機能', type: :system do
  describe 'User index ページ関係' do
    before do
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      subject_a = FactoryBot.create(:subject, user: user_a)
    end

    context 'ユーザーAがログイン' do
      before do
        visit login_users_path
        click_button 'ログイン'
        fill_in 'email', with: 'a@example.com'
        fill_in 'password', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザーAでログインして進捗画面を表示される' do
        expect(page).to have_content '様、ログインしました！'
        expect(page).to have_content '英語'
      end

      it '使い方を押すとモーダルで表示,削除' do
        click_button '使い方'
        expect(page).to have_content 'STEP1'
        click_button 'closebtn'
        expect(page).to have_content '進捗状況'
      end

      it '科目登録' do
        click_on '科目登録'
        select '数学', from: '科目選択　　'
        fill_in '個数', with: '5'
        click_button '登録する'
        expect(page).to have_content '数学'
        expect(page).to have_content '5'
      end

      it '進捗保存' do
        click_on '進捗保存'
        find(".form-control").set("10")
        click_on '保存する'
        expect(page).to have_content '10'
      end

      it '進捗編集 修正'do
        click_on '科目編集'
        click_on '修正'
        select '理科', from: '科目選択　　'
        find(".form-control").set("20")
        click_on '登録する'
        expect(page).to have_content '理科'
        expect(page).to have_content '20'
      end

    end
  end
end