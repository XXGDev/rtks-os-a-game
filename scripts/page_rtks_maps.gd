extends Panel

@onready var PlaceList = $ScrollContainer/List
@onready var info = $info

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlaceList.get_node("Result/RTKSMixoable").pressed.connect(func():
		for place in info.get_children():
			place.visible = false
		
		$info/RTKSMixoable.visible = true
	)
	
	$info/RTKSMixoable/Main/ReviewsBtn.pressed.connect(func():
		$info/RTKSMixoable/Main.visible = false
		$info/RTKSMixoable/Reviews.visible = true
	)
	$info/RTKSMixoable/Reviews/BackBtn.pressed.connect(func():
		$info/RTKSMixoable/Main.visible = true
		$info/RTKSMixoable/Reviews.visible = false
	)
	
	
	PlaceList.get_node("Result2/RTKSHQ").pressed.connect(func():
		for place in info.get_children():
			place.visible = false
		
		$info/RTKSHQ.visible = true
	)
	
	$info/RTKSHQ/Main/ReviewsBtn.pressed.connect(func():
		$info/RTKSHQ/Main.visible = false
		$info/RTKSHQ/Reviews.visible = true
	)
	$info/RTKSHQ/Reviews/BackBtn.pressed.connect(func():
		$info/RTKSHQ/Main.visible = true
		$info/RTKSHQ/Reviews.visible = false
	)
