
require 'pg'
require_relative 'databaseconnection'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = title
  end


  def self.create(title, url)
    return false unless is_url?(url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, title, url")
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

  def comments(comment_class = Comment)
    comment_class.where(@id)
  end


  def self.all
    bookmarks = DatabaseConnection.query('SELECT * FROM bookmarks')
    bookmarks.map do |bookmark|
      Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
    end
    bookmarks
  end

  def self.update(id, url, title)
    DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}' WHERE id = '#{id}'")
    DatabaseConnection.query("UPDATE bookmarks SET title = '#{title}' WHERE id = '#{id}'")
  end


  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = '#{id}'")
  end
end
