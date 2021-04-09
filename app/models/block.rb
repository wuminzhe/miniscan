class Block < ApplicationRecord
  has_many :events
  has_many :logs
  has_many :extrinsics

  def self.track_block(block_number)
  end
end
