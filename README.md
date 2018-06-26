roman
=======

[![DUB Package](https://img.shields.io/dub/v/roman.svg)](https://code.dlang.org/packages/roman)
[![codecov](https://codecov.io/gh/Kripth/roman/branch/master/graph/badge.svg)](https://codecov.io/gh/Kripth/roman)
[![Build Status](https://travis-ci.org/Kripth/roman.svg?branch=master)](https://travis-ci.org/Kripth/roman)

Library for roman numbers conversion;

```d
import roman;

assert(fromRoman("MMXVIII") == 2018);
assert(toRoman(2018) == "MMXVIII");
```