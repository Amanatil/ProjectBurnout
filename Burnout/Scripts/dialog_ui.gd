extends Control

@onready var dialog_line = $DialogBox/DialogLine
@onready var speaker_name: RichTextLabel = $SpeakerName/SpeakerName
@onready var player_stats_value: ItemList = $PlayerStatContainer/PlayerStatSubContainer/PlayerStatValue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_stat()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_stat() :
	player_stats_value.set_item_text(0, str(int(PlayerManager.current_energy)))
	player_stats_value.set_item_text(1, str(int(PlayerManager.current_sanity)))
	player_stats_value.set_item_text(2, str(int(PlayerManager.current_money)))
