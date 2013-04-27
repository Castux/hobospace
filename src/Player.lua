require "class"

local LK = love.keyboard

Player = class()

function Player:init()

	self.x = 0
	self.y = 0
	self.rot = 0

	self.speed = 600

	return self
end

function Player:update(dt)

	self:treatInput(dt)

end

function Player:draw()

	local img = images["ship"]
	love.graphics.draw(img, self.x, self.y, self.rot, 1, 1, img:getWidth()/2, img:getHeight()/2)

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

	-- apply speed

	self.x = self.x + self.speed * dx * dt
	self.y = self.y + self.speed * dy * dt

	-- rotate

	if not(dx == 0 and dy == 0) then
		self.rot = math.atan2(dy,dx) + math.pi / 2
	end
end