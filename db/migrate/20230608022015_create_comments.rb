class CreateComments < ActiveRecord::Migration[7.0]
  def up
    create_table :comments do |t|
      t.text :body
      t.integer :rating
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
