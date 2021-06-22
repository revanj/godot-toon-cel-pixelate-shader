# godot-toon-cel-pixelate-shader
Implementations of a godot **cel/toon** shader and a **pixelate** shader.

I found the pixelated shader [here](https://www.reddit.com/r/godot/comments/8b6scy/shader_that_pixelates_smooth_sprites/) and translated the toon shader from [this](https://www.shadertoy.com/view/XlSSRW).

# the cel/toon shader
It makes the picture look cartoonish.
It can toon accroding to HSV or according to RGB, with a switch shader param `use_hsv`.

Original picture:
![Image of Original Picture](https://github.com/revanj/godot-toon-cel-pixelate-shader/blob/master/readme-images/original.png)

Toon HSV:
![Image Toon HSV](https://github.com/revanj/godot-toon-cel-pixelate-shader/blob/master/readme-images/toon-hsv.png)

Toon RGB:
![Image Toon RGB](https://github.com/revanj/godot-toon-cel-pixelate-shader/blob/master/readme-images/toon-rgb.png)

(Seem that HSV look better on this particular pic?)

## parameters
The toon shader has two parameters, 

`use_hsv`:
if true, will use HSV, else uses RGB to toon.

`nColors`:
Technically this is the amount of colors present in the picture. It will be used to determine how much sheering needs to be done.
However, this parameter does not have to be an integer, **it will look better when `nColors` is a suitable float**. Just slide in the editor to find the value with the least "noise", that would (usually) be the best for you.

# the pixelate shader
It pixelates the picture. The picture that we just tooned will now look like this
![Image of Pixelated Toon HSV](https://github.com/revanj/godot-toon-cel-pixelate-shader/blob/master/readme-images/toon-pixelate-hsv.png)

or this

![Image of Pixelated Toon RGB](https://github.com/revanj/godot-toon-cel-pixelate-shader/blob/master/readme-images/toon-pixelate-rgb.png)

## parameters
The pixelate shader has two parameters, 

`x_size` and `y_size`

they are just the pixel size. (These pixel-size values can be quite small, as the size of an entire picture is `(1.0, 1.0)`.)

# the demo project
![Image of Demo Scene Tree](https://github.com/revanj/godot-toon-cel-pixelate-shader/blob/master/readme-images/sample-scene-tree.png)

It's quite self-explanatory. There is one scene called **Demo**. Use your own picture as the texture of `ToonRect`, make sure that `PixelatedRect` is on top of your `ToonRect`. You can change the visibility of `PixelateRect` if you so desire.

# save the generated picture

In `Project -> Project Settings -> Display -> Window`, change `width` and `height` to match your picture.
![Image of Display Settings](https://github.com/revanj/godot-toon-cel-pixelate-shader/blob/master/readme-images/display-settings.png)

Play the **Demo** scene, with your picture as the `texture` of `ToonRect`. You can change the visibility of `PixelateRect`. Don't forget to tune the shader params to make it look better!

Finally, press enter after the scene starts to save the generated image to `res://save.png`

You will notice that the pixelated image is still
I'm trying to find some ways to export the final pixelated image as a "proper" .png or something like it, with no success (which would be overwhelmingly useful for me, and many other idie game developers). There is definitely a way, still working on it. PRs are welcome.

