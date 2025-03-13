extends Control

func _ready():
	for item in Database.item_data:
		$ScrollContainer/ItemList.add_item(item.name)
