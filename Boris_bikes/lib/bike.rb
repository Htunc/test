class Bike

attr_accessor :docked

def initialize
	@docked = false
	@working = true
end

def working?
 @working
end

def docked?
@docked
end

def report_broken
	@working = false
end
end
