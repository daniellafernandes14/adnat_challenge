class Shift < ApplicationRecord
  belongs_to :user
  belongs_to :organisation, optional: true
  validates :start, :finish, :break_length, presence: true
end
