class API::V1::ClientsController < ApplicationController
  include Pagy::Backend
#  before_action :authenticate_user!
  before_action :set_client, only: [:show, :update, :destroy]

  def index
    @pagy, @clients = pagy(Client.order('client_code ASC'))
    if params[:short_mode].present? && params[:short_mode] == '1'

    else
      json_response(@clients)
    end
  end

  def show
    if params[:short_mode].present? && params[:short_mode] == '1'

    else
       json_response(@client)  
    end
  end

  def create
    @client = Client.create!(client_params)
    json_response(@client, :created)
  end

  def update
    @client.update(client_params)
    head :no_content
  end

  def destroy
    @client.destroy
    head :no_content
  end

  private

  def set_client
#   @client = Client.where(client_code: params[:id]).first
    @client = Client.select('client_code, id, company_id').where({ client_code: params[:id]}).first
#   @client = Client.where(:all, :select => "client_code, id", :conditions => { client_code: params[:id]} ).first
  end

  def client_params
    params.permit(
      :company_id,
      :client_code,
      :charge_code,
      :coy_debtor,
      :credit_terms,
      :client_type,
      :contract_no,
      :reference_no,
      :contract_date,
      :contract_completion,
      :contract_value,
      :billing_cycle,
      :contract_narration,
      :client_activated,
      :client_inactive,
      :cas_bill_cycle,
      :cas_consolidate,
      :cas_narration,
      :cas_fee_schedule,
      :std_start_time,
      :std_finish_time,
      :last_cycle,
      :cont_contract,
      :cont_repet_amt,
      :publichol,
      :cascode_rate1,
      :account_contact,
      :cascode_rate3,
      :cascode_rate4,
      :casrate1_oride,
      :casrate2_oride,
      :casrate3_oride,
      :casrate4_oride,
      :category,
      :cas_cat,
      :mon_svce_code,
      :mon_svce_rate,
      :monitoring,
      :generic_name,
      :last_gendate,
      :client_class,
      :normal_day,
      :hours_pperiod,
      :repet_charge_ac,
      :repet_service_desc,
      :cas1_charge_to,
      :case2_charge_to,
      :cas3_charge_to,
      :cas4_charge_to,
      :monitoring_charge_to,
      :monitor_service_desc,
      :cas_category_description,
      :cost_method,
      :cost_rate,
      :std_hours_schedule,
      :client_category,
      :inv_jnl,
      :division,
      :department,
      :institution,
      :speciality,
      :beds,
      :occupancy,
      :contract_ref,
      :lab_attch_flag,
      :clab_attch_flag,
      :discount_code,
      :monitoring_class,
      :monitoring_company,
      :perm_payclass,
      :cas_payclass,
      :whcchge,
      :salesman,
      :debtor_clerk,
      :std_phol_schedule,
      :apply_stdhours,
      :rebate_ctrl,
      :rebate_cat,
      :rebate_code,
      :dflt_car,
      :charge_type,
      :minimum_hours,
      :fix_rate,
      :fixed_rate_period,
      :suppress_messages,
      :debtors_ledger,
      :cost_centre,
      :perm_grade,
      :cas_grade,
      :oncharge_ot,
      :time_scheduling,
      :review_date,
      :shift_names,
      :inactive,
      :area_bldg,
      :service_levels,
      :casual_service_desc,
      :region,
      :cas_cost_rate,
      :casinv_detail_lvl,
      :scheduling_seq,
      :response_inv_flag,
      :invoice_statement_flag,
      :invoice_ordno_split,
      :print_cust_bill_instructions,
      :print_response_on_invoice,
      :show_rate_type,
      :default_cost_centre,
      :response_time,
      :dflt_bud_emptype,
      :send_invoice_by,
      :email_address,
      :brief_required,
      :invoice_format,
      :addendum_format,
      :summ_rpt_option,
      :summ_rpt_narrative,
      :attach_files,
      :attach_comments,
      :seasonality_group,
      :role_rate_mapping,
      :vendor_cost_code,
      :apply_award_schedule,
      :roletype_split,
      :do_not_invoice,
      :store_no,
      :include_acn_invoice,
      :care_plans
    )
  end
end
