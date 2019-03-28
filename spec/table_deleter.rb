require 'pg'

def empty_bookmarks_table
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks, comments RESTART IDENTITY") unless ENV['RACK_ENV'] == 'bookmark_manager'
end
