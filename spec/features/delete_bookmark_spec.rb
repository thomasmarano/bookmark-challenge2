feature 'deleting bookmarks' do
  scenario 'lets you delete bookmarks' do
    Bookmark.create('Google', 'http://www.google.com')
    visit '/'
    click_on('View Bookmarks')
    click_on('delete')
    expect(page).not_to have_content('Google')
  end
end
