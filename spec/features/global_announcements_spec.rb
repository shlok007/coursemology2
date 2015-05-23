require 'rails_helper'

RSpec.describe 'Global announcements', type: :feature do
  subject { page }
  let(:instance) { create(:instance) }

  with_tenant(:instance) do
    let(:user) { create(:user) }

    describe 'no global announcements' do
      before do
        instance.announcements.clear
        SystemAnnouncement.destroy_all
        visit root_path
      end

      it { is_expected.not_to have_selector('div.global-announcement') }
    end

    describe 'one valid global announcement' do
      let(:announcement) do
        build(:instance_announcement, instance: instance, creator: user, updater: user)
      end

      before do
        instance.announcements.clear
        SystemAnnouncement.destroy_all
        announcement.save!
        visit root_path
      end

      it 'shows the announcement' do
        expect(page).to have_tag('div.global-announcement') do
          with_tag('div.panel-heading', text: format('×%s', announcement.title))
          with_tag('div.panel-body', text: announcement.content)
        end
      end
    end

    describe 'many valid global announcements' do
      let(:announcements) do
        build_list(:instance_announcement, 2, instance: instance, creator: user, updater: user)
      end

      before do
        instance.announcements.clear
        SystemAnnouncement.destroy_all
        announcements.each(&:save!)
        visit root_path
      end

      it 'shows the latest announcement' do
        announcement = announcements.last
        expect(page).to have_tag('div.global-announcement') do
          with_tag('div.panel-heading', text: format('×%s', announcement.title))
          with_tag('div.panel-body', text: announcement.content)
        end
      end

      it 'shows the more announcements link' do
        expect(page).to have_tag('div.global-announcement') do
          with_tag('div.panel-footer',
                   text: I18n.t('layouts.global_announcements.more_announcements'))
        end
      end
    end
  end
end
