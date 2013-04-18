require_relative 'lib/setup'
require_relative 'lib/analytics'


class Population
  attr_accessor :analytics

  def initialize
    areas = Setup.new().areas
    @analytics = Analytics.new(areas)
  end

  def menu
    system 'clear'
    puts "Pupulation Menu"
    puts "1. Areas count"
    puts "2. Smallest Population (non 0)"
    puts "3. Largest Population"
    puts "4. How many zips in California"
    puts "5. Information for a given zip"
    puts "6. Exit"
  end

  def run
    stop = false

    while !stop do
      # run the menu
      self.menu
      # grab the choice
      print "Choice: "
      choice = gets.strip.to_i
      # run their choice
      stop = run_analytics(choice)
      if stop
        puts "Exiting"
      else
        print "\nHit enter to continue "
        gets
      end
    end
  end

  def run_analytics(choice)
    if choice == 1
      @analytics.how_many
    elsif choice == 2
      @analytics.smallest_pop
    elsif choice == 3
      @analytics.largest_pop
    elsif choice == 4
      @analytics.california_zips
    elsif choice == 5
      print "Which zip? "
      zip = gets.strip.to_i
      @analytics.zip_info(zip)
    else
      return true
    end
    false
  end
end

p = Population.new
p.run
