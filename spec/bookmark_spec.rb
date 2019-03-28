require 'bookmark'
require 'pg'
# require_relative 'lib/setup_script'

describe Bookmark do


  describe '#create' do
    it 'lets you create a new bookmark' do
      Bookmark.create('Trafalgar', 'http://www.trafalgar.com')
      bookmarks = Bookmark.all
      expect(bookmarks[0]['title']).to eq('Trafalgar')
    end
  end


  describe '#all' do
    it 'returns a list of all bookmarks' do
      Bookmark.create('Google', 'http://www.google.com')
      Bookmark.create('Facebook', 'http://www.facebook.com')
      bookmarks = Bookmark.all
      expect(bookmarks[0]['title']).to include('Google')
      expect(bookmarks[1]['title']).to include('Facebook')
    end
  end

  describe '#delete' do
    it 'deletes a bookmark from the database' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.create('Google', 'http://www.google.com')
      Bookmark.create('Facebook', 'http://www.facebook.com')
      bookmark = connection.exec("SELECT id FROM bookmarks WHERE title = 'Google'")
      Bookmark.delete(bookmark[0]['id'])
      bookmarks = Bookmark.all
      expect(bookmarks[0]['title']).not_to eq('Google')
    end
  end

  describe '#update' do
    it 'lets you update a bookmark' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.create('Google', 'http://www.google.com')
      bookmark = connection.exec("SELECT id FROM bookmarks WHERE title = 'Google'")
      Bookmark.update(bookmark[0]['id'], 'http://www.facebook.com', 'Facebook')
      bookmarks = Bookmark.all
      expect(bookmarks[0]['title']).to eq('Facebook')
    end
  end


end
