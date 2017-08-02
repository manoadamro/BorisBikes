
class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    @bikes.each_with_index do |bike, index|
     if bike.working? then
       @bikes.delete_at(index)
       return bike
     end
    end
    raise "No bikes available"
  end

  def dock_bike (bike)
    @bikes << bike
  end

  def show_bikes
    @bikes
  end

  def stock_bikes(number)
    1.upto(number) {@bikes << Bike.new}
  end
end
