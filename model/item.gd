extends Resource
class_name Item

@export var name: String
@export var description: String
@export var weight: int
@export var cost = {
	"quantity": 0,
	"unit": "gp"
}

func _init(dict = {"name": "name", "desc": "description", "weight": 1, "cost": {"quantity": 1, "unit": "gp"}}):
	self.name = dict["name"]
	self.description = ""
	for line in dict["desc"]:
		description += line
		description += "\n"
	if description == "":
		description = "No item description."
	var weight_in_kg: float = dict["weight"]/2.0
	if weight_in_kg == 0:
		self.weight = 1
	elif weight_in_kg <= 1:
		self.weight = 2
	elif weight_in_kg <= 2.5:
		self.weight = 3
	else:
		self.weight = 4
	self.cost["quantity"] = int(dict["cost"]["quantity"])
	self.cost["unit"] = dict["cost"]["unit"]

func save():
	var save_dict = {
		"name": name,
		"description": description,
		"weight": weight,
		"cost": cost
	}
