extends Resource
class_name Equipment

@export var items: Array[Item]
@export var strength: int = 10

func add_item(item: Item):
	items.append(item)

#var containers: Array[ItemContainer]

#func add_item(item: Item) -> bool:
#	for container in containers:
#		if container.add_item(item):
#			return true
#	return false
