extends AnimatableBody2D
class_name Obstacle

@export var shrink_speed := 2.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CollisionPolygon2D.scale = Vector2.ONE*10.0
	
	# randomize the initial rotation of the obstacle
	$CollisionPolygon2D.rotate(randi_range(0,360))
	
func _physics_process(delta: float) -> void:
	
	$CollisionPolygon2D.scale -= Vector2.ONE * shrink_speed*delta
	
	#once tiny, delete
	if $CollisionPolygon2D.scale.x < 0.5:
		self.queue_free()
	
	
		
