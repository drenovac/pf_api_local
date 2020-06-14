class Employee < ApplicationRecord
  has_many :rosters, foreign_key: "employee_code", primary_key: "employee_code"
  belongs_to :client, foreign_key: "employ_company", primary_key: "client_code"
  belongs_to :company
end
