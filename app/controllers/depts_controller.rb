class DeptsController < ApplicationController
layout "testinglayoutuse"

  def index
    @depts = Dept.sorted
  end

  def show
    @dept = Dept.find(params[:id])
  end

  def new
    @dept = Dept.new
  end

  def create
    @dept = Dept.new(dept_permit_params)

    if @dept.save
      flash[:notice] = "Department Added Successfully"
      redirect_to(action: 'create')
    else
      render('new')
    end  
  end

  def edit
    @dept = Dept.find(params[:id])
  end
 
  def update
    @dept = Dept.find(params[:id])
    @dept.update_attributes(dept_permit_params)

    if @dept.save
      flash[:notice] = "Department Updated Successfully"
      redirect_to({action: 'show', id: @dept.id})
    else
      render('edit')
    end  
  end

  def delete
  end

  def destroy
    @dept = Dept.find(params[:id])
     if @dept.destroy 
      flash[:notice] = "Department #{@dept.dept_name} destroyed Successfully"
      redirect_to({action: 'index'})
     end 
  end

  private

  def dept_permit_params
    params.require(:dept).permit(:dept_name, :dept_descr, :position, :visible)
  end 
end
