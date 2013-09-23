class CreateControls < ActiveRecord::Migration
  def up
    create_table :controls do |t|
      t.string :name, :null => false
      t.text :description
      t.integer :grade
      t.text :result, :null => false
      t.text :recommendation
      t.references :section
      t.timestamps
    end

    add_foreign_key(:controls, :sections)
  end

  def down
    drop_table :controls
  end
end
