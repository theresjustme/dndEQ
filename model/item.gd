extends Resource
class_name Item

var name: String
var description: String
var weight: int
var cost = {
	"quantity": 0,
	"unit": "gp"
}

func _init(dict):
	self.name = dict["name"]
	self.description = ""
	for line in dict["desc"]:
		description += line
		description += "\n"
	var weight_in_kg: float = dict["weight"]/2.0
	if weight_in_kg == 0:
		self.weight = 1
	elif weight_in_kg <= 1:
		self.weight = 2
	elif weight_in_kg <= 2.5:
		self.weight = 3
	else:
		self.weight = 4
	self.cost["quantity"] = dict["cost"]["quantity"]
	self.cost["unit"] = dict["cost"]["unit"]
