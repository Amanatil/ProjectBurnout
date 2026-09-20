extends Node2D

# Player Stats

@export var starting_energy = 10.0
@export var starting_sanity = 10.0
@export var starting_money = 0.0

var current_energy = 0.0
var current_sanity = 0.0
var current_money = 0.0
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_stat(starting_sanity, starting_energy, starting_money)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_stat(sanity: float, energy: float, money: float) -> void:
	current_energy += sanity
	current_sanity += energy
	current_money += money
