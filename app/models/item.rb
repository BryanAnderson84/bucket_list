class Item < ApplicationRecord
  belongs_to :bucketlist

  def info
    completed ? "YES" : "Nah"
  end
end
