class ChangeDateRequestedTypeFromDatetimeToString < ActiveRecord::Migration[6.0]
  def change
    change_column :requests, :date_requested, :string
  end
end
