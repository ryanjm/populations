class Analytics
  def initialize(areas)
    @areas = areas
  end

  def how_many
    puts "There are #{@areas.length} areas"
  end
end
