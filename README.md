# Addition-to-TT-Selection-Toys

[![license](https://img.shields.io/github/license/6Tom/Addition-to-TT-Selection-Toys?color=blue)](./LICENSE)

This is a small addition to the SketchUp extension "[TT Selection Toys](https://github.com/thomthom/SelectionTools)" which was created by [Thomas Thomassen](https://github.com/thomthom).

## Features

Its function is to add a feature: Batch convert "group copies" to components.

What I did was just add an "until loop" to the original code to achieve batch conversion.

All the credit and contributions come from [Thomas Thomassen](https://github.com/thomthom).

## Usage

You need to download the original extension from one of the following websites and install it to SketchUp:
- https://extensions.sketchup.com/extension/c9266b2c-0b55-4d21-a0a4-72e23b8a0fb4/selection-toys
- https://sketchucation.com/plugin/738-tt_selection_toys
- https://github.com/thomthom/SelectionTools

Close SketchUp. Then you can copy "[tt_selection_toys_batch_convert_group_copies_to_components.rb](./tt_selection_toys_batch_convert_group_copies_to_components.rb)" to `%appdata%\SketchUp\SketchUp 2020\SketchUp\Plugins\`.

(Perhaps your version is not `SketchUp 2020`, just change it to your version.)

The next time you start SketchUp, you will find "Group to Component" in "Extension" menu. Select some groups and execute it.

## License

The [original project](https://github.com/thomthom/SelectionTools) does not specify an open source license.

I temporarily specify that this script is licensed under the [GNU GPL v2 license](./LICENSE).

I haven't asked [Thomas Thomassen](https://github.com/thomthom) yet, there may be changes in the future.

Currently, feel free to redistribute or modify this script under the [GNU GPL v2 license](./LICENSE).

## Changelog

- **v1.0.0** (2023-05-20)
    - First release

## About Me

[6Tom](https://github.com/6Tom)

I am a practitioner in the field of architectural design, not a programmer. 

I have a hobby of "programming". A little programming foundation. These codes were created by me with a bit of self-study.

Perhaps not good enough. But my abilities are limited. If there are constructive suggestions, please feel free to put them forward.
