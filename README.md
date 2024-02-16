# Pause For Input

This is a refactor of the "Pause When Crafting" mod. The original mod had some issues around pausing breaking in newer versions of the game, and it also didn't cover other instances in which input caused issues or broken certain game processes. 

This refactor aims to fix those issues and expand the functionality to cover more cases. Any time input is active in any SkyUI menu, the game will be paused. This includes crafting, enchanting, alchemy, Inventory, Bartering, and any other menu that has the option to input text.

Currently the key to enter SkyUI's search is hard set to the space bar. I have plans to update this to use what ever key the user has set to open the search in SkyUI, but that will come in a later update.