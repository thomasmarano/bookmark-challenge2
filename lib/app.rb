require 'sinatra/base'
require_relative 'bookmark'


class Bookmark < Sinatra::Base

  get '/' do
    "Hello World"
  end

  run! if app_file == $0

end
