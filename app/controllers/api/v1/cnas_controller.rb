class API::V1::CnasController < ApplicationController
  include Pagy::Backend
#  before_action :authenticate_user!

  def index
    @pagy, @cnas = pagy(Cna.order('code ASC'))
    json_response(@cnas)
  end

  def show
#   @cna = Cna.where(code: params[:id]).first
    @cna = Cna.select('code, name, company_id, address, suburb,state,pcode').where({ code: params[:id]}).first    
    json_response(@cna)
  end
end
