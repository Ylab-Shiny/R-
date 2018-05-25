### p.18 練習問題 ###

### 1 ###
# 折れ線グラフ(2変数)
ggplot(data = mpg, mapping = aes(x=displ, y=hwy)) +
  geom_path()
# 箱ひげ図(2変数)
ggplot(data = mpg, mapping = aes(x=class, y=hwy)) +
  geom_boxplot()
# ヒストグラム(1変数)
ggplot(data = mpg, mapping = aes(x=displ)) +
  geom_histogram(bins = 10) # 階級数10
# 面グラフ(1変数)
ggplot(data = mpg, mapping = aes(x=displ)) +
  geom_area(stat = "bin", bins = 10) # 階級数10

### 2, 4 ###
# geom_smooth(se=F)の場合
ggplot(
  data = mpg,
  mapping = aes(x=displ, y=hwy, color=drv)
) +
  geom_point() +
  geom_smooth(se=F)

# geom_smooth(se=T)の場合
ggplot(
  data = mpg,
  mapping = aes(x=displ, y=hwy, color=drv)
) +
  geom_point() +
  geom_smooth(se=T) # 回帰式の信頼区間を描画

### 3 ###
ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x=displ, y=hwy, color=drv),
    show.legend = T
  )
# show.legend=Fで凡例が消える

### 5 ###
# plot1
ggplot(data = mpg, mapping = aes(x=displ, y=hwy)) +
  geom_point() +
  geom_smooth()

# plot2
ggplot() +
  geom_point(
    data = mpg,
    mapping = aes(x=displ, y=hwy)
  ) +
  geom_smooth(
    data = mpg,
    mapping = aes(x=displ, y=hwy)
  )

# plot1とplot2は同じ図を描く。plot2は変数が2重表現されている

### 6 ###
# plot1
ggplot(data = mpg, mapping = aes(x=displ, y=hwy)) +
  geom_point(stroke=5) +
  geom_smooth()
# plot2
ggplot(data = mpg, mapping = aes(x=displ, y=hwy, group=drv)) +
  geom_point(stroke=5) +
  geom_smooth(se=F)
# plot3
ggplot(data = mpg, mapping = aes(x=displ, y=hwy)) +
  geom_point(mapping = aes(color=drv), stroke=5) +
  geom_smooth(mapping = aes(color=drv), se=F)
# plot4
ggplot(data = mpg, mapping = aes(x=displ, y=hwy)) +
  geom_point(mapping = aes(color=drv), stroke=5) +
  geom_smooth(se=F)
# plot5
ggplot(data = mpg, mapping = aes(x=displ, y=hwy)) +
  geom_point(mapping = aes(color=drv), stroke=5) +
  geom_smooth(mapping = aes(linetype=drv), se=F)
# plot6
ggplot(data = mpg, mapping = aes(x=displ, y=hwy)) +
  geom_point(color="white", size=7) +
  geom_point(mapping = aes(color=drv), size=5)

