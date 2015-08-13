class Employee < ActiveRecord::Base
	belongs_to :depts

	scope :sorted, lambda {order("employees.id ASC")}
end
