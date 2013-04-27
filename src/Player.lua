require "class"

local LK = love.keyboard

Player = class()

function Player:init()

	self.x = 0					-- pixels (world coordinates)
	self.y = 0
	self.rot = 0				-- radians

	self.targetRot = 0
	self.rotSpeed = math.pi		-- radians per second

	self.speed = 0
	self.maxSpeed = 60			-- pixels per second
	self.accel = 40				-- pixels/s^2

	return self
end

function Player:update(dt)

	self:treatInput(dt)

end

function Player:draw()

	local img = images["ship"]
	love.graphics.draw(img, self.x, self.y, self.rot + math.pi/2, 1, 1, img:getWidth()/2, img:getHeight()/2)

end

function Player:treatInput(dt)

	local dx = 0
	local dy = 0

	if LK.isDown("a") or LK.isDown("left") then
		dx = dx - 1
	end

	if LK.isDown("d") or LK.isDown("right") then
		dx = dx + 1
	end

	if LK.isDown("w") or LK.isDown("up") then
		dy = dy - 1
	end

	if LK.isDown("s") or LK.isDown("down") then
		dy = dy + 1
	end


	if not(dx == 0 and dy == 0) then
	
		-- target direction

		self.targetRot = math.atan2(dy,dx)

		-- rotate

		local deltaRot = (self.targetRot - self.rot)
		deltaRot = (deltaRot + math.pi) % (math.pi * 2) - math.pi

		if math.abs(deltaRot) > 0.01 then
			local rotDir = deltaRot / math.abs(deltaRot)
			self.rot = self.rot + rotDir * self.rotSpeed * dt
		else
			self.rot = self.targetRot
		end

		-- accelerate

		self.speed = math.min(self.maxSpeed, self.speed + self.accel * dt)
	
	else

		-- decelerate

		self.speed = math.max(0, self.speed - self.accel * dt)

	end

	-- apply speed

	local vx,vy = math.cos(self.rot) * self.speed, math.sin(self.rot) * self.speed
	self.x = self.x + self.speed * vx * dt
	self.y = self.y + self.speed * vy * dt
	
end