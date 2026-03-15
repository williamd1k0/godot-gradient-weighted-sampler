@tool
extends Node2D

@export var shape :ShapeData:
	set(val):
		shape = val
		queue_redraw()

func _draw() -> void:
	if shape is PolygonShapeData:
		var points :Array[Vector2] = []
		for i in range(shape.sides):
			var ang := deg_to_rad(shape.rotation + i * 360 / shape.sides)
			var point :Vector2 = Vector2(cos(ang), sin(ang)) * shape.size
			points.append(point)
		points.append(points[0])
		draw_colored_polygon(points, shape.fill_color)
		draw_polyline(points, shape.line_color, shape.line_width)
	elif shape is CircleShapeData:
		draw_circle(Vector2.ZERO, shape.radius, shape.fill_color, true)
		draw_circle(Vector2.ZERO, shape.radius, shape.line_color, false, shape.line_width)
