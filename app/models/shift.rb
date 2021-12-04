class Shift < ApplicationRecord
  belongs_to :user
  validates :start, :finish, :break_length, presence: true
end
