class Employee < ApplicationRecord
    has_many :duties, dependent: :destroy
    validates :name, presence: true
end
