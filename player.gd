extends Node2D

# Player class for a top-down view system.

# Properties
var speed = 200 # Movement speed
var combat_range = 100 # Combat range
var inventory = [] # Inventory list

# Called when the node enters the scene tree for the first time.
func _ready():
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    handle_movement(delta)

# Handle player movement
func handle_movement(delta):
    var velocity = Vector2.ZERO
    if Input.is_action_pressed('ui_right'):
        velocity.x += 1
    if Input.is_action_pressed('ui_left'):
        velocity.x -= 1
    if Input.is_action_pressed('ui_down'):
        velocity.y += 1
    if Input.is_action_pressed('ui_up'):
        velocity.y -= 1

    # Normalize the velocity to ensure consistent movement speed
    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
        position += velocity * delta

# Combat system to detect enemies within range
func combat(targets):
    for target in targets:
        if position.distance_to(target.position) <= combat_range:
            # Example combat logic, e.g., dealing damage
            target.take_damage(10)

# Inventory management
func add_to_inventory(item):
    inventory.append(item)

func remove_from_inventory(item):
    if item in inventory:
        inventory.erase(item)
