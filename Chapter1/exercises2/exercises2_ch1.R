### p.11 練習問題 ###

### 1 ###
# 修正前
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x=displ, y=hwy, color="blue")
  )
# 修正後
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x=displ, y=hwy, shape=class), color="blue"
  )
### 2 ###
# manufacturer カテゴリ変数
# model カテゴリ変数
# displ 連続変数
# year カテゴリ変数
# cyl カテゴリ変数
# trans カテゴリ変数
# drv カテゴリ変数
# cty 連続変数
# hwy 連続変数
# fl カテゴリ変数
# class カテゴリ変数

mpg
'# A tibble: 234 x 11
manufacturer model      displ  year   cyl trans      drv     cty   hwy fl    class  
<chr>        <chr>      <dbl> <int> <int> <chr>      <chr> <int> <int> <chr> <chr>  
  1 audi         a4          1.80  1999     4 auto(l5)   f        18    29 p     compact
2 audi         a4          1.80  1999     4 manual(m5) f        21    29 p     compact
3 audi         a4          2.00  2008     4 manual(m6) f        20    31 p     compact
4 audi         a4          2.00  2008     4 auto(av)   f        21    30 p     compact
5 audi         a4          2.80  1999     6 auto(l5)   f        16    26 p     compact
6 audi         a4          2.80  1999     6 manual(m5) f        18    26 p     compact
7 audi         a4          3.10  2008     6 auto(av)   f        18    27 p     compact
8 audi         a4 quattro  1.80  1999     4 manual(m5) 4        18    26 p     compact
9 audi         a4 quattro  1.80  1999     4 auto(l5)   4        16    25 p     compact
10 audi         a4 quattro  2.00  2008     4 manual(m6) 4        20    28 p     compact
# ... with 224 more rows'

### 3 ###
# color
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x=displ, y=hwy, color=hwy)
  )
# > 色がグラデーションで表される

# size
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x=displ, y=hwy, size=hwy)
  )
# > sizeが段階で変化する 

# shape
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x=displ, y=hwy, shape=hwy)
  )
# > Error: A continuous variable can not be mapped to shape

### 4 ###
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=displ))
# 相関係数が1となるので、直線上に点が散布される

### 5 ###
# stroke=1
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x=displ, y=hwy), shape=1, stroke=1
  )

# stroke=5
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x=displ, y=hwy), shape=1, stroke=5
  )

### 6 ###
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x=displ, y=hwy, color=displ<5)
  )
# TrueとFalseの領域で色が分けられる