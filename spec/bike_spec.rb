require 'docking_station'
require 'bike'


describe Bike do

  it "bike responds to 'working?'" do

    # define a variable for bike and fill with release_bike
    bike =  DockingStation.new.release_bike

    # check that DockingStation.release_bike returns an object
    expect(bike).to respond_to(:working?)

  end

  it "working? returns a boolean" do

    # define a variable for bike and fill with release_bike
    bike =  DockingStation.new.release_bike

    # check that 'working?' returns a boolean
    expect([true, false].include? bike.working?).to eq(true)

  end

end
