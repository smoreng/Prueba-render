class Client < ApplicationRecord
  has_many :calls, dependent: :destroy
end
