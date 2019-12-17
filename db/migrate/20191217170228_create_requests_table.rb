class CreateRequestsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :user
      t.references :spaces
      t.datetime :date_requested
    end
  end
end
