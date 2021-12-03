class Shift < ApplicationRecord
  belongs_to :user
  belongs_to :organisation, dependent: :destroy
end
