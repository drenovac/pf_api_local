class Cna < ApplicationRecord
  has_many :rosters, foreign_key: "customer", primary_key: "code"
  belongs_to :company
end
