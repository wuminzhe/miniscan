class Block < ApplicationRecord
  has_many :events
  has_many :logs
end
