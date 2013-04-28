require "class"

local LK = love.keyboard

Warp = class()

function Warp:init()

	self.active = true
	self.cooldownTimer = 1
	self.cooldownDuration = 1;
	
	return self
end

function Warp:update(dt)

end

function Warp:checkInput()
	
	if LK.isDown("v") and self.cooldownTimer > 0 and self.active  then
		self:activate()
		self.cooldownTimer = -self.cooldownDuration
	end
	

end

function Warp:update(dt)

	self.cooldownTimer = self.cooldownTimer +dt

end

function Warp:activate()
	local rX = math.random(-200,200)
	local rY = math.random(-200,200)
	
	gPlayer.x = gPlayer.x + rX
	gPlayer.y = gPlayer.y + rY
end
