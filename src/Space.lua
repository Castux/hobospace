require "class"

Space = class()

function Space:init()
	
	print "Initing space"

	return self
end

function Space:draw()

	print("Drawing space")

end

function Space:update(dt)

	print("Updating space")

end