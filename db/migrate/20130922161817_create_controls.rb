class CreateControls < ActiveRecord::Migration
  def up
    create_table :controls do |t|
      t.string :code, :limit => 20
      t.string :name, :null => false
      t.text :description
      t.integer :grade_id
      t.text :result, :null => false
      t.text :recommendation
      t.references :section, :null => false
      t.integer :questions_count, :default => 0, :null => false
      t.timestamps
    end

    add_foreign_key(:controls, :sections)
  end

  def down
    drop_table :controls
  end
end
