require 'bike'

describe Bike do

  it "bike responds to 'working?'" do

    # define a variable for bike and fill with release_bike
    expect(subject).to respond_to(:working?)

  end

  it "working? returns a boolean" do

    # check that 'working?' returns a boolean
    expect([true, false].include? subject.working?).to eq(true)

  end

  it "should be able to be reported as broken" do
    expect(subject.report_broken).to eq(subject.broken)
  end

end
