# Pre-work - *TipCalculator*

**Tip Calculator** is a tip calculator application for iOS.

Submitted by: **Junhong Pan (Paul)**

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [x] Settings page to change the default tip percentage.
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators. (Can change type of currency in settings screen)
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing. ()

The following **additional** features are implemented:

- [x] Choose color scheme of app from 5 different colors.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='ezgif-1-5af3231f5eb6.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [ezgif](https://ezgif.com/video-to-gif).

## Notes

Getting the currency to update in the main view apart from the setting page is somewhat difficult since the states of the tip amount and currency need to be shared between different views. I managed to solve it by creating a struct that is passed in to each of the sub-views when creating the app, having the main contentview encompass both the settings and main view.

Spacing the app correctly for multiple device sizes is difficult, I had to make sure the ratios of the boxes are correct so the tips and settings are displayed reasonably on different devices.

## License

    Copyright [2020] [Junhong Pan (Paul)]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
