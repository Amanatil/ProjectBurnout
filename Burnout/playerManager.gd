extends Node2D

# Player Stats

@export var startingEnergy = 10.0
@export var startingSanity = 10.0
@export var startingMoney = 10.0

var currentEnergy = 10.0
var currentSanity = 10.0
var currentMoney = 0.0
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentEnergy = startingEnergy
	currentSanity = startingSanity
	currentMoney = startingSanity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func affectStats(sanity: float, energy: float, money: float) -> void:
	currentSanity += sanity
	currentEnergy += energy
	currentMoney += money
