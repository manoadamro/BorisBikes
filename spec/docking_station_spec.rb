require 'docking_station'


describe DockingStation do
  it "docking station should not be nil" do

    # define a variable with type DockingStation
    docking_station = DockingStation.new

    # check that DockingStation can be initialized properly,
    # by checking it is not nil
	  expect(docking_station).not_to eq(nil)
  end
end
