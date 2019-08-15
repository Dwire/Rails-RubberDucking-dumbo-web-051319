class Student < ApplicationRecord
  has_many :ducks

  validates :name, presence: true
  # validates :mod, numericality: {minimum: 1, maximum: 5}
  validates :mod, inclusion: 1..5
end
