extends Tree

@onready var FileContents = $"../../FileContents"

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = create_item()
	hide_root = true
	var ThisPC = create_item(root)
	ThisPC.set_text(0, "This PC")
	#var child2 = create_item(root)
	#child2.set_text(0, "hi (child2)")
	var Desktop = create_item(ThisPC)
	Desktop.set_text(0, "Desktop")
	create_item(Desktop).set_text(0, "Recycle Bin")
	create_item(Desktop).set_text(0, "RTKS Browser")
	
	var Documents = create_item(ThisPC)
	Documents.set_text(0, "Documents")
	
	var Music = create_item(ThisPC)
	Music.set_text(0, "Music")
	create_item(Music).set_text(0, "realTheKINGS_Anthem.mp3")
	create_item(Music).set_text(0, "Disstrack.mp3")
	
	var System = create_item(ThisPC)
	System.set_text(0, "RTKS_OS")
	
	create_item(System).set_text(0, "RtksOSBootloader.js")
	create_item(System).set_text(0, "realTheKINGSService.js")
	
	var Apps = create_item(System)
	Apps.set_text(0, "Apps")
	
	create_item(Apps).set_text(0, "Welcome Center.hta")
	create_item(Apps).set_text(0, "RTKS Browser.hta")
	create_item(Apps).set_text(0, "RTKS Music.hta")
	create_item(Apps).set_text(0, "Personalize your PC.hta")
	create_item(Apps).set_text(0, "Notepad.hta")
	create_item(Apps).set_text(0, "File Explorer.hta")
	
	Desktop.collapsed = true
	Music.collapsed = true
	System.collapsed = true
	
	item_selected.connect(_on_tree_item_selected)

func clear_contents():
	for content in FileContents.get_children():
		content.visible = false


func _on_tree_item_selected():
	var item = get_selected() # Returns the TreeItem currently selected
	if not item: 
		return

	var item_name = item.get_text(0)
	print("Selected: " + item_name)
	
	match item_name:
		"This PC":
			clear_contents()
			FileContents.get_node("files_ThisPC").visible = true
		"Desktop":
			clear_contents()
			FileContents.get_node("files_ThisPC-Desktop").visible = true
		"Music":
			clear_contents()
			FileContents.get_node("files_ThisPC-Music").visible = true
		"RTKS_OS":
			clear_contents()
			FileContents.get_node("files_ThisPC-System").visible = true
		
		"Apps":
			clear_contents()
			FileContents.get_node("files_ThisPC-System-Apps").visible = true
		
		_:
			clear_contents()
			FileContents.get_node("noFilesFound").visible = true
