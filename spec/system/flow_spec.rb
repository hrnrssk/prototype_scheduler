require 'rails_helper'
RSpec.describe '試作品のスケジューリング機能', type: :system do
  describe '試作品のスケジューリングテスト' do
    before do
        visit new_user_registration_path
        click_on 'ゲストログイン（閲覧用）'
        FactoryBot.create(:equipment)
        FactoryBot.create(:processing)
        FactoryBot.create(:prototype)
        click_on 'マイページ'
        click_on '追加登録'
        select 'テスト工程(テスト機)', from: 'user[workings_attributes][0][processing_id]'
        click_on '情報更新'
      end
    context '工程フローを登録する場合' do
      it '１つの工程を追加できること' do
        visit prototypes_path
        all('tr td')[6].click_on '予定と実績'
        fill_in 'flow_number', with: '1'
        select 'テスト工程(テスト機)', from: 'flow[processing_id]'
        select 'guest', from: 'flow[user_id]'
        fill_in 'flow_scheduled_starting_time', with: '002021-02-20-00-00'
        fill_in 'flow_scheduled_ending_time', with: '002021-02-20-01-00'
        fill_in 'flow_ending_time', with: '002021-01-20-02-00'
        click_on '登録する'
        expect(page).to have_content '1'
        expect(page).to have_content 'テスト工程(テスト機)'
        expect(page).to have_content 'guest'
        expect(page).to have_content '2021-02-20 00:00'
        expect(page).to have_content '2021-02-20 01:00'
        expect(page).to have_content '2021-01-20 02:00'
      end
    end
  end
end