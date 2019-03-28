require_relative 'databaseconnection'

DatabaseConnection.setup(ENV['RACK_ENV'])
