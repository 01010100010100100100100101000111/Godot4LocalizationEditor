@tool
extends EditorPlugin

const IconResource = preload("res://addons/localization_editor/icons/Localization.svg")
const LocalizationMain = preload("res://addons/localization_editor/LocalizationEditor.tscn")

var _localization_main: Control = null

func _enter_tree():
	_localization_main = LocalizationMain.instantiate()
	_localization_main.name = "LocalizationEditor"
	get_editor_interface().get_editor_main_control().add_child(_localization_main)
	_localization_main.set_editor(self)
	_make_visible(false)

func _make_visible(visible):
	if _localization_main:
		_localization_main.visible = visible

func _exit_tree():
	if _localization_main:
		_localization_main.queue_free()

func _has_main_screen() -> bool:
	return true

func _get_plugin_name():
	return "Localization"

func _get_plugin_icon() -> Texture:
	return IconResource