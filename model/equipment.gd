extends Resource
class_name Equipment

var containers: Array[ItemContainer]

func add_item(item: Item) -> bool:
	for container in containers:
		if container.add_item(item):
			return true
	return false
