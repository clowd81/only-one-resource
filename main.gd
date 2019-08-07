extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
#    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var player = $Player
    var scoreTextBox = $UI.find_node("Score", true, false)
    var comboTextBox = $UI.find_node("Combo", true, false)
    var comboTimeBar = $UI.find_node("ComboTime", true, false)
    scoreTextBox.text = "SCORE: " + str(player.score)
    comboTextBox.text = "COMBO: " + str(player.comboCount)
    comboTimeBar.set_percent_visible(false)
    comboTimeBar.value = float(player.comboDecayTime) - float(player.comboCurDecay)
    