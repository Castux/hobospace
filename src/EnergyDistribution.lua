require "class"

local LK = love.keyboard

EnergyDistribution = class()

function EnergyDistribution:init()

	self.totalEnergy = 10
	self.active = true

	return self
end

function EnergyDistribution:update(dt)

end

function EnergyDistribution:drawHUD()

	love.graphics.print("Total Energy available: " .. self.totalEnergy, 20,690)

end

function EnergyDistribution:keypressed(k)


end

function EnergyDistribution:decreaseEnergy()
	self.totalEnergy = self.totalEnergy -1
end