require "class"
require "Player"
require "Asteroid"

Space = class()

function Space:init()
	
	-- camera: which world coordinates should end up in the center of the screen?

	self.cameraX = 0
	self.cameraY = 0

	self.player = Player()

	self.asteroids = {}

	for i = 1,100 do
		table.insert(self.asteroids, Asteroid())
	end

	return self
end

function Space:draw()

	love.graphics.push()
	love.graphics.translate(-self.cameraX + love.graphics.getWidth() / 2, -self.cameraY + love.graphics.getHeight() / 2)

	self:drawBackground()

	for i,v in ipairs(self.asteroids) do
		v:draw()
	end
	self.player:draw()

	love.graphics.pop()

	self.player:drawHUD()
end

function Space:drawBackground()

	-- we assume that the background image is bigger than the window

	local img = images["bg"]
	local bgW,bgH = img:getWidth(), img:getHeight()

	local baseX, baseY = math.floor(self.cameraX / bgW), math.floor(self.cameraY / bgH)

	local shiftX = self.cameraX % bgW < bgW/2 and -1 or 1
	local shiftY = self.cameraY % bgH < bgH/2 and -1 or 1
	
	love.graphics.draw(img, baseX * bgW, baseY * bgH)
	love.graphics.draw(img, (baseX + shiftX) * bgW, baseY * bgH)
	love.graphics.draw(img, baseX * bgW, (baseY + shiftY) * bgH)
	love.graphics.draw(img, (baseX + shiftX) * bgW, (baseY + shiftY) * bgH)

end

function Space:update(dt)

	for i,v in ipairs(self.asteroids) do
		v:update(dt)
	end

	self.player:update(dt)

	self.cameraX = self.player.x
	self.cameraY = self.player.y

end

function Space:keypressed(k)

	-- register here all objects who are interested in keypresses

	self.player:keypressed(k)

end
