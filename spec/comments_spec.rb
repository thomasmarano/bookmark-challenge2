require 'comments'
require 'databaseconnection'

describe Comments do

  describe '#all' do
    it 'lets you see all the comments in the comments table' do
      DatabaseConnection.query("INSERT INTO bookmarks (id, title, url) VALUES(1000 ,'TEST', 'TEST')")
      comment = Comments.create('hello', 1000)
      Comments.create('hello', 1000)
      comment = Comments.all

      expect(comment[0]['text']).to eq('hello')
      expect(comment[0]['bookmark_id']).to eq("1000")
    end
  end

  describe '#create' do
    # it 'lets you add a comment to comments table in db' do
    #   DatabaseConnection.query("INSERT INTO bookmarks (id, title, url) VALUES(1000 ,'TEST', 'TEST')")
    #   comment = Comments.create('hello', 1000)
    #
    # end
  end

  describe '#find' do
    it 'lets you find all comments that share a bookmark_id' do
      DatabaseConnection.query("INSERT INTO bookmarks (id, title, url) VALUES(1000 ,'TEST', 'TEST')")
      Comments.create('hello', 1000)
      Comments.create('goodbye', 1000)
      Comments.create('English', 1000)
      comments = Comments.find(1000)
      expect(comments[0]['text']).to eq('hello')
      expect(comments[1]['text']).to eq('goodbye')
      expect(comments[2]['text']).to eq('English')
    end
  end
end
