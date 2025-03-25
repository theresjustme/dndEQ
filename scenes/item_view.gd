extends Control

@export var item: Item
var item_expanded = false

func set_item_info(item: Item) -> void:
	self.item = item

func _ready():
	if item:
		%NameLabel.text = item.name
		%CostLabel.text = str(item.cost["quantity"]) + " " + item.cost["unit"]
		%WeightLabel.text = str(item.weight) + " slots"
		%DescriptionLabel.text = item.description
		if item.description.ends_with("\n"):
			%DescriptionLabel.text = item.description.erase(len(item.description)-1, 2)
		%DescriptionLabel.size.y = 10
		size.y = 10

func _on_name_label_pressed() -> void:
	if item_expanded:
		%HBoxContainer.visible = false
		%DescriptionLabel.visible = false
		%DeleteButton.visible = false
		item_expanded = false
	else:
		%HBoxContainer.visible = true
		%DescriptionLabel.visible = true
		%DeleteButton.visible = true
		item_expanded = true


func _on_button_pressed() -> void:
	Character.remove_item(item)
	queue_free()
