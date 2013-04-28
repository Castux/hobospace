require "Space"

local space

function love.load()

	loadImages()
	
	space = Space()

end

function love.draw()
	
	space:draw()

end

function love.update(dt)

	space:update(dt)

end

function love.keypressed(k)

	space:keypressed(k)

end

function loadImages()

	images = {}
	local imgPath = "img"

	local files = love.filesystem.enumerate(imgPath)

	for i,v in ipairs(files) do
		local img = love.graphics.newImage(imgPath .. "/" .. v)
		local name = v:match("(%w+)%.")

		images[name] = img
		print("Loaded image " .. v)
	end

end

function distanceObjects(o1,o2)
	return math.abs((o1.x)-(o2.x))+math.abs((o1.y)-(o2.y))
end