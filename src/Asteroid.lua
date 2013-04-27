require "class"

Asteroid = class()

function Asteroid:init()
	
	self.x = 0
	self.y = 0
	self.rot = 0

	self.vx = (math.random() - 0.5) * 100
	self.vy = (math.random() - 0.5) * 100
	self.vrot = (math.random() - 0.5) * math.pi * 2

	return self
end

function Asteroid:draw()

	local img = images["asteroid"]
	love.graphics.draw(img, self.x, self.y, self.rot, 1, 1, img:getWidth()/2, img:getHeight()/2)

end

function Asteroid:update(dt)

	self.x = self.x + self.vx * dt
	self.y = self.y + self.vy * dt
	self.rot = self.rot + self.vrot * dt

end