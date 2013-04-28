require "class"

local LK = love.keyboard

FiringSystem = class()

function FiringSystem:init()

	self.active = true
	
	self.cooldownTimer = 1
	self.cooldownDuration = 0.5;

	return self
end

function FiringSystem:checkInput()
	
	if LK.isDown(" ") and self.cooldownTimer > 0 and self.active  then
		gSpace:spawnPlayerBullet()
		self.cooldownTimer = -self.cooldownDuration
	end
	

end

function FiringSystem:update(dt)

self.cooldownTimer = self.cooldownTimer +dt

end

function FiringSystem:drawHUD()

end