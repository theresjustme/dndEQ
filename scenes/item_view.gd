extends Control

@onready var name_label: RichTextLabel = $Panel/NameLabel

func set_item_info(item: Item) -> void:
	if name_label:
		name_label.text = item.name  
	else:
		print(name_label)
