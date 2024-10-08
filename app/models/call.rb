class Call < ApplicationRecord
  belongs_to :client
  belongs_to :reason
  
  validates :reason, presence: true
  validates :date, presence: true
end
