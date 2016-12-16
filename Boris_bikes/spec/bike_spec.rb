require 'bike'

describe Bike do

it "respond_to works" do
	expect(subject).to respond_to(:working?)
end

it "respond_to dock" do
	expect(subject).to respond_to(:docked?)
end

it "checks the status of the bike" do
	expect(subject).to be_working
end

it "reports a broken bike" do
	expect(subject).to respond_to(:report_broken)
end

it "breaks the bike" do
	subject.report_broken
	expect(subject).to_not be_working
end

end