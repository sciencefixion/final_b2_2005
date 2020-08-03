class CreatePassengers < ActiveRecord::Migration[5.1]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :age

      t.timestamps
    end
  end
end
