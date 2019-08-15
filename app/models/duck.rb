class Duck < ApplicationRecord
  belongs_to :student

  validates :name, presence: true
  validates :student, presence: true
end
