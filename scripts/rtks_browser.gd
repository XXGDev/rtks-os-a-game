extends Panel

@onready var TopMenu = $Content/TopMenu
@onready var URL = $Content/TopMenu/URL

@onready var webContainer = $Content/webContainer
@onready var RTKSearchHome = $Content/webContainer/RTKSearchHome
@onready var RTKSearchSearchPage = $Content/webContainer/RTKSearchSearchPage

func clear_pages():
	for page in webContainer.get_children():
		page.visible = false

func go_home():
	URL.text = ""
	clear_pages()
	RTKSearchHome.visible = true

func search_query(q: String):
	RTKSearchSearchPage.get_node("SearchBar").text = q
	clear_pages()
	RTKSearchSearchPage.visible = true

func _ready() -> void:
	RTKSearchHome.get_node("SearchBtn").pressed.connect(func():
		search_query(RTKSearchHome.get_node("Search").text)
	)
	
	RTKSearchSearchPage.get_node("ScrollContainer/List/Result/realTheKINGS").pressed.connect(func():
		clear_pages()
		URL.text = "www.realthekings.com"
		webContainer.get_node("Page_realTheKINGS").visible = true
	)
	
	RTKSearchSearchPage.get_node("ScrollContainer/List/Result2/RTKSMaps").pressed.connect(func():
		clear_pages()
		URL.text = "www.rtksmaps.com"
		webContainer.get_node("Page_RTKSMaps").visible = true
	)
	
	RTKSearchSearchPage.get_node("ScrollContainer/List/Result3/RTKSConnect").pressed.connect(func():
		clear_pages()
		URL.text = "www.rtksconnect.com"
		webContainer.get_node("Page_realTheKINGS").visible = true
	)
	
	RTKSearchSearchPage.get_node("ScrollContainer/List/Result4/RTKSAI").pressed.connect(func():
		clear_pages()
		URL.text = "www.rtks-ai.com"
		webContainer.get_node("Page_RTKSAI").visible = true
	)
	
	TopMenu.get_node("GoBtn").pressed.connect(func():
		if URL.text == "":
			go_home()
		elif URL.text == "www.realthekings.com":
			clear_pages()
			webContainer.get_node("Page_realTheKINGS").visible = true
			# NOTE: pages go in elif blocks, except home page
		elif URL.text == "www.rtksmaps.com":
			clear_pages()
			webContainer.get_node("Page_RTKSMaps").visible = true
		elif URL.text == "www.rtksconnect.com":
			pass
		elif URL.text == "www.rtks-ai.com":
			clear_pages()
			webContainer.get_node("Page_RTKSAI").visible = true
		else:
			# NOTE: here goes the error page
			# on second thought... actually handle this as search requests
			search_query(URL.text)
	)
	
	TopMenu.get_node("HomeBtn").pressed.connect(go_home)


#func _process(delta: float) -> void:
#	pass
