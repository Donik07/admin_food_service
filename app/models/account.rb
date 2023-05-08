class Account < ApplicationRecord
  has_many :orders
  has_many :points
end
