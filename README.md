# GodotTutorialTopDown
Tutorial for Godot in preparation of the next gamejam @ HPI.

![Screenshot of the game](https://github.com/s4pu/GodotTutorialTopDown/blob/main/screenshot.png?raw=true)

# Things that didn't fit in the Workshop slot
* The enemies always spawn in the same spots. Call randomize() to get a new seed on each new run.
* You can easily spice things up by creating a "hit_parcticles" scene, adding Particles2D to it, configure it to your liking, and then spawn it whenever a projectile impacts
* We let enemies spawn in a hardcoded area. Instead, use `get_viewport_rect().size` to let them spawn in all positions of the screen.
