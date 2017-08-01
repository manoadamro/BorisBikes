require 'docking_station'


describe DockingStation do

  it "docking station should not be nil" do

    # define a variable for docking station
    docking_station = DockingStation.new

    # check that DockingStation can be initialized properly,
    # by checking it is not nil
	  expect(docking_station).not_to eq(nil)
  end

  it "release_bike should not return nil" do

    # define a variable for bike and fill with release_bike
    bike =  DockingStation.new.release_bike

    # check that DockingStation.release_bike returns an object
    expect(bike).not_to eq(nil)

  end

  it "release_bike should return a bike object" do

    # define a variable for bike and fill with release_bike
    bike =  DockingStation.new.release_bike

    # check that DockingStation.release_bike returns an object
    expect(bike.class).to eq(Bike)

  end

end
