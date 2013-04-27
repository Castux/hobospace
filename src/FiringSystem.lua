require "class"

local LK = love.keyboard

FiringSystem = class()

function FiringSystem:init()

	self.active = {
		active = true
	}

	return self
end

function FiringSystem:checkInput()

	local dx,dy = 0,0

	if LK.isDown(" ") then
		
	end

end

function FiringSystem:drawHUD()

	local txt = ""

	love.graphics.print("Controls system functional: " .. txt, 20, 20)

end