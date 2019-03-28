feature 'gives error for incorrect email' do
  scenario 'makes sure you enter valid url' do
    visit('/')
    click_on('View Bookmarks')
    fill_in('bookmark_name', with: 'Tbone')
    fill_in('new_bookmark', with: 'not a bookmark')
    click_on('Submit')
    expect(page).not_to have_content('Tbone')
    expect(page).to have_content('You must submit a valid URL')
  end
end
