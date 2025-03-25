extends Control

var item: Item
signal item_clicked(item)

func init(item: Item):
	self.item = item

func _ready():
	%ItemNameLabel.text = item.name
	self.custom_minimum_size = Vector2(0, 50)

func _on_add_item_button_pressed() -> void:
	item_clicked.emit(item)
