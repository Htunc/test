class Dockingstation
DEFAULT_CAPACITY = 20
attr_accessor :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@station = []
	end

	def release
		raise "station is empty" if empty_station
		i = @station.length - 1
		while !@station[i].working?
			raise "This bike is broken"
			i -= 1
		end
		@station[i].docked = false
		@station.slice!(i)
	end

	def dock(bike)
		raise "docking station is full" if full_station
		@station << bike
		bike.docked = true
	end

	def station
		@station
	end

	private

	def empty_station
		@station.empty?
	end

	def full_station
		@station.size >= @capacity	
	end



end