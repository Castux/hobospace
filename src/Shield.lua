require "class"

Shield = class()

function Shield:init()

	self.active = false
	self.activationTimer = nil

	self.duration = 1

	self.coolingDown = false
	self.cooldownTimer = nil

	self.cooldownDuration = 0.5

	return self
end

function Shield:update(dt)

	if self.active then
		self.activationTimer = self.activationTimer - dt

		if self.activationTimer <= 0 then
			self:deactivate()
		end
	end

	if self.coolingDown then
		self.cooldownTimer = self.cooldownTimer - dt

		if self.cooldownTimer <= 0 then
			self.coolingDown = false
			self.cooldownTimer = nil
		end
	end
end

function Shield:draw()

	if self.active then
		local img = images['shield']
		love.graphics.draw(img, 0, 0, 0, 1, 1, img:getWidth()/2, img:getHeight()/2)
	end

end

function Shield:activate()

	if not self.active and not self.coolingDown then
		self.active = true
		self.activationTimer = self.duration
	end
end

function Shield:deactivate()

	self.active = false
	self.activationTimer = nil

	self.coolingDown = true
	self.cooldownTimer = self.cooldownDuration

end

function Shield:keypressed(k)

	if k == ' ' then
		self:activate()
	end

end