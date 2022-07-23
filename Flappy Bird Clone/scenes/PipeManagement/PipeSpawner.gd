extends Position2D

export (PackedScene) var pipe_scene = load("res://scenes/PipeManagement/Pipe.tscn")
const SPAWN_RANGE = 90

func _ready():
    $PipeTimer.connect("timeout", self, "_on_PipeTimer_timeout")
    $PipeTimer.start() # Temporary Start
    
func _on_PipeTimer_timeout():
    var pipe = pipe_scene.instance()
    pipe.position.y = rand_range(-1 * SPAWN_RANGE, SPAWN_RANGE)
    add_child(pipe)
