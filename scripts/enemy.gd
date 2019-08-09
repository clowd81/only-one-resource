extends Area2D

# Declare member variables here. Examples:
export var points = 50
export var comboVal = 1

const FLOATER = preload("res://objects/point_floater.tscn")

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
                area.ownerNode.comboInc(comboVal)
                var finalpoints = points * area.ownerNode.comboCount
                area.ownerNode.score += finalpoints
                
                var pointFloater = FLOATER.instance()
                pointFloater.global_position = global_position
                get_tree().get_root().add_child(pointFloater)
                pointFloater.createFloater(finalpoints)
        
        if get_parent().name.find("PathFollow2D"):
            get_parent().queue_free()
        
        queue_free()
