extends Node

var item_data: Array[Item]
var container_data: Array[ItemContainer]
signal database_loaded

func _ready():
	$HTTPRequestList.request_completed.connect(download_data_from_srd)
	$HTTPRequestItem.request_completed.connect(add_item_to_database)
	$HTTPRequestList.request("https://www.dnd5eapi.co/api/2014/equipment-categories/adventuring-gear")

func download_data_from_srd(_result, response_code, _headers, body: PackedByteArray):
	var list = JSON.parse_string(body.get_string_from_utf8())
	print(list)
	for element in list["equipment"]:
		print(element["index"])
		$HTTPRequestItem.request("https://www.dnd5eapi.co"+element["url"])
		await $HTTPRequestItem.request_completed
	database_loaded.emit()

func add_item_to_database(_result, response_code, _headers, body: PackedByteArray):
	var dict = JSON.parse_string(body.get_string_from_utf8())
	if dict.has("gear_category"):
		if dict["gear_category"]["index"] != "equipment-packs":
			item_data.append(Item.new(dict))
	else:
		item_data.append(Item.new(dict))
