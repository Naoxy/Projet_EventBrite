class Event < ApplicationRecord
  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances
  

  validates :duration, presence: true 
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, inclusion: { in: 1..1000 }
  validates :location, presence: true
  validate :duration_valid?
  validate :past?


  private

  def duration_valid?
    if duration.positive? && (duration % 5).zero?
      errors.add(:duration, 'la durée doit etre positive et incrémentée de 5 en 5')
    end
  end

  def past?
    return false if start_date.nil?
  if start_date > Time.zone.now
    errors.add(:start_date, 'la date ne doit pas etre dans le passé')
  end
end

end


