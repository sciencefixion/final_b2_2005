class Flight <ApplicationRecord
  belongs_to :airline
  has_many   :flight_passengers
  has_many   :passengers, through: :flight_passengers

  validates_presence_of :number,
                        :date,
                        :time,
                        :departure_city,
                        :arrival_city

  def adults
    binding.pry
    passengers.where("age >= 18")
    Flight.joins(:passengers).group(:id).where('age >= 18')
    # Flight.where("number = :number", number: params[:flight_number])
  end

  def minors

  end
end
