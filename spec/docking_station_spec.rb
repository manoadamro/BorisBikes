require 'docking_station'

describe DockingStation do

  it "docking station should not be nil" do
    # check that DockingStation can be initialized properly,
    # by checking it is not nil
	  expect(subject).not_to eq(nil)
  end

  it "docking station responds to 'release_bike'" do
    # check that DockingStation.release_bike returns an object
    expect(subject).to respond_to(:release_bike)
  end

  it "release_bike should return a bike object" do
    subject.dock_bike(Bike.new)
    # check that DockingStation.release_bike returns an object
    expect(subject.release_bike.class).to eq(Bike)
  end

  it "dock bike increases array by exactly 1" do
    count = subject.bikes.length
    subject.dock_bike (Bike.new)

    # ensure that array is exactly 1 item longer
    expect(subject.bikes.length).to eq(count + 1)
  end

  it "ensure added instance is the same" do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bikes.include? bike).to eq(true)
  end

  it "shows docked bikes at station" do
    expect(subject.show_bikes).to eq(subject.bikes)
  end

  it "shouldn't release a bike if none are available" do
    expect{subject.release_bike}.to raise_error("No bikes available")
  end
end
