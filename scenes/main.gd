extends Node

func _ready():
	# Load Database
	# here
	# Load Savefile
	# here
	# Choose layout
	print("XD")
	await Database.database_loaded
	print("XD2")
	var scene
	if OS.has_feature("mobile"):
		pass
	else:
		scene = load("res://scenes/desktop_main.tscn")
	var to_add = scene.instantiate()
	add_child(to_add)
