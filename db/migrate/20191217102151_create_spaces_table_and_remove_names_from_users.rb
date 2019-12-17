class CreateSpacesTableAndRemoveNamesFromUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.references :user
      t.string :name
      t.string :description
      t.integer :price_per_night
    end

    remove_column :users, :first_name, :string
    remove_column :users, :surname, :string
  end
end
