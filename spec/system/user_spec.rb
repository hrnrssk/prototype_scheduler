require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  describe 'ゲストユーザー登録のテスト' do
    context 'サインインした場合' do
      it 'ゲストログインできること' do
        visit new_user_registration_path
        click_on 'ゲストログイン（閲覧用）'
        expect(page).to have_content 'guest'
      end
    end
    context 'ユーザー情報ページに飛べること' do
      it 'ユーザー情報画面に遷移すること' do
        visit new_user_registration_path
        click_on 'ゲストログイン（閲覧用）'
        click_on 'マイページ'
        expect(page).to have_content '個人スケジュール'
      end
    end
    context 'ユーザがログアウトした場合' do
      it 'サインアップ画面に遷移すること' do
        visit new_user_registration_path
        click_on 'ゲストログイン（閲覧用）'
        visit prototypes_path
        click_on 'ログアウト'
        expect(page).to have_content 'ゲストログイン（閲覧用）'
      end
    end
  end
end