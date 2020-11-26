* create a new empty project in godot
* extract the [start.zip](https://github.com/s4pu/GodotTutorialTopDown/archive/start.zip) file into the new project folder
* let's make a scene with our player
    - create a game.tscn
    - drag-and-drop the background.jpg onto the game scene, make it start in the top right corner and span the whole screen
    - create a player.tscn
    - drag-and-drop the player texture into the center, make it an **area2d**, add a collisionshape as a rectangle
    - back in the game.tscn, drag-and-drop the player.tscn to create a player instance
    - launch the game, he's there!
* let's make him move:
    - create a player.gd
    - type in the [\_process](https://github.com/s4pu/GodotTutorialTopDown/blob/main/player/player.gd#L12) function together
* nice! let's get some enemies
    - create an enemy.tscn, root is area2d, add texture, collisionshape, scale it down to (0.2, 0,2)
* let's spawn enemies every second
    - to the game.tscn, add a timer, set it to autostart
    - go to the timer's signals and connect the timeout signal to a new [function](https://github.com/s4pu/GodotTutorialTopDown/blob/main/game/game.gd#L8) (skip the "hit" and "target" parts for now)
    - launch the game, hey they're appearing everywhere!
* let's make the enemies run towards us
    - add a script to enemy.tscn, copy the [\_process](https://github.com/s4pu/GodotTutorialTopDown/blob/main/enemy/enemy.gd#L1), declare the "target" inst var at the top
    - back in our game.gd, when we spawn the enemy, we want to set the "target" to "$player"
    - launch the game, he runs towards us!
* let's take damage and have the enemies disappear when they touch us:
    - in enemy.tscn, go to the area2d's signals and connect the area\_entered signal, implement it like [so](https://github.com/s4pu/GodotTutorialTopDown/blob/main/enemy/enemy.gd#L13)
    - in player.gd, add hitpoints var and the `take_damage` [func](https://github.com/s4pu/GodotTutorialTopDown/blob/main/player/player.gd#L34) (skip the emit\_signal), maybe add a `print(hitpoints)` for now
    - launch the game, we die D:
* let's shoot the enemies with presents
    - add a projectile.tscn, again area2d as root, add sprite, add collisionshape, scale it down to (0.2, 0.2)
    - in our player.tscn, add the [\_input](https://github.com/s4pu/GodotTutorialTopDown/blob/main/player/player.gd#L24) method
    - add a script to our projectile, add the [code](https://github.com/s4pu/GodotTutorialTopDown/blob/main/projectile/projectile.gd)
    - add the `hit` [method](https://github.com/s4pu/GodotTutorialTopDown/blob/main/enemy/enemy.gd#L18) to enemy.gd (skip the emit\_signal)
    - launch the game: we can now defend ourselves
* let's show our score and our hitpoints
    - declare the signal `hit` in enemy.gd, emit it when we are hit
    - add a Label in our game.tscn, connect the `hit` signal of the enemies to [update our score](https://github.com/s4pu/GodotTutorialTopDown/blob/main/game/game.gd#L13) in game.gd
    - add a ColorRect in our game.tscn, make it appear full width at the very bottom, maybe make it green
    - declare the signal `hitpoints_changed` in player.gd and emit it when we take damage
    - [connect the signal](https://github.com/s4pu/GodotTutorialTopDown/blob/main/game/game.gd#L6) in game.gd to a new `update_hitpoints` method

