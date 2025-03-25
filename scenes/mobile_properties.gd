extends Control

@onready var inventory_scene = preload("res://scenes/mobile_inventory.tscn")
@onready var main_screen = preload("res://scenes/mainMobile.tscn")



func _ready():
	Character.connect("values_changed", update_panel)
	update_panel()

func update_panel():
	%StrengthScore.text = str(Character.strength)
	%UsedSlots.text = str(Character.used_slots)
	%MaximumSlots.text = str(Character.maximum_slots)

func _on_add_button_pressed() -> void:
	if Character.strength <= 19:
		Character.strength+=1

func _on_subtract_button_pressed() -> void:
	if Character.strength >= 2 and Character.maximum_slots-2 >= Character.used_slots:
		Character.strength-=1


func _on_inventory_pressed() -> void:
	var next_scene = inventory_scene.instantiate()
	add_child(next_scene)
	get_tree().change_scene_to_file("res://scenes/mobile_inventory.tscn")


func _on_main_pressed() -> void:
	var next_scene = main_screen.instantiate()
	add_child(next_scene)
	get_tree().change_scene_to_file("res://scenes/mainMobile.tscn")
