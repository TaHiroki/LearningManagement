require 'rails_helper'

describe 'ユーザー機能', type: :system do
  describe '進捗（TOP)画面表示' do
    before do
      #ユーザーA作成
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'A@com', introduction: 'A頑張ります')
      #Aのコメント作成
      FactoryBot.create(:comment, comment: 'Acomment', user: user_a)
      #Aの科目作成
      FactoryBot.create(:subject, user: user_a)
    end

    context 'Aがログインしている時', js: true do
      before do
        #Aでログイン
        visit login_users_path
        page.evaluate_script('$(".fade").removeClass("fade")')
        click_button 'ログイン'
        #fill_in 'Email', with: 'A@com'
        #fill_in 'Password', with: 'password'
        #click_button 'ログインする'
      end

      it 'ログイン画面チェック' do
        expect(page).to have_content 'ログインする'
      end

      #it 'Aのトップページが表示される' do
        #タスク、科目が表示されていることを確認
        #expect(page).to have_content 'Acomment'
        #expect(page).to have_content '数学'
      #end
    end
  end
end