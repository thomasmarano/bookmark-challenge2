feature 'index page' do
  scenario 'see correct text displayed on index page' do
    visit ('/')
    expect(page).to have_content('VIEW BOOKMARKS')
  end
end
