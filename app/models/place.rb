class Place < ApplicationRecord
	belongs_to :company
	has_many :nodes
	validates :name, presence: true
end
