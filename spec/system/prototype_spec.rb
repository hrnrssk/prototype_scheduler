require 'rails_helper'
RSpec.describe '試作品機能', type: :system do
  describe '試作品情報のテスト' do
    before do 
        visit new_user_registration_path
        click_on 'ゲストログイン（閲覧用）'
        FactoryBot.create(:prototype)
      end
    context '試作品を登録する場合' do
      it '試作品を登録できること' do
        visit prototypes_path
        click_on '試作品登録'
        fill_in 'prototype_order_number', with: '00000002'
        fill_in 'prototype_customer', with: 'DIC'
        fill_in 'prototype_name', with: 'Diver'
        fill_in 'prototype_delivery_date', with: '2022/02/28'
        click_on '登録する'
        click_on '登録する'
        expect(page).to have_content '試作品を登録しました'
      end
    end
    context '試作品情報を編集する場合' do
      it '更新されること' do
        visit root_path
        all('tr td')[7].click_on '編集'
        fill_in 'prototype_delivery_date', with: '2021/02/28'
        click_on '登録する'
        expect(page).to have_content '試作品情報を編集しました'
      end
    end
    context '試作品情報を削除する場合' do
      it '削除されること' do
        visit root_path
        all('tr td')[8].click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '試作品を削除しました'
      end
    end
  end
end