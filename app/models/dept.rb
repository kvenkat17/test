class Dept < ActiveRecord::Base
	has_many :employees

	scope :sorted, lambda {order("depts.position ASC")}

	#validates :dept_name, presence: true
end
