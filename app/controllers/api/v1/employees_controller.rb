class API::V1::EmployeesController < ApplicationController
  include Pagy::Backend
#  before_action :authenticate_user!
before_action :set_employee, only: [:show, :update, :destroy]
  
  def index
    if params[:client_id].present?
      @pagy, @employees = pagy(Employee.where(employ_company: params[:client_id]).order('employee_code ASC'))
    else
      @pagy, @employees = pagy(Employee.order('employee_code ASC'))
    end
    json_response(@employees)
  end

  def show
    puts "inside of #{__FILE__} + #{params} "

    if params[:id].present?
#      @employee = Employee.where(employ_company: params[:client_id]).where(employee_code: params[:id]).first
    else
#      @employee = Employee.where(employee_code: params[:id]).first
    end
    json_response(@employee)
  end


  def set_employee
    @employee = Employee.select('employee_code, id, company_id').where({ employee_code:  params[:id]})
  end
    
end
