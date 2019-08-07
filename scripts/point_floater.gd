extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var decayTime = 0.75
var curDecay = 0
# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if curDecay >= decayTime:
        queue_free()
    else:
        self.global_position.y -= 1
        curDecay += delta

func createFloater(var points):
    var pointFloater = find_node("pointfloater", true, false)
    pointFloater.text = str(points)