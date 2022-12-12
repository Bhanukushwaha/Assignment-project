class Company < ApplicationRecord
	belongs_to :country
	belongs_to :state
	belongs_to :city
	has_many :places
	has_many :user
end
