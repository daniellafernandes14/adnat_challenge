class Shift < ApplicationRecord
  has_many :users, through: :organisations
  belongs_to :organisation, dependent: :destroy
end
