extends Node

func _ready():
	# Load Database
	# here
	# Load Savefile
	# here
	# Choose layout

	await Database.database_loaded
	var scene
	if OS.has_feature("mobile"):
		scene = load("res://scenes/mainMobile.tscn")
	else:
		scene = load("res://scenes/desktop_main.tscn")
	var to_add = scene.instantiate()
	add_child(to_add)
