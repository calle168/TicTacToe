class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :address
      t.integer :value

      t.timestamps null: false
    end
  end
end
