extends Area2D

const BULLET = preload("res://objects/player_bullet.tscn")

const MOVE_COST = 1
const SHOOT_COST = 25

# Declare member variables here. Examples:
export var speed = 400  # How fast the player will move (pixels/sec).
export var score = 1000
export var comboCount = 0
export var cycle_time = 0.25
var screen_size  # Size of the game window.
var cycling = 0.0
var shot_count = 2
export var comboDecayTime = 4
export var comboCurDecay = 4

# Called when the node enters the scene tree for the first time.
func _ready():
    screen_size = get_viewport_rect().size

func comboInc(var amt = 1):
    comboCurDecay = 0;
    comboCount += amt

func spawn_bullet(x, y):
    var bullet = BULLET.instance()
    bullet.global_position = global_position
    bullet.global_position.x += x
    bullet.global_position.y += y
    bullet.ownerNode = self
    get_parent().add_child(bullet)

func shoot():
    if cycling <= 0.0:
        cycling = cycle_time
        spawn_bullet(0, -42)
        score -= SHOOT_COST
        
        if shot_count >= 2:
            spawn_bullet(-12, -29)
            score -= SHOOT_COST
            
        if shot_count >= 3:
            spawn_bullet(-12, 29)
            score -= SHOOT_COST

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if cycling != 0.0:
        cycling -= delta
    
    if comboCurDecay >= comboDecayTime:
        comboCount = 0
    else:
        comboCurDecay += get_process_delta_time()
    
    var velocity = Vector2()  # The player's movement vector.
    if Input.is_key_pressed(KEY_D):
        velocity.x += 1
        
    if Input.is_key_pressed(KEY_A):
        velocity.x -= 1
        
    if Input.is_key_pressed(KEY_S):
        velocity.y += 1
        
    if Input.is_key_pressed(KEY_W):
        velocity.y -= 1
        
    if Input.is_key_pressed(KEY_SPACE):
        shoot()
        
    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
    
    # Movement costs score!
    if velocity.x != 0 || velocity.y != 0:
        score -= MOVE_COST
    
    position += velocity * delta
    position.x = clamp(position.x, 16, screen_size.x-16)
    position.y = clamp(position.y, 16, screen_size.y-16)