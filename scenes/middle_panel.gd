extends Control

@onready var vbox = $ScrollContainer/VBoxContainer
var item_view_scene = load("res://scenes/ItemView.tscn")

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
