# case-switch package for Atom editor

Atom editor package to change variable/method names from hyphen- to snake- to camelCase and back again.

# Functionality
There are three ways to convert your selected text.

## Direct conversion
By using the methods below, you let Atom detect what type-case your currectly selected text has. You just have to choose what case you want the text to be.

* `cmd-c cmd-c` switches selected text to camelCase
* `cmd-c cmd-s` switches selected text to snake_case
* `cmd-c cmd-h` switches selected text to hyphen-case

## Toggling through cases
Easily toggle through the cases for a selected text. This is probably the most useful command. *currently the text isn't selected anymore after switchting - this will be fixed soon.*

(Default: `cmd-c cmd-t` on OS X)

## From-to conversion
You can use the following switches to change the case of a selected text.
* hyphen-case to snake_case
* hyphen-case to camelCase
* snake_case to hyphen-case
* snake_case to camelCase
* camelCase to hyphen-case
* camelCase to snake_case

# Roadmap
* fix toggle function loosing selection
* convert multiple selections at once

# Contribution
Feel free to open up a pull request or an issue to request a feature or to report a bug.
