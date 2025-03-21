extends Control

func _ready():
	Character.connect("values_changed", update_panel)
	update_panel()

func update_panel():
	%StrengthScore.text = str(Character.strength)
	%UsedSlots.text = str(Character.used_slots)
	%MaximumSlots.text = str(Character.maximum_slots)

func _on_add_button_pressed() -> void:
	if Character.strength <= 19:
		Character.strength+=1

func _on_subtract_button_pressed() -> void:
	if Character.strength >= 2 and Character.maximum_slots-2 >= Character.used_slots:
		Character.strength-=1
