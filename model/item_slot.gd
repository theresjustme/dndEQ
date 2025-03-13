extends Resource
class_name ItemSlot

enum RestrictionType{
	INCLUSIVE,
	EXCLUSIVE
}
enum SlotType{
	PACKSLOT,
	QUICKSLOT,
	SPECIAL
}

@export var type: SlotType
@export var restriction: Array[String]
@export var restriction_type: RestrictionType
@export var item: Item

func can_add_item(item: Item) -> bool:
	if item == null:
		if restriction_type == RestrictionType.INCLUSIVE:
			if item.name in restriction:
				return true
			return false
		else:
			if item.name in restriction:
				return false
			return true
	return false

func add_item(item: Item):
	self.item = item
