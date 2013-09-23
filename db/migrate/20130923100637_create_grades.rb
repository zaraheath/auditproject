class CreateGrades < ActiveRecord::Migration
  def up
    create_table :grades do |t|
      t.string :name
      t.text :description
      t.integer :value
      t.timestamps
    end

    rename_column :controls, :grade, :grade_id

    add_foreign_key(:controls, :grades)
  end

  def down
    remove_foreign_key(:controls, column: 'grade_id')
    rename_column :controls, :grade_id, :grade
    drop_table :grades
  end
end
