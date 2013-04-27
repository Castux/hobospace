require "class"

local LK = love.keyboard

Controls = class()

function Controls:init()

	self.active = {
		stabilizer = true
	}

	for i = 0,7 do
		self.active[i] = true
	end

	return self
end

function Controls:checkInput()

	local dx,dy = 0,0

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

	if dx == 0 and dy == 0 then
		return nil
	end

	local dir = math.atan2(dy,dx)
	local index = (dir / (2 * math.pi / 8)) % 8

	if self.active[index] then
		return dir
	else
		return nil
	end
end

function Controls:disableRandom()

	local sel = {}
	for k,v in pairs(self.active) do
		table.insert(sel,k)
	end

	if #sel > 0 then
		local res = sel[math.random(#sel)]
		self.active[res] = nil
	end
end

function Controls:keypressed(k)

	if k == 'g' then
		self:disableRandom()
	end

end

function Controls:drawHUD()

	local txt = ""

	for k,v in pairs(self.active) do
		txt = txt .. k .. ","
	end 

	love.graphics.print("Controls system functional: " .. txt, 20, 20)

end