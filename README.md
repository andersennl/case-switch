# case-switch package for Atom editor

Atom editor package to change variable/method names from hyphen- to snake- to camelCase and back again.

# Functionality
There are three ways to convert your selected text.

## Direct conversion
You can let Atom decide on what case you've selected and just say what you want to have in the end.
`cmd-c cmd-c` switch to camelCase
`cmd-c cmd-s` switch to snake_case
`cmd-c cmd-h` switch to hyphen-case

## From-to conversion
You can use (and bind) the following switches to directly change the case of a selected text.
* hyphen-case to snake_case
* hyphen-case to camelCase
* snake_case to hyphen-case
* snake_case to camelCase
* camelCase to hyphen-case
* camelCase to snake_case

## Toggling through cases
You can toggle through the cases for a selected text.
(Default: `cmd-c cmd-t` on OS X)

# Roadmap
* convert multiple selections at once

# Contribution
Feel free to open up a pull request or an issue to request a feature or to report a bug.
