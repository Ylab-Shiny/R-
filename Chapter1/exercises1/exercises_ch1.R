### p.6 練習問題 ###

# パッケージの読み込み
library(tidyverse)

### 1 ###
ggplot(data = mpg)
# geom_functionを指定していないため、描画デバイスが表示されるだけ

### 2 ###
dim(mtcars) # dim関数で行数と列数の確認
# >[1] 32 11

### 3 ###
?mpg
# drv  f = front-wheel drive, r = rear wheel drive, 4 = 4wd
# fは前輪駆動、rは後輪駆動、4は四輪駆動車を示す

### 4 ###
ggplot(data = mpg) +
  geom_point(mapping = aes(x=cyl, y=hwy))
# シリンダーの個数に対するガロンあたりのマイルの散布図

### 5 ###
ggplot(data = mpg) +
  geom_point(mapping = aes(x=class, y=drv))
# 2種類とも非定量変数であるので、相関関係が分からない


