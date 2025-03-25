extends Node
var i = 0 

func _ready():
	# Load Database
	# here
	# Load Savefile
	# here
	# Choose layout
	update_item()
	Database.connect("added_item", update_item)
	await Database.database_loaded
	var scene
	if OS.has_feature("mobile"):
		scene = load("res://scenes/mainMobile.tscn")
	else:
		scene = load("res://scenes/desktop_main.tscn")
	var to_add = scene.instantiate()
	add_child(to_add)
	$Label.visible = false
	
func update_item():
	$Label.text = "Items added: " + str(i)
	i+=1 
