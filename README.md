# godot-toon-cel-pixelate-shader
Implementations of a godot **cel/toon** shader and a **pixelate** shader.

I found the pixelated shader [here](https://www.reddit.com/r/godot/comments/8b6scy/shader_that_pixelates_smooth_sprites/) and translated the toon shader from [this](https://www.shadertoy.com/view/XlSSRW).

# the cel/toon shader
It makes the picture look cartoonish.
It can toon accroding to HSV or according to RGB, with a switch shader param `use_hsv`.

Original picture:
![Image of Original Picture](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/1c569699-f921-44bd-8d0a-f7f81b703f9f/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200527%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200527T184635Z&X-Amz-Expires=86400&X-Amz-Signature=858a3d53869d85c61ba1ccc07c65a885d2553d8088a86bfdac50b006566a1a26&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

Toon HSV:
![Image Toon HSV](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/e8b3f192-1437-49d2-a45e-34aeb07a2293/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200527%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200527T184744Z&X-Amz-Expires=86400&X-Amz-Signature=cc3f156acf4ba09f356e4f36770f203baf236ca5cc622b14c8354051a9d40d5e&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

Toon RGB:
![Image Toon RGB](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/efdfbef6-256c-46bc-b9b4-83bb8c6188cb/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200527%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200527T184838Z&X-Amz-Expires=86400&X-Amz-Signature=29f64bf877fde8f7ebe21d5ebb197a1f52a495dd578a4f4704f989e23728f689&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

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
![Image of Pixelated Toon HSV](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/0624ce69-9da2-4300-823b-4685cd2b1c6c/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200527%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200527T184919Z&X-Amz-Expires=86400&X-Amz-Signature=acf44c0bc9ede32d32730938dff31bba262ba92787fc2422074896061380f38b&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

or this

![Image of Pixelated Toon RGB](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/f7fb201f-aaf0-464b-a165-99ac84c6e27f/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200527%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200527T184938Z&X-Amz-Expires=86400&X-Amz-Signature=2b5df19e49c350b7d4c305cb4cc8562872162fc769a4dc159aa7893c9fa27465&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

## parameters
The pixelate shader has two parameters, 

`x_size` and `y_size`

they are just the pixel size. (These pixel-size values can be quite small, as the size of an entire picture is `(1.0, 1.0)`.)

# the demo project
![Image of Demo Scene Tree](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/73636a5b-b685-4d7a-8cb3-7a4d63195c8a/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200527%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200527T185211Z&X-Amz-Expires=86400&X-Amz-Signature=1f9b9fc987056f5265c07c023c92a58b3cbbf9d82aee34654beddf4661d32bf7&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

It's quite self-explanatory. There is one scene called **Demo**. Use your own picture as the texture of `ToonRect`, make sure that `PixelatedRect` is on top of your `ToonRect`. You can change the visibility of `PixelateRect` if you so desire.

# save the generated picture

In `Project -> Project Settings -> Display -> Window`, change `width` and `height` to match your picture.
![Image of Display Settings](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/1cd67d4b-e3a1-4852-8d59-8f4d6bd7344e/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200527%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200527T185455Z&X-Amz-Expires=86400&X-Amz-Signature=83376655eba58100f9d68d9e54cd67587a49d3248c903c20009f2bd0406b1912&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

Play the **Demo** scene, with your picture as the `texture` of `ToonRect`. You can change the visibility of `PixelateRect`. Don't forget to tune the shader params to make it look better!

Finally, press enter after the scene starts to save the generated image to `res://save.png`

You will notice that the pixelated image is still
I'm trying to find some ways to export the final pixelated image as a "proper" .png or something like it, with no success (which would be overwhelmingly useful for me, and many other idie game developers). There is definitely a way, still working on it. PRs are welcome.

