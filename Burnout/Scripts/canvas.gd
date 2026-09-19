extends Control

class_name Canvas

@onready var backgroundImage: TextureRect = $backgroundImage
@onready var characterImage: TextureRect = $characterImage
@onready var sceneText: TextEdit = $sceneText


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func populateCanvas(bgImage: Texture) -> void:
	backgroundImage.texture = bgImage
	
	pass
