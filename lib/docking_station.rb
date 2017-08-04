
class DockingStation

  @bike

  # constants
  #@capacity
  $station_full = "Docking station is full"
  $no_bikes_available = "No bikes available"


  attr_reader :bikes, :capacity

  def initialize(cap = 20)
    @capacity = cap
    @bikes = []
  end

  def release_bike (count = 1)

    return_bikes = []

    raise $no_bikes_available if empty?

    @bikes.each_with_index do |bike, index|
     if bike.working? then
       @bikes.delete_at(index)
       return_bikes << bike

       if return_bikes.length == count then
         puts "#{return_bikes.length} bikes released"
         puts "#{@bikes.length} bikes left in the station."
         return (return_bikes.length == 1) ? return_bikes[0] : return_bikes
       end
     end
    end
    raise $no_bikes_available
  end

  def dock_bike (bike, broken = false)

    bike.report_broken if broken

    if !full? then (@bikes << bike) && ("#{bike} has been docked")
    else raise $station_full end
  end

  def show_bikes
    puts "This station currently has #{bikes.length} bikes."
    @bikes
  end

  def stock_bikes(number = @capacity)
    number = number.clamp(0, (@capacity - @bikes.length))
    1.upto(number) {@bikes << Bike.new}
    "#{number} more bikes now stocked in this station!"
  end

  private
  def full?
    return @bikes.length == @capacity
  end

  def empty?
    return @bikes.length == 0
  end
  end
