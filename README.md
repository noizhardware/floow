# F L O O W
#### F L O O W is a functional time-keeping framework

----
##### A day's 24 hours are divided in three *PHASES*, called "S", "M" and "R"
###### That's for `S`leep `M`iddle `R`elax
* 0000 // 0800 >> **S**
* 0800 // 1600 >> **M**
* 1600 // 2400 >> **R**

##### Each third is an interval from 0 to 1, displayed with two decimal digits
###### Each 0.50 of a **PHASE** marks an important moment of the day, 0.00 are delimiters
~~~~
S:0.50 is 0400
M:0.50 is 120f
R:0.50 is 2000
~~~~
~~~~
S:0.00 is 0000
M:0.00 is 8000
R:0.00 is 1600
~~~~
###### Each **PHASE** equals to 8 hours

* 1 hour is 0.12
* 0.10 is 48min is a **BLOK** (10 in a _PHASE_)
* 0.05 is 24min is **half a BLOK** or **BOX** (20 in a _PHASE_) = 5 **FRAGS**
* 0.01 is 4min48sec is a **FRAG** (100 in a _PHASE_)
* 0.001 is 28.8sec is a **SLIVER** (1000 in a _PHASE_)

- Each **PHASE** has 10x **BLOKS**, or 100x **FRAGS**.
- A day has 30x **BLOKS**. or 300x **FRAGS**.
- 10x **BLOKS** are for sleeping, 20x **BLOKS** are available.
- 100x **FRAGS** are for sleeping. 200x **FRAGS** are available.
---
#### Date:
  * date is in `YYYYmDD` format.
  * `YYYY` is year. Plain 4-digits number.
  * `M` is month, `a` `b` `c` `d` `e` `f` `g` `h` `i` `j` `k` `z`, to keep it visually compact.
    - All letters are written in small caps, `z` is used for December, because `l` can be confused with a `1`
    - The small letter provides a nice visual delimiter between year and day
  * `DD` is day, a "0" is prepended for day numbers < 10.  

  ###### _Examples:_
  ~~~~
  May 18, 2019 is 2019e18
  December 25, 2020 is 2020z25
  October 3, 2123 is 2123j03
  ~~~~

  Quick month table:
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
  * `z` . December
---
old:

---

#### Date:
  * date is in `YYYYMMDD` format.
  * `YYYY` is year. Plain 4-digits number.
  * `MM` is month, January to December: `aa` `bb` `ga` `gb` `gc` `ha` `hb` `hc` `ya` `yb` `yc` `zz`.
    - All letters are written in small caps. This provides for a nice visual delimiter.
  * `DD` is day, a "0" is prepended for day numbers < 10.

  ###### _Examples:_
  ~~~~
  May 18, 2019 is 2019gc18
  December 25, 2020 is 2020zz25
  October 3, 2123 is 2123yb03
  ~~~~

Quick month table:
  * `aa` . January
  * `bb` . February
  * `ga` . March
  * `gb` . April
  * `gc` . May
  * `ha` . June
  * `hb` . July
  * `hc` . August
  * `ya` . September
  * `yb` . October
  * `yc` . November
  * `zz` . December

###### That's why:
  - `ga`  `gb`  `gc`  **Mar Apr May** _Giusto_
  - `ha`  `hb`  `hc`  **Jun Jul Aug** _Hot_
  - `ya`  `yb`  `yc`  **Sep Oct Nov** _Yellow_
  - `zz`  `aa`  `bb`  **Dec Jan Feb** _Winter_
