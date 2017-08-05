require 'docking_station'

describe DockingStation do

  let(:bike) {double :bike}
  let(:broken_bike) {double :bike}

  it "docking station should not be nil" do

    # check that DockingStation can be initialized properly,
    # by checking it is not nil
	  expect(subject).not_to eq(nil)

  end

  it "docking station responds to 'release_bike'" do

    # check that DockingStation.release_bike returns an object
    expect(subject).to respond_to(:release_bike)

  end


  it "release bike returns a Bike instance" do

    subject.stock_bikes
    expect(subject.release_bike(1).class).to eq(Bike)

  end

  it "release bike returns an array" do

    subject.stock_bikes
    expect(subject.release_bike(2).class).to eq(Array)

  end

  it "release bike returns an array of bike objects" do

    subject.stock_bikes
    expect(subject.release_bike(2)[0].class).to eq(Bike)

  end

  it "dock bike increases array by exactly 1" do

    allow(bike).to receive_messages(
      :class => Bike
    )

    count = subject.bikes.length
    subject.dock_bike (bike)

    # ensure that array is exactly 1 item longer
    expect(subject.bikes.length).to eq(count + 1)

  end

  it "ensure added instance is the same" do

    allow(bike).to receive_messages(
      :class => Bike
    )

    subject.dock_bike(bike)
    expect(subject.bikes.include? bike).to eq(true)

  end

  it "responds to 'dock_bike'" do

    # check that DockingStation.release_bike returns an object
    expect(subject).to respond_to(:dock_bike)

  end

  it "only accepts bike objects" do

    allow(bike).to receive_messages(
      :report_broken => nil,
      :working? => false,
    )
    # check that DockingStation.release_bike returns an object
    expect{subject.dock_bike "Something"}.to raise_error $not_a_bike

  end

  it "shows docked bikes at station" do

    expect(subject.show_bikes).to eq(subject.bikes)

  end

  it "shouldn't release a bike if none are available" do

    expect{subject.release_bike}.to raise_error($no_bikes_available)

  end

  it "shouldn't add bike when docking station is full" do

    allow(bike).to receive_messages(
      :class => Bike
    )

    subject.stock_bikes(subject.capacity)
    expect{ subject.dock_bike(bike) }.to raise_error($station_full)

  end

  it "should have capacity of 20 by default" do

    expect(subject.capacity).to eq(20)

  end

  it "can set a custom capacity" do

    station = DockingStation.new(100)
    expect(station.capacity).to eq(100)

  end

  it "can report bike as broken when returning" do

    allow(bike).to receive_messages(
      :report_broken => nil,
      :working? => false,
      :class => Bike
    )

    subject.dock_bike(bike, broken = true)
    expect(bike.working?).to eq(false)
  end

  it "does not release a broken bike" do

    allow(bike).to receive_messages(
      :report_broken => nil,
      :working? => false,
      :class => Bike
    )

    (broken_bike = bike).report_broken
    subject.dock_bike(broken_bike)
    expect{ subject.release_bike }.to raise_error($no_bikes_available)
  end

  it "accepts broken bikes" do

    allow(bike).to receive_messages(
      :report_broken => nil,
      :working? => false,
      :class => Bike
    )

    (broken_bike = bike).report_broken
    subject.dock_bike(broken_bike)
    expect(subject.bikes.include? broken_bike).to eq(true)
  end
end
