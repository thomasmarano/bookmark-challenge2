feature 'update bookmarks' do
  scenario 'update a bookmark name and url' do
    Bookmark.create('Google', 'http://www.google.com')
    visit('/')
    click_on('View Bookmarks')
    expect(page).to have_content('Google')
    fill_in('title', with: 'Facebook', :match => :first)
    fill_in('url', with: 'http://www.facebook.com', :match => :first)
    click_on('update')
    expect(page).to have_content('Facebook')
  end
end
