class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
      t.string :name
      t.text :description
      t.references :audit
      t.timestamps
    end

    add_foreign_key(:sections, :audits)
  end

  def down
    drop_table :sections
  end
end
