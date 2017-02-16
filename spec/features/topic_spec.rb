require 'rails_helper'

describe 'navigate' do
  before do
    @topic = Topic.create(title: "Sports")
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit topics_path
      expect(page.status_code).to eq(200)
    end

    it 'renders list of topics' do
      Topic.create(title: "Coding")
      visit topics_path
      expect(page).to have_content(/Sports|Coding/)
    end

    it 'each topic links to its show page' do
      visit topics_path(@topic)
      expect(page).to have_link(@topic.title, href: topic_path(@topic))
    end
  end

  describe 'show' do
    before do
      visit topic_path(@topic)
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'should display the topic title' do
      expect(page).to have_css('h1', text: 'Sports')
    end

    it 'should have a url that matches the custom url slug' do
      expect(current_path).to have_content('sports')
    end
  end

  describe 'form' do
    it 'can be reached successfully when navigating to /new path' do
      visit new_topic_path
      expect(page.status_code).to eq(200)
    end

    it 'allows users to create a new topic from the /new path' do
      visit new_topic_path

      fill_in 'topic[title]', with: "Star Wars"

      click_on "Save"

      expect(page).to have_content("Star Wars")
    end

    it 'allows users to update an existing topic from the /edit page' do
      visit edit_topic_path(@topic)

      fill_in 'topic[title]', with: "Star Wars"

      click_on "Save"

      expect(page).to have_content("Star Wars")
    end
  end
end