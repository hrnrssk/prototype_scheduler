require 'rails_helper'
RSpec.describe '装置機能', type: :system do
  describe '装置情報のテスト' do
    before do 
        visit new_user_registration_path
        click_on 'ゲストログイン（閲覧用）'
        FactoryBot.create(:equipment)
      end
    context '装置を登録する場合' do
      it '装置を登録できること' do
        visit equipments_path
        click_on '追加登録'
        fill_in 'equipment_name', with: 'テスト機'
        fill_in 'equipment_comment', with: 'テストする装置'
        click_on '情報更新'
        click_on '登録する'
        expect(page).to have_content '装置を登録しました'
      end
    end
    context '装置情報を編集する場合' do
      it '更新されること' do
        visit equipments_path
        all('tr td')[3].click_on '編集'
        fill_in 'equipment_comment', with: 'TESTする装置'
        click_on '情報更新'
        expect(page).to have_content '装置情報を編集しました'
      end
    end
    context '装置を削除する場合' do
      it '削除されること' do
        visit equipments_path
        all('tr td')[4].click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '装置を削除しました'
      end
    end
  end
end