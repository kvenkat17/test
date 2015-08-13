class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string "emp_name"
      t.string "address"
      t.string "city"
      t.string "state"
      t.integer "age"
      t.string "sex", limit: 1
      t.boolean "visible", default: false
      t.timestamps
    end
  end
end
