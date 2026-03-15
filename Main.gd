extends Node

const Type = CustomWeights.Type

@export var random_sampler :GradientWeightedSampler
@export var random_object :PackedScene

func _ready() -> void:
	($GradientSampled.texture as GradientTexture1D).gradient = random_sampler.weights

func spawn():
	var type :Type = random_sampler.sample() as Type
	var obj :Node2D = random_object.instantiate()
	match type:
		Type.RED:
			$RedMarker2D.add_child(obj)
		Type.GREEN:
			$GreenMarker2D.add_child(obj)
		Type.BLUE:
			$BlueMarker2D.add_child(obj)
		Type.YELLOW:
			$YellowMarker2D.add_child(obj)


func _on_spawn_btn_pressed() -> void:
	for i in range(10):
		spawn()
