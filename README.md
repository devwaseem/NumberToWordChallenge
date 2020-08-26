# NumberToWordChallenge

This project was made to solve doodleblue's system task.

## Question:

```
Print the any number as human readable format

Example: 

Input - 1, Output - One

Input - 11. Output - Eleven

Input - 111, Output - One hundred eleven

Input - 1111, Output - One thousand one hundred eleven

Note - Don't use a custom library, and native properties
```

I re-implemented the Apple's NumberFormatter Spellout style using swift. [Documentation Source](https://developer.apple.com/documentation/foundation/numberformatter/style/spellout#:~:text=NumberFormatter.-,Style.,by%20the%20number%20formatter%20locale.)

![App preview](https://raw.githubusercontent.com/devwaseem/NumberToWordChallenge/master/app.gif)

The code is available in [Utilities/NumberToWordFormatter.swift](https://github.com/devwaseem/NumberToWordChallenge/blob/master/NumberToWordChallenge/Utilities/NumberToWordFormatter.swift) file.

To play with the code in playground goto [numbertoword.playground](https://github.com/devwaseem/NumberToWordChallenge/tree/master/numbertoword.playground)

## Tests

To run UI and Unit Tests press `CMD + U` in xcode.
