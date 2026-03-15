extends Node

const Type = CustomWeights.Type

@export var random_sampler :GradientWeightedSampler
@export var random_object :PackedScene
@export var shapes :Dictionary[Type, ShapeData]

func _ready() -> void:
	($GradientSampled.texture as GradientTexture1D).gradient = random_sampler.weights

func spawn():
	var type :Type = random_sampler.sample() as Type
	var obj :Node2D = random_object.instantiate()
	var shape :ShapeData = shapes[type]
	match type:
		Type.CIRCLE:
			$RedMarker2D.add_child(obj)
		Type.TRIANGLE:
			$GreenMarker2D.add_child(obj)
		Type.SQUARE:
			$BlueMarker2D.add_child(obj)
		Type.POLYGON:
			$YellowMarker2D.add_child(obj)
	obj.get_node("ShapeSprite").shape = shape

func _on_spawn_btn_pressed() -> void:
	for i in range(12):
		spawn()

func _on_reset_btn_pressed() -> void:
	for c in $RedMarker2D.get_children():
		c.queue_free()
	for c in $GreenMarker2D.get_children():
		c.queue_free()
	for c in $BlueMarker2D.get_children():
		c.queue_free()
	for c in $YellowMarker2D.get_children():
		c.queue_free()
