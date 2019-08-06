extends Area2D

# Declare member variables here. Examples:
export var points = 50

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _on_Enemy_area_entered(area):
    if area.name.find("PlayerBullet") > -1:
        
        if "ownerNode" in area:
            if "score" in area.ownerNode:
                area.ownerNode.score += points
                
        queue_free()
