extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var player = get_child(0)
    var UI = get_child(1)
    var scoreTextBox = UI.get_child(0)
    var comboTextBox = UI.get_child(1)
    scoreTextBox.text = "SCORE: " + str(player.score)
    comboTextBox.text = "COMBO: " + str(player.comboCount)
    
