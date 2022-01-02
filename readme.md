# Flying with Jello's Mode7 Godot Shader
![](example_1.png)

[Godot 3.2](https://www.godotengine.org/) project that is a minimal example of emulating a 3D environment with only 2D called Mode7. The project mainly implements [Jellonator](https://gist.github.com/Jellonator/0686c6e74d06745957de5a96fa00ec6c#file-godot_mode7_shader-shader)'s Mode7 shader.

The `Player` [canvas layer](https://docs.godotengine.org/en/stable/tutorials/2d/canvas_layers.html) is set to Viewport parameter is set to `Follow`. The `RemoteTransform2D` node is used to follow the player's movement.

The `MapCanvas` is another canvas layer that contains the `WorldMap`.

The `WorldMap` is [sprite node](https://docs.godotengine.org/en/stable/classes/class_sprite.html) which has all the shader options that affects the transforms located in the `Materials/Shader` params:

![](shader_params.png)

## Scene Tree Organization

-MapCanvas
    |-WorldMap
-Player
    |-Airship
        |-RemoteTransform2D
    |-Camera2D

## Issues

Unsure of how to handle the rotation. 😞

## Sources

- Map: [https://www.redblobgames.com/maps/mapgen4/](https://www.redblobgames.com/maps/mapgen4/)
- Shader: [https://gist.github.com/Jellonator/0686c6e74d06745957de5a96fa00ec6c#file-godot_mode7_shader-shader](https://gist.github.com/Jellonator/0686c6e74d06745957de5a96fa00ec6c#file-godot_mode7_shader-shader)
- Airship by DualR. [Commissioned by OpenGameArt.org](https://opengameart.org/content/16x16-fantasy-pixel-art-vehicles)