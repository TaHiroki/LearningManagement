require 'rails_helper'

describe 'LM管理機能', type: :system do
  describe 'TOPページ表示' do
    before do
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
    end

    context 'ユーザーAがログインしている時' do
      before do
        visit login_users_path
        click_button 'ログイン'
        fill_in 'email', with: 'a@example.com'
        fill_in 'Password', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザーAでログインして進捗画面を表示される' do
        expect(page).to have_content '進捗状況'
      end
    end
  end
end