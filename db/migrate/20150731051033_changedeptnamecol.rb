class Changedeptnamecol < ActiveRecord::Migration
  def change
  	change_column(:depts, :dept_name, :string, null: true)
  end
end
