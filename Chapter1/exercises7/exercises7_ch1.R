### 第1章 p.29 練習問題 ###
### 1 ###
# 積み上げ棒グラフ
ggplot(data = mpg, mapping = aes(x=factor(1), fill=class)) +
  geom_bar(width = 1)

# 円グラフに変換
ggplot(data = mpg, mapping = aes(x=factor(1), fill=class)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")

### 2 ###
?labs
# labs()はグラフにラベルを追加する

### 3 ###
library(maps)
nz <- map_data("nz")

# coord_quickmap()
ggplot(nz, aes(long, lat, group=group)) +
  geom_polygon(fill="white", color="black") +
  coord_quickmap()

# coord_map()
ggplot(nz, aes(long, lat, group=group)) +
  geom_polygon(fill="white", color="black") +
  coord_map()

### 4 ###
# coord_fixed()無し
ggplot(data = mpg, mapping = aes(x=cty, y=hwy)) +
  geom_point() +
  geom_abline()

# coord_fixed()あり
ggplot(data = mpg, mapping = aes(x=cty, y=hwy)) +
  geom_point() +
  geom_abline() +
  coord_fixed()

# geom_abline()はデフォルトで勾配1の直線を描く
# coord_fixed()を使うことで、x軸とy軸の直接比較ができる

