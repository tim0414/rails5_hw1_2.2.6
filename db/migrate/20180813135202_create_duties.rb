class CreateDuties < ActiveRecord::Migration[5.2]
  def change
    create_table :duties do |t|
      t.text :description
      t.references :employee, foreign_key: true

      t.timestamps
    end
    add_index :duties, [:employee_id, :create_at]
  end
end
