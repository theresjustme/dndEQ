extends Control
@onready var main_screen = preload("res://scenes/mainMobile.tscn")
@onready var inventory_scene = preload("res://scenes/mobile_properties.tscn")
@onready var vbox = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer


var item_view_scene = load("res://scenes/MobileItemView.tscn")

func _ready():
	Character.connect("values_changed", refresh)
	refresh()

func refresh():
	for child in vbox.get_children():
		child.queue_free()
	for item in Character.items:
		var scene: Control = item_view_scene.instantiate()
		scene.set_item_info(item)
		vbox.add_child(scene)
		scene.size_flags_vertical = SIZE_EXPAND_FILL


func _on_main_pressed() -> void:
	var next_scene = main_screen.instantiate()
	add_child(next_scene)
	get_tree().change_scene_to_file("res://scenes/mainMobile.tscn")


func _on_properties_pressed() -> void:
	var next_scene = main_screen.instantiate()
	add_child(next_scene)
	get_tree().change_scene_to_file("res://scenes/mobile_properties.tscn")
