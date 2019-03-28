require 'databaseconnection'


describe DatabaseConnection do


  describe '#setup' do
    it 'sets up persistent connection with database' do
      expect(DatabaseConnection).to respond_to(:setup).with(1).argument
    end

    it 'this connection is persistent' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '#query' do
    it 'runs a query in our application' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
