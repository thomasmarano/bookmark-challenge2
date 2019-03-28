require 'bookmark'
require 'pg'
feature 'view bookmarks' do
  scenario 'lets you view bookmarks in the database' do
    Bookmark.create('Google', 'http://www.google.com')
    Bookmark.create('Facebook', 'http://www.facebook.com')
    visit '/'
    click_on('View Bookmarks')
    expect(page).to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('Facebook', href: 'http://www.facebook.com')
  end
end
