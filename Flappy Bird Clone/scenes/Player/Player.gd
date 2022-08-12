extends KinematicBody2D

const FLAP_STRENGTH := 500
const GRAVITY := 2200
const MAX_FALL_SPEED := 900

var velocity := Vector2.ZERO

func _ready():
    pass
    
func _input(event: InputEvent):
    if event.is_action_pressed("flap"):
        velocity = Vector2(0, -1 * FLAP_STRENGTH)
        
func _physics_process(delta):
    velocity.y += GRAVITY * delta
    if velocity.y > MAX_FALL_SPEED:
        velocity.y = MAX_FALL_SPEED
    
    move_and_slide(velocity)
