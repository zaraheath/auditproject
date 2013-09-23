class CreateAudits < ActiveRecord::Migration
  def up
    create_table :audits do |t|
      t.string :name, :null => false
      t.string :client
      t.string :auditor_name
      t.references :user, :null => false
      t.date :start_date
      t.date :end_date
      t.date :delivery_date
      t.text :objective
      t.text :global_opinion
      t.text :global_recommendation
      t.string :signature
      t.timestamps
    end

    add_foreign_key :audits, :users
  end

  def down
    drop_table :audits
  end
end
