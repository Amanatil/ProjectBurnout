extends Node2D

@onready var dialog_ui = $CanvasLayer/DialogUI

var dialog_index : int = 0

var dialog_lines: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialog_lines = load_dialog("res://Resources/Story/story.json")
	dialog_index = 0
	process_current_line()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("next_line"):
		if dialog_index < len(dialog_lines) - 1:
			dialog_index += 1
			process_current_line()
			
		if dialog_index == len(dialog_lines) - 1:
			PlayerManager.update_stat(10, -5, 2500)
			dialog_ui.set_stat()
			
func load_dialog(file_path):
	if not FileAccess.file_exists(file_path):
		printerr("Error: File does not exist: ", file_path)
		return null
	
	# Open the file
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file == null:
		printerr("Error: Failed to open file: ", file_path)
	
	# Read content as text
	var content = file.get_as_text()
	
	# Parse the json
	var json_content = JSON.parse_string(content)
	if json_content == null:
		printerr("Error: Failed to parse JSON from file: ", file_path)
	
	return json_content
	
func get_anchor_position(anchor: String):
	# Find anchoe entry with matching name
	for i in range(dialog_lines.size()):
		if dialog_lines[i].has("anchor") and dialog_lines[i]["anchor"] == anchor:
			return i
	
	# if the anchor was not found
	printerr("Error: Could not find anchor '" + anchor + "'")
	return null	
	
func process_current_line():
	var line = dialog_lines[dialog_index]
	
	# Check if this is a goto command
	if line.has("goto"):
		dialog_index = get_anchor_position(line["goto"])
		process_current_line()
		return
		
	# Check if this is just an anchor declaration
	if line.has("anchor"):
		dialog_index += 1
		process_current_line()
		return
		
	if line.has("choices"):
		pass
	else:
		# Reading line of dialog
		dialog_ui.dialog_line.text = line["text"]
		dialog_ui.speaker_name.text = line["speaker"]
	

		
