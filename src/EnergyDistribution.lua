require "class"

local LK = love.keyboard

EnergyDistribution = class()

function EnergyDistribution:init()

	self.totalEnergy = 100
	self.freeEnergy = 0
	self.active = true
	self.energySystems = {
		stabilizer = 20,
		control = 20,
		weapon = 10,
		shield = 10,
		warp = 10,
		audio = 10,
		visual = 20
	}
	
	gEnergyDistribution = self
	
	return self
end

function EnergyDistribution:update(dt)

end

function EnergyDistribution:drawHUD()

	love.graphics.print("Total energy available: " .. self.totalEnergy, 20,10)
	love.graphics.print("Free energy available: " .. self.freeEnergy, 20,25)
	local txt = ''
	
		for k,v in pairs(self.energySystems) do
			txt = txt..k.." energy "..v.."\n\n"
		end 
		
	love.graphics.print(txt, 20,60)
end

function EnergyDistribution:keypressed(k)
	local systemKey = ''

	if(k == '1') then
		systemKey = stabilizer
	end
end

function EnergyDistribution:decreaseEnergy()
	self.totalEnergy = self.totalEnergy -10
	local activeSystems = {}
		for k,v in pairs(self.energySystems) do
			if(v > 0) then
				table.insert(activeSystems,k)
			end
		end 
	if(#activeSystems > 0) then	
		local systemKey = activeSystems[math.random(#activeSystems)]
		
		self.energySystems[systemKey] = self.energySystems[systemKey]-10
	end
end