require 'rails_helper'
RSpec.describe '工程機能', type: :system do
  describe '工程のスケジューリングテスト' do
    before do 
        visit new_user_registration_path
        click_on 'ゲストログイン（閲覧用）'
        FactoryBot.create(:equipment)
        FactoryBot.create(:processing)
      end
    context '工程を登録する場合' do
      it '工程を登録できること' do
        visit processings_path
        click_on '工程登録'
        fill_in 'processing_name', with: 'テスト工程(テスト機)'
        select 'テスト機', from: 'processing[equipment_id]'
        select '01', from: 'processing[time_required(4i)]'
        select '30', from: 'processing[time_required(5i)]'
        fill_in 'processing_comment', with: 'テストする工程'
        click_on '情報更新'
        click_on '登録する'
        expect(page).to have_content '工程を登録しました'
      end
    end
    context '工程情報を編集する場合' do
      it '更新されること' do
        visit processings_path
        all('tr td')[6].click_on '予定と実績'
        fill_in 'processing_comment', with: 'TESTする工程'
        click_on '情報更新'
        expect(page).to have_content '工程情報を編集しました'
      end
    end
    context '工程を削除する場合' do
      it '削除されること' do
        visit processings_path
        all('tr td')[5].click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '工程を削除しました'
      end
    end
  end
end