class API::V1::RostersController < ApplicationController
  include Pagy::Backend
#  before_action :authenticate_user!

  def index
#    @pagy, @rosters = pagy(Roster.includes(:employee).where(customer: params[:cna_id]).all)
#    @pagy, @rosters = pagy(Roster.includes(:employee).where(customer: params[:cna_id]).all)
#     @pagy, @rosters = pagy(Roster.includes(:employee))

    @rosters = Roster.select('long_id, customer, company_id, start_date, end_date').limit(1000)

#    render :json => @rosters, :include => :employee, :status => :ok
    render :json => @rosters
  end

  def show
    
    show_these = 'long_id, customer, company_id, start_date, end_date'
#    json_response("@cna")
    if params[:start_date].present? && params[:end_date].present?
     
#      where_clause = "where({'start_date >= ?'}, params[:start_date]).limit(1000)"
#      @rosters = Roster.select(show_these).where('start_date >= ?',  params[:start_date]).where('start_date <= ?',  params[:end_date])
      @rosters = Roster.select(show_these).where(start_date: (params[:start_date] .. params[:end_date]))
      json_response(@rosters)
    elsif params[:start_date].present?
      puts "inside of #{__FILE__} + #{params} "
      @rosters = Roster.select(show_these).where("Date(start_date) = ?", params[:start_date])
      json_response(@rosters)
    else
    # just have one date
      @roster = Roster.select(show_these).where('long_id = ?',  params[:id])
      json_response(@roster)
    end  
  end

  def showx
    @cna = Cna.where(code: params[:id]).first
    json_response(@cna)
  end


end
