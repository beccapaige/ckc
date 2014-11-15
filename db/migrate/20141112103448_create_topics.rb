class CreateTopics < ActiveRecord::Migration
  def change
     create_table :topics do |t|
      t.string :title
      t.text :content

      t.references :author
      t.references :forum

      t.timestamps
    end
  end
end
