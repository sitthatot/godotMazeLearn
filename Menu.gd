extends Node2D

func _on_start_pressed():
	get_tree().change_scene_to_file("res://enter_name.tscn") #changePageToGame


func _on_score_pressed():
	
	get_tree().change_scene_to_file("res://score_board_page.tscn") #changePageToScoreBoard


func _on_exit_pressed():
	get_tree().quit()



func _on_start_mouse_entered():
	$click_sound.play()


func _on_score_mouse_entered():
	$click_sound.play()


func _on_exit_mouse_entered():
	$click_sound.play()
