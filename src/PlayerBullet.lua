require "class"

PlayerBullet = class()

function PlayerBullet:init()
	
	self.x = gPlayer.x
	self.y = gPlayer.y
	self.rot = 0
	self.speed = 1000
	
	local vx,vy = math.cos(gPlayer.rot) * self.speed, math.sin(gPlayer.rot) * self.speed
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
	
	for i,v in ipairs(gSpace.asteroids) do
		local dist = distanceObjects(self,v)
		
		if(dist < 32) then
			gSpace:removeAsteroid(i)
		end
	end

end