class Event < ApplicationRecord
  belongs_to :user 
  has_many :attendances
  has_many :users, througth: :attendances
  

  validates :duration, presence: true
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, inclusion: { in: 1..1000 }
  validates :location, presence: true
end


