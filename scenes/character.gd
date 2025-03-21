extends Node

@export var equipment: Equipment
signal values_changed

var strength: int:
	get:
		return equipment.strength
	set(value):
		equipment.strength = value
		values_changed.emit()

var maximum_slots: int:
	get:
		return 38 + 2 * strength

var used_slots: int:
	get:
		var slots = 0
		for item: Item in items:
			slots += item.weight
		return slots

var items:
	get:
		return equipment.items

func _ready():
	if !ResourceLoader.exists("user://equipment.tres"):
		print("create new")
		equipment = Equipment.new()
		save_equipment()
	else:
		load_equipment()
	connect("values_changed", save_equipment)

func add_item(item):
	if used_slots + item.weight <= maximum_slots:
		equipment.add_item(item)
		values_changed.emit()

func remove_item(item):
	equipment.items.erase(item)
	values_changed.emit()

func save_equipment():
	var err = ResourceSaver.save(equipment, "user://equipment.tres")

func load_equipment():
	equipment = load("user://equipment.tres")
