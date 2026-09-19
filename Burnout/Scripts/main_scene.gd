extends Node2D

@onready var dialog_ui = $CanvasLayer/DialogUI

var dialog_index : int = 0

const dialog_lines: Array[String] = [
		"You: You have been working in the ABC agency as a Senior Designer for 4 years.",
		"You: Sometimes, things are great, and sometimes, they are bad.",
		"You: Lately though, it feels like the world has just been against you.",
		"You: You got passed over for promotion. The company has been cutting benefits.",
		"You: Simply put, things have just been... crappy.",
		"You: You are determined to change everything in 2 weeks.",
		"You: That, or ... maybe it's time to called it quit.",
		"You: In this company, and maybe this life.",
		"You: These 2 weeks starts tomorrow."
	]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialog_index = 0
	process_current_line()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("next_line"):
		if dialog_index < len(dialog_lines) - 1:
			dialog_index += 1
			process_current_line()

func parse_line(line: String):
	var line_info = line.split(":")
	assert(len(line_info) >= 2)
	return {
		"speaker_name": line_info[0],
		"dialog_line": line_info[1]
	}
	
func process_current_line():
	var line = dialog_lines[dialog_index]
	var line_info = parse_line(line)
	dialog_ui.dialog_line.text = line_info['dialog_line']
