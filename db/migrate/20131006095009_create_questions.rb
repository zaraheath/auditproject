class CreateQuestions < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.references :control
      t.string :name
      t.string :description
      t.integer :answer_id
      t.timestamps
    end
    add_foreign_key :questions, :controls
  end

  def down
    drop_table :questions
  end
end
