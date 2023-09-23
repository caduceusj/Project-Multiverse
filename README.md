# Ez Transitions
The Godot Plugin "EzTransitions" official repository.

# Description
"EzTransitions" is a versatile Godot engine plugin designed to streamline and manage all game transitions seamlessly. With its user-friendly features, it simplifies the process of creating smooth and immersive transitions in both 3D and 2D games. This plugin is ideal for implementing straightforward transitions, such as fades, slides, and dissolves, enhancing the overall player experience with minimal effort.
Please note that while "EzTransitions" excels at simplifying transition effects, it is not recommended for highly complex transitions.

![Plugin](https://github.com/LucasBr003/ez-transitions/assets/94023123/9e7e1900-30a8-4894-b5f2-aac0cf38978c)
![Code](https://github.com/LucasBr003/ez-transitions/assets/94023123/7426ff12-6720-475a-89b9-b3045912e003)


# How to use the "EzTransitions" Plugin.

### 1. Accessing the Plugin:
+ After installing the "EzTransitions" plugin in your Godot project, you'll notice a new tab at the top of the Godot interface labeled "EzTransitions."

### 2. Opening the Transition Editor:
+ Click on the "EzTransitions" tab to access the plugin's features. Within this tab, you'll find the "Transition Editor."

### 3. Editing a Transition:
+ To create or modify a transition, start by opening the "Transition Editor."
+ Inside the editor, you'll find various checkboxes, sliders, and options that allow you to customize your transition effect.
+ Experiment with different settings, such as fade, slide, or dissolve effects, by toggling checkboxes and adjusting sliders to achieve your desired visual transition.

### 4. Previewing the Transition:
+ To see how your transition will look in real-time, simply click the "Preview Transition" button within the editor.
+ This feature allows you to fine-tune your transition effect until you are satisfied with the result.

### 5. Copying the Transition Code:
+ Once you have perfected your transition effect, you can easily generate the necessary code by clicking the "Copy Code" button.
+ The copied code snippet will encapsulate your chosen transition settings.

### 6. Using the Copied Code:
+ Paste the copied code snippet directly into a GD Script within your game project where you want the transition to occur.
+ When the code is executed in your game, the transition effect you designed in the "EzTransitions" editor will take place seamlessly.

# Extra Functions & Features
## Nodes
### TransitionOverlay: ![transition_overlay_node_icon](https://github.com/LucasBr003/ez-transitions/assets/94023123/17a6c345-2af3-4bb1-bf88-52b284bb2cfb)
+ The TransitionOverlay extends a TextureRect and handles the visual aspect of a transition.
+ To initiate a transition, you should call the "play_intro()" function of the TransitionOverlay node.
+ To conclude the transition, use the "play_outro()" function.
+ You can customize the transition's properties in the Inspector while the TransitionOverlay node is selected, allowing you to tailor the visual effect to your specific needs.

## Functions
### EzTransitions.plugin_toggle_debug_mode(enabled: bool) -> void:
+ This function toggles the debug mode of the plugin, allowing you to enable or disable debug messages in the engine's output.
+ When enabled, the plugin will provide debugging information to help you track and diagnose any issues during development.

### EzTransitions.plugin_toggle_transitions(enabled: bool) -> void:
+ This function enables or disables transitions in general.
+ When transitions are disabled, any scene changes will occur instantly without transition effects.
+ Enabling transitions restores the visual transition effects configured using the plugin.

### EzTransitions.plugin_set_speed_scale(new_speed_scale: float) -> void:
+ Use this function to adjust the speed at which transitions occur.
+ By providing a `new_speed_scale` value, you can control the rate at which transition effects, such as fades or slides, take place.
+ Lower values slow down the transitions, while higher values speed them up, allowing you to fine-tune the timing of your game's visual effects.

Note that all the functions listed above are an alternative way to change the basic settings of the plugin, since they can be changed in the new tab called "EzTransitions".
These functions can be used to create an in-game transition editor, allowing the players to customize their experience even further.

![image](https://github.com/LucasBr003/ez-transitions/assets/94023123/d4dea66e-81e7-4895-8d28-9ee8824c1e77)
