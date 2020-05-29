extends Control

export var female_in = 0
export var male_in = 0
#export var total_in = 0
export(int) var total_max = null

onready var FemaleInLabel = $FemaleInLabel
onready var MaleInLabel = $MaleOutLabel
onready var TotalInLabel = $TotalInLabel


# warning-ignore:unused_argument
func _process(delta):
	if female_in < 0:
		female_in = 0
	
	if male_in < 0:
		male_in = 0
	
	elif male_in + female_in < total_max:
		$ColorIn/FemaleInButton.disabled
		$ColorIn/MaleInButton.disabled
	
	FemaleInLabel.text = "Female In: " + str(female_in)
	MaleInLabel.text = "Male In: " + str(male_in)
	TotalInLabel.text = "Total In: " + str(female_in + male_in)


func _on_FemaleInButton_pressed():
	female_in += 1

func _on_FemaleOutButton_pressed():
	female_in -= 1


func _on_MaleInButton_pressed():
	male_in += 1

func _on_MaleOutButton_pressed():
	male_in -= 1
