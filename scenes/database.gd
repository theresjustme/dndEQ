extends Node
signal added_item
var item_data: Array[Item]
var container_data: Array[ItemContainer]
var pending_requests: int = 0 
signal database_loaded

func _ready():
	$HTTPRequestList.request_completed.connect(download_data_from_srd)
	$HTTPRequestList.request("https://www.dnd5eapi.co/api/2014/equipment-categories/adventuring-gear")

func download_data_from_srd(_result, response_code, _headers, body: PackedByteArray):
	var list = JSON.parse_string(body.get_string_from_utf8())

	if not list or not list.has("equipment"):
		printerr("Error: Invalid equipment list response")
		return

	pending_requests = list["equipment"].size()  # Track pending API calls
	for element in list["equipment"]:
		fetch_item_data(element["url"])

func fetch_item_data(item_url: String):
	var http_request = HTTPRequest.new()
	add_child(http_request)  # Add the new request node to the scene
	http_request.request_completed.connect(add_item_to_database.bind(http_request))  
	http_request.request("https://www.dnd5eapi.co" + item_url)

func add_item_to_database(_result, response_code, _headers, body: PackedByteArray, http_request: HTTPRequest):
	var dict = JSON.parse_string(body.get_string_from_utf8())

	if dict and dict.has("gear_category") and dict["gear_category"]["index"] == "equipment-packs":
		pass  
	else:
		item_data.append(Item.new(dict))
	http_request.queue_free()
	pending_requests -= 1
	added_item.emit()
	if pending_requests == 0:
		database_loaded.emit()
