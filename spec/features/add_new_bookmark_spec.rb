feature 'adding bookmarks' do
  scenario 'add bookmark and see it displayed' do
    visit('/')
    click_on('View Bookmarks')
    fill_in('bookmark_name', with: 'Tbone')
    fill_in('new_bookmark', with: 'http://http://www.tbone.com')
    click_on('Submit')
    expect(page).to have_content('Tbone')
  end
end
