# F L O O W
#### F L O O W is a functional time-keeping framework
---
**[Here](https://www.noizhardware.com/tt/ "F L O O W - Watch")** you can find an online `F L O O W`  **watch**, based on your local time.

**[Here](https://www.noizhardware.com/sw/ "F L O O W - Stopwatch")** you can find an online `F L O O W` **stopwatch**.

---
##### A day's 24 hours are divided in three *PHASES*, called "S", "M" and "R"
###### That's for `S`leep `M`iddle `R`elax
* 0000 - 0800 >> `S`
* 0800 - 1600 >> `M`
* 1600 - 2400 >> `R`

##### Each third is an interval from 0 to 1, displayed with two decimal digits
###### Each 0.50 of a `PHASE` marks an important moment of the day, 0.00 are delimiters

`S:0.50` is 0400
`M:0.50` is 1200
`R:0.50` is 2000

`S:0.00` is 0000
`M:0.00` is 8000
`R:0.00` is 1600

###### Each `PHASE` equals to 8 hours

* 1 hour is `0.12`
* `0.10` is 48min is a `BLOK` (10 in a _PHASE_)
* `0.05` is 24min is a `BOX` (20 in a _PHASE_) = 5 `FRAGS`
  - There are 20 `BOX` in each _PHASE_
* `0.01` is 4min48sec is a `FRAG` (100 in a _PHASE_)
* `0.001` is 28.8sec is a `SLIVER` (1000 in a _PHASE_)

- Each `PHASE` has 10x `BLOKS`, or 100x `FRAGS`.
- A day has 30x `BLOKS`. or 300x `FRAGS`.
- 10x `BLOKS` are for sleeping, 20x `BLOKS` are available.
- 100x `FRAGS` are for sleeping. 200x `FRAGS` are available.
* _RECAP:_

| |`PHASE`|`BLOK`|`BOX`|`FRAG`|`SLIVER`|
|:--:|:-----:|:----:|:----:|:------:|:---:|
|_float notation_| **1.0**   | **0.10** | **0.05** | **0.01** | **0.001**
|_per day_| 3x    | 30x  |60x  |300x   | 3000x|
|_per phase_| - | 10x | 20x | 100x | 1000x |
|_equals to_|10`BLOK`|2`BOX`|5`FRAG`| 10x `SLIVER` | - |

---
#### Date:
  * date is in `YYYYmDD` format.
  * `YYYY` is year. Plain 4-digits number.
  * `M` is month, `a` `b` `c` `d` `e` `f` `g` `h` `i` `j` `k` `z`, to keep it visually compact.
    - All letters are written in small caps, `w` is used for December, because `l` can be confused with a `1`, `w` also turned out to be the best choice for IRL handwriting.
    - The small letter provides a nice visual delimiter between year and day
  * `DD` is day, a "0" is prepended for day numbers < 10.  

  ###### _Examples:_
  ~~~~
  May 18, 2019 is 2019e18
  December 25, 2020 is 2020z25
  October 3, 2123 is 2123j03
  ~~~~

  Quick month reference:
  * `a` . January
  * `b` . February
  * `c` . March
  * `d` . April
  * `e` . May
  * `f` . June
  * `g` . July
  * `h` . August
  * `i` . September
  * `j` . October
  * `k` . November
  * `w` . December
---
_EOF._
