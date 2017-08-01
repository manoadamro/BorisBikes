require 'docking_station'


describe DockingStation do
  it "docking station should not be nil" do

    # check that DockingStation can be initialized properly,
    # by checking it is not nil
	  expect(DockingStation.new).not_to eq(nil)

  end
end
