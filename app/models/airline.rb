class Airline <ApplicationRecord
  has_many :flights, dependent: :destroy

  validates_presence_of :name
end
