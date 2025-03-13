extends Resource
class_name ItemContainer

@export var slots: Array[ItemSlot]
@export var slot_count: int = len(slots)

func _init(slots: Array[ItemSlot], count: int):
	self.slots = slots
	slot_count = count

func add_item(item: Item) -> bool:
	var vacant_slots: Array[ItemSlot]
	for slot in slots:
		if slot.can_add_item(item):
			vacant_slots.append(slot)
			if len(vacant_slots) >= item.weight:
				for sl in vacant_slots:
					sl.add_item(item)
				return true
	return false
