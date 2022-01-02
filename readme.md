# Flying with Jello's Mode7 Godot Shader

This project is a minimal example using [Jellonator](https://gist.github.com/Jellonator/0686c6e74d06745957de5a96fa00ec6c#file-godot_mode7_shader-shader)'s shader.

The `Player` canvas layer is set to `Follow` Viewport and the `RemoteTransform2D` is used to follow the player's movement.

## Scene Tree Organization

-MapCanvas
    |-WorldMap
-Player
    |-Airship
        |-RemoteTransform2D
    |-Camera2D

## Issues

Unsure of how to handle the rotation. 😞