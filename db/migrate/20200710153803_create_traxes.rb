class CreateTraxes < ActiveRecord::Migration
  def change
    create_table :traxes do |t|
      t.string :name
      t.datetime :date
      t.integer :score
      t.text :location
      t.integer :number
      t.text :interest
      t.timestamps null: false
    end
  end
end
