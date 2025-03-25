extends Control

@onready var inventory_scene = preload("res://scenes/mobile_inventory.tscn")
@onready var properties_scene = preload("res://scenes/mobile_properties.tscn")

var item_view_scene = preload("res://scenes/database_mobile_item.tscn")  # Use preload for efficiency

func _ready():
	if not Database.item_data:
		return  # Prevents errors if Database is empty

	for item in Database.item_data:
		var scene: Control = item_view_scene.instantiate()
		scene.init(item)
		scene.size_flags_vertical = SIZE_EXPAND_FILL
		scene.connect("item_clicked", add_item_to_eq)
		$ScrollContainer2/VBoxContainer.add_child(scene)

func add_item_to_eq(item):
	Character.add_item(item)

func _on_inventory_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mobile_inventory.tscn")  # No need to instantiate

func _on_properties_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mobile_properties.tscn")  # No need to instantiate
