class Client < ApplicationRecord
  has_many :employees, foreign_key: "employ_company", primary_key: "client_code"
  belongs_to :company
  validates :client_code, uniqueness: { scope: :company_id }
end
