extends Control

var item_view_scene = load("res://scenes/database_item.tscn")

func _ready():
	for item in Database.item_data:
		var scene: Control = item_view_scene.instantiate()
		scene.init(item)
		$ScrollContainer/VBoxContainer.add_child(scene)
		scene.size_flags_vertical = SIZE_EXPAND_FILL
		scene.connect("item_clicked", add_item_to_eq)

func add_item_to_eq(item):
	Character.add_item(item)
