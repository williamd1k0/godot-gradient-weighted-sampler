class_name CustomWeights
extends WeightedSamplerDefs

enum Type {
	CIRCLE, TRIANGLE, SQUARE, POLYGON
}

@export var defs :Dictionary[Type, Color]

func parse_color(c:Color) -> int:
	var val :int = -1
	for t in defs:
		if defs[t] == c:
			val = t
			break
	return val

func get_types() -> Array[int]:
	return Type.values()
