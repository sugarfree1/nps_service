module TransactionalRepositoryHelper
  def self.included(_module)
    RSpec.configure do |config|
      db = Sequel::Model.db
      config.around(:each) do |example|
        db.transaction(rollback: :always, auto_savepoint: true) do
          example.run
        end
      end
    end
  end
end
