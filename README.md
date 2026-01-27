# 10th-grade-day-project
Project made for Bay Arenic ISD Career Center. It was created by a first year student name Nickolas.


# What can you do?
In this activity, you will be able to play around with how the game functions and change how the player look.

# Changing player movement

1. Locate Global.gd found in the Script folder
2. Once located, double click it to open it
3. Inside Global.gd locate the  variable howManyTiles and change it to any number. Negative numbers will send the Player backwards.
4. Tilesize effects what the player's 

# Changing the player's look
A platypus? PERRY THE PLATYPUS?!?!

1. Locate Player.gd found in the Script folder
2. In Player.gd, Find the line ```var whichAnimations := "normalPlatyPus"```  and change it to ```var whichAnimations := "secretAgent```
3. Run the game and see the results (:
4. Perry the Platypus!?

# Funny gameplay...
Hehe he gaming.

1. Locate title_screen.gd in the Script folder
2. In title_screen.gd find ```var about:=load("res://Scenes/About.tscn")```.
3. Change ```var about:=load("res://Scenes/About.tscn")``` to ```var about:=load("res://Scenes/seebecks_Gameplay.tscn")```
4. Run the game.
5. Click on About.

# Changing Car Speed
Zooom.
1. Locate car.gd in the Script folder
2. In car.gd, change ```var SPEED = 600``` to something slower or bigger, e.g ```var SPEED = 400``` for slower.
