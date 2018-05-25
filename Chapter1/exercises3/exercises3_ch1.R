### p.13 練習問題 ###

### 1 ###
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy)) +
  facet_wrap(~displ)
# 連続変数(displ)でファセットを作った場合

### 2 ###
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy)) +
  facet_grid(drv~cyl)
# シリンダー数5の四輪駆動車・シリンダー数4または5の後輪駆動車のデータが存在しないことが分かる

### 3 ###
# plot1
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy)) +
  facet_grid(drv~.)
# 行の次元(drv)だけのファセットを作る

# plot2
ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y=hwy)) +
  facet_grid(.~cyl)
# 列の次元(cyl)だけのファセットを作る

### 4 ###
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy)) +
  facet_wrap(~class, nrow = 2)
# 長所:カテゴリごとのデータ分布を確認できる

### 5 ###
?facet_wrap
# > nrow, ncol	Number of rows and columns.
# 描画デバイスにおいて、nrowで行数・ncolで列数を指定できる

### 6 ###
# レベルの多い変数(trans)を列とした場合
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy)) +
  facet_grid(trans~drv)

# レベルの多い変数(trans)を行とした場合
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy)) +
  facet_grid(drv~trans)
