ENV['RACK_ENV'] = 'bookmark_manager'

require 'sinatra/base'
require_relative 'lib/setup_script'
require_relative 'lib/bookmark'
require_relative 'lib/comments'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

enable :sessions, :method_override
register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  post '/bookmark-saver' do
    flash[:notice] = 'You must submit a valid URL' unless Bookmark.create(params[:bookmark_name],params[:new_bookmark])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  delete '/bookmarks/:id/delete' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  post '/comments/:id' do
    Comments.create(params[:comment], params[:id])
    redirect 'bookmarks'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(params[:id], params[:url], params[:title])
    redirect '/bookmarks'
  end



  run! if app_file == $0

end
