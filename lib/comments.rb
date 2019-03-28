require_relative 'databaseconnection'

class Comments

  attr_reader :text, :bookmark_id, :id

  def initialize(id, text, bookmark_id)
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end


  def self.create(text, bookmark_id)
    comment = DatabaseConnection.query("INSERT INTO comments (text, bookmark_id) VALUES('#{text}', '#{bookmark_id}') RETURNING id, text, bookmark_id")
    Comments.new(comment[0]['id'], comment[0]['text'], comment[0]['bookmark_id'])
  end


  def self.all
    comments = DatabaseConnection.query("SELECT * FROM comments")
    comments.map do |each_comment|
      Comments.new(each_comment['id'], each_comment['text'], each_comment['bookmark_id'])
    end
    comments
  end

  def self.where(bookmark_id)
    comments = DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id='#{bookmark_id}'")
    comments.map do |each_comment|
      Comments.new(each_comment['id'], each_comment['text'], each_comment['bookmark_id'])
    end
    comments
  end


end
