require "class"

PlayerBullet = class()

function PlayerBullet:init(vx,vy)
	
	self.x = 0
	self.y = 0
	self.rot = 0

	self.vx = vx
	self.vy = vy

	return self
end

function PlayerBullet:draw()

	local img = images["bullet"]
	love.graphics.draw(img, self.x, self.y, self.rot, 1, 1, img:getWidth()/2, img:getHeight()/2)

end

function PlayerBullet:update(dt)

	self.x = self.x + self.vx * dt
	self.y = self.y + self.vy * dt

end