require_relative 'csv_reader'
require_relative 'area'

class Setup
  attr_accessor :areas

  def initialize(show = false)
    csv = CSVReader.new("./zipcode-db.csv")
    
    @areas = []

    every_few = 0

    csv.read do |item|
      @areas << Area.new(item)
      every_few += 1
      if show && (every_few % 3000) == 0
        puts "Saving area #{every_few}"
      end
    end

    self
  end

end
