class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :category
      t.string :gender
      t.boolean :neutered
      t.integer :price
      t.text :description
      t.integer :age
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
