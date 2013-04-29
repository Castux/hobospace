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
	self.maxValues = {
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
	

    txt = txt.."[1] stabilizer".." energy "..self.energySystems.stabilizer.."/"..self.maxValues.stabilizer.."\n\n"
	txt = txt.."[2] control".." energy "..self.energySystems.control.."/"..self.maxValues.control.."\n\n"
	txt = txt.."[3] weapon".." energy "..self.energySystems.weapon.."/"..self.maxValues.weapon.."\n\n"
	txt = txt.."[4] shield".." energy "..self.energySystems.shield.."/"..self.maxValues.shield.."\n\n"
	txt = txt.."[5] warp".." energy "..self.energySystems.warp.."/"..self.maxValues.warp.."\n\n"
	txt = txt.."[6] audio".." energy "..self.energySystems.audio.."/"..self.maxValues.audio.."\n\n"
	txt = txt.."[7] visual".." energy "..self.energySystems.visual.."/"..self.maxValues.visual.."\n\n"

		
	love.graphics.print(txt, 20,60)
end

function EnergyDistribution:keypressed(k)
	local keys = {['1']='stabilizer',['2']='control',['3']='weapon',['4']='shield',['5']='warp',['6']='audio',['7']='visual'}
	
	if(keys[k]) then
	
	local systemMaxValue = self.maxValues[keys[k]]
	
	if(self.freeEnergy >= 10 and self.energySystems[keys[k]] < systemMaxValue) then
		self.energySystems[keys[k]] = self.energySystems[keys[k]] + 10
		self.freeEnergy = self.freeEnergy -10
	elseif(self.energySystems[keys[k]] == systemMaxValue ) then
		
		self.freeEnergy = self.freeEnergy + systemMaxValue
		self.energySystems[keys[k]] = 0
	end
	
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