class_name GradientWeightedSampler
extends Resource

@export var weights :Gradient
@export var defs :WeightedSamplerDefs
@export var seed_ :int = -1

var rng :RandomNumberGenerator

func sample() -> int:
	if rng == null:
		rng = RandomNumberGenerator.new()
		rng.seed = hash(seed_) if seed_ != -1 else hash(Time.get_ticks_usec())
	if weights != null and weights.get_point_count() > 0:
		var c := weights.sample(rng.randf())
		return defs.parse_color(c)
	var types := defs.get_types()
	return types[rng.randi() % types.size()]
