class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :surname
      t.string :email
      t.string :password
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
