class Company < ApplicationRecord

  has_many :users
  has_many :clients
  has_many :cnas
  has_many :employees
  has_many :rosters

end
