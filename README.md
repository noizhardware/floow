jul# F L O O W
#### Functional time-keeping framework

----
##### The 24 hours are divided in three *PHASES*, called "S", "M" and "R"
###### That's for **S**leep **M**iddle **R**elax
* 0000 // 0800 >> **S**
* 0800 // 1600 >> **M**
* 1600 // 2400 >> **R**

##### Each third is an interval from 0 to 1, displayed with two decimal digits
###### Each 0.50 of a **PHASE** marks an important moment of the day, 0.00 are the separators
~~~~
S:0.50 is 0400
M+0.50 is 1200
R+0.50 is 2000
~~~~
~~~~
S:0.00 is 0000
M:0.00 is 8000
R:0.00 is 1600
~~~~
###### Each **PHASE** is 8 hours

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
####Date:
  * date is in `YYYYMDD` format.
  * `YY` is year.
  * `M` is month, a-b-c-d-e-f-g-h-i-j-k-l, to keep it visually compact.
    - All letters are written in small caps, except for the `L`, to avoid confusion with the number "1"
  * `D` is day, a "0" is prepended for days < 10.
  ~~~~
  May 18, 2019 is 2019e18
  December 25, 2020 is 2020L25
  October 3, 2123 is 2023j03
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
  * `L` . December

#####ALT:
  * ca cc cc jan feb mar  `Cold`
  * ga gb gc  apr may jun `Giusto`
  * ha hb hc  jul aug sep `Hot`
  * wa wb wc  oct nov dic `Winter`

    - ga gb gc  mar apr may
    - ha hb hc  jun jul aug
    - ya yb yc  sep oct nov
    - wa aa bb  dec jan feb




2019gb18
