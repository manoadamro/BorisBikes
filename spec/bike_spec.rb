require 'bike'

describe Bike do

  it "bike responds to 'working?'" do

    # define a variable for bike and fill with release_bike
    ds = DockingStation.new
    ds.stock_bikes(1)
    bike = ds.release_bike

    # check that DockingStation.release_bike returns an object
    expect(bike).to respond_to(:working?)

  end

  it "working? returns a boolean" do

    # define a variable for bike and fill with release_bike
    ds = DockingStation.new
    ds.stock_bikes(1)
    bike = ds.release_bike

    # check that 'working?' returns a boolean
    expect([true, false].include? bike.working?).to eq(true)

  end

  it "should be able to be reported as broken" do
    expect(subject.report_broken).to eq(subject.broken)
  end

end
