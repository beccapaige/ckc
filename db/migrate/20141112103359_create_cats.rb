class CreateCats < ActiveRecord::Migration
  def change
     create_table :cats do |t|
      t.string :name
      t.string :breed
      t.text :bio

      t.references :owner

      t.timestamps
    end
  end
end
