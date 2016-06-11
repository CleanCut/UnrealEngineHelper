Blender Dvorak Keyboard Layout
==============================

The `Dvorak-Laptop.blend.py` file was downloaded from the
[Blender-Dvorak-Key-Configuration project](https://github.com/BioticPixels/Blender-Dvorak-Key-Configuration)
on 3 February 2016.  There may be an updated version there.  To import it into
Blender go to `User Prefences > Input > Import Key Configuration` and select
the `Dvorak-Laptop.blend.py` file.

Blender Template
================

`UE4Template.blend` is a default blender file (originally created in 4.76b)
that has had a bunch of settings tweaked so that it will work better when
exporting to Unreal Engine 4.  Just copy it and use it as a starting place for
new meshes you want to create.

- Units are in metric in the scene panel in the Property Editor 
- Also in the scene panel, scale has been set to `0.01` to correspond to UE4's
  default unit of 1cm
- Clip End in `Properties > View` has been set to 1km to compensate for the
  above scale change
- Clipping End on the camera has been set to 1000

Blender Export Workflow
=======================

- Start by making a copy of `UE4Template.blend`
- Make the model that you want and name it in the outliner.
- Make a second model for the collider.  Name the second model `UCX_(NAME)`
  where `(NAME)` is the name of the original that this will be a collider for.
  For example, if your model is name `Ship` then the collider should be named
  `UCX_Ship`.
- Save the blender file.
- `File > Export > FBX (.fbx)`
- In the Content Browser in UE4, navigate to the folder you want the mesh to be in.
- Hit `Import` and select the `.fbx` file you created.
- Import it with default settings.
