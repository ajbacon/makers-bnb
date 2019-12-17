class ChangeNameOfSpacesColumnToSpaceInRequestsTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :requests, :spaces_id, :space_id
  end
end
