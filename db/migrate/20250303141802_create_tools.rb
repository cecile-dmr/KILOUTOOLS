class CreateTools < ActiveRecord::Migration[7.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :localisation
      t.string :photo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
