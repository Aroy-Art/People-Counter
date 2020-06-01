#################################################
# @Author : EDUDD22 (Levi Mattiasson)           #
# @E-mail : levimattiasson@pm.me                #
# @Github : https://github.com/EDUDD22          #
#################################################
extends Control

export var female_in = 0
export var male_in = 0
export var total_in = 0
export(int) var total_max = 1 - 0

var last = null

onready var FemaleInLabel = $FemaleInLabel
onready var MaleInLabel = $MaleOutLabel
onready var TotalInLabel = $TotalInLabel
onready var animationplayer = $AnimationPlayer

func _ready():
	$MaxIn.hide()

# warning-ignore:unused_argument
func _process(delta):
	total_in = female_in + male_in
	
	#Make sure that female_in is not below zero.
	if female_in < 0:
		female_in = 0
	#Make sure that male_in is not below zero.
	if male_in < 0:
		male_in = 0
	
	elif male_in + female_in > total_max:
		animationplayer.play("Warning", 0)
		total_in = total_in - 1
		if last == true:
			female_in -= 1
		
		elif last == false:
			male_in -= 1
	
	#elif male_in + female_in > total_max:
	#	$ColorIn/FemaleInButton.disabled = true
	#	$ColorIn/MaleInButton.disabled = true
	#	total_in = total_max
	
	FemaleInLabel.text = "Female In: " + str(female_in)
	MaleInLabel.text = "Male In: " + str(male_in)
	TotalInLabel.text = "Total In: " + str(total_in)


func _on_FemaleInButton_pressed():
	female_in += 1
	last = true

func _on_FemaleOutButton_pressed():
	female_in -= 1


func _on_MaleInButton_pressed():
	male_in += 1
	last = false

func _on_MaleOutButton_pressed():
	male_in -= 1
