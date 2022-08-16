extends KinematicBody2D

const FLAP_STRENGTH := 500
const GRAVITY := 2200
const MAX_FALL_SPEED := 900

var velocity := Vector2.ZERO


func _input(event: InputEvent):
    if event.is_action_pressed("flap"):
        velocity = Vector2(0, -1 * FLAP_STRENGTH)
        
func _physics_process(delta):
    velocity.y += GRAVITY * delta
    if velocity.y > MAX_FALL_SPEED:
        velocity.y = MAX_FALL_SPEED
    
    var collision := move_and_collide(velocity * delta)
    if (collision != null and 
    collision.collider.is_in_group("obstacle")):
# warning-ignore:return_value_discarded
        get_tree().reload_current_scene()
