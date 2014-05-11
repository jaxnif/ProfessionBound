

function main(args)
	if storage.init == nil then
		local items = entity.configParameter("items")
		for i = 1,#items do
			world.containerAddItems(entity.id(),items[i])
		end
		storage.init = true
		return
	end
end

function die()
	local itemlist = world.containerItems(entity.id())
	world.containerTakeAll(entity.id())
	local objectName = entity.configParameter("objectName")
	world.spawnItem(objectName, entity.position(), 1, {items = itemlist})
	entity.smash()
end