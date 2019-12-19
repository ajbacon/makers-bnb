class AddColumnsAvailableFromAndAvailableToToSpace < ActiveRecord::Migration[6.0]
  def change
    add_column :spaces, :available_from, :string
    add_column :spaces, :available_to, :string
  end
end
