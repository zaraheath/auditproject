class AddAncestryToControls < ActiveRecord::Migration
  def up
    add_column :controls, :ancestry, :string
    add_index :controls, :ancestry
  end

  def down
    remove_index :controls, :ancestry
    remove_column :controls, :ancestry
  end
end
