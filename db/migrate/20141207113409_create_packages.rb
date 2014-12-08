class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.string :authors
      t.string :maintainers
      t.text :versions
      t.datetime :publication
      t.string :title
      t.text :description
      t.timestamps
    end
    add_index :packages, :name
  end
end
