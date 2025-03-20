extends Control

@onready var vbox = $ScrollContainer/VBoxContainer

func _ready():
	for item in Database.item_data:
		var item_view_scene = load("res://scenes/ItemView.tscn").instantiate()
		item_view_scene.set_item_info(item)
		vbox.add_child(item_view_scene)
		
