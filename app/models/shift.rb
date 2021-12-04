class Shift < ApplicationRecord
  has_many :users
  validates :start, :finish, :break_length, presence: true
end
