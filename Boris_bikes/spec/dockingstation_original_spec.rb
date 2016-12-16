require 'dockingstation'
require 'bike'

describe Dockingstation do

it "has a default capacity" do
expect(subject.capacity).to eq(Dockingstation::DEFAULT_CAPACITY)
end

it "can set a capacity" do 
newcapacity = Dockingstation.new(capacity=1)
newcapacity.dock(Bike.new)
expect{newcapacity.dock(Bike.new)}.to raise_error
end

it "respond_to release" do
	expect(subject).to respond_to(:release)
end

it "release a bike" do
	subject.dock(Bike.new)
	bike  = subject.release
	expect(bike).to be_working
end

it "docks a bike" do
	bike = Bike.new
	subject.dock(bike) 
	expect(bike).to be_docked
end

it "raise error if station is empty" do
	expect{subject.release}.to raise_error
end

it "raise error if we dock more bikes then the capacity" do
	Dockingstation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
	expect{subject.dock(Bike.new)}.to raise_error
	end
it "doesn't release a broken bike" do
bike = Bike.new
subject.dock(bike)
bike.report_broken
expect{subject.release}.to raise_error
end
end
