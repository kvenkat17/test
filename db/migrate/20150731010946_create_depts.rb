class CreateDepts < ActiveRecord::Migration
  def change
    create_table :depts do |t|
      t.string "dept_name", null: false
      t.string "dept_descr"
      t.integer "position"
      t.boolean "visible", default: false
      t.timestamps
    end
  end
end
