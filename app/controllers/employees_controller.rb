class EmployeesController < ApplicationController
layout "testinglayoutuse" 

  def index
    @employees = Employee.sorted # sorted is a scope scope :name , lambda ({hash})
  end

  def show
    @employee = Employee.find(params[:id]) # finder method using a variable of the URL
  end

  def new
    @employee = Employee.new # this will make to pick any default values
  end 

  def create 
    @employee =Employee.new(employee_param_values) 
    if @employee.save
      flash[:notice] = "Employee created successfully"
      redirect_to({action: 'index'})
    else
      render('new');
    end 
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update_attributes(employee_param_values) 
    if @employee.save
      flash[:notice] = "Employee updated successfully"
      redirect_to({action: 'show', id: @employee.id})
    else
      render('edit');
    end 
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    flash[:notice] = "Employee #{@employee.emp_name} destroyed successfully"
    redirect_to({action: 'index'})
  end

  private

  def employee_param_values
    params.require(:employee).permit(:emp_name, :address, :city,:state, :age, :sex, :visible)
  end
end
