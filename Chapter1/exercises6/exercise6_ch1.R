### 第1章 p.27 練習問題 ###
### 1 ###
# 改善前
ggplot(data = mpg, mapping = aes(x=cty, y=hwy)) +
  geom_point()
# 観測点の多くが重複しているので、データ数が少なく感じる

# 改善後
ggplot(data = mpg, mapping = aes(x=cty, y=hwy)) +
  geom_jitter()
# わずかなランダムノイズを追加した

### 2 ###
# widthとheight

### 3 ###
# geom_countは重複部の点が大きく描画される
ggplot(data = mpg, mapping = aes(x=cty, y=hwy)) +
  geom_count()

### 4 ###
?geom_boxplot
'geom_boxplot(mapping = NULL, data = NULL, stat = "boxplot",
  position = "dodge", ..., outlier.colour = NULL, outlier.color = NULL,
  outlier.fill = NULL, outlier.shape = 19, outlier.size = 1.5,
  outlier.stroke = 0.5, outlier.alpha = NULL, notch = FALSE,
  notchwidth = 0.5, varwidth = FALSE, na.rm = FALSE, show.legend = NA,
  inherit.aes = TRUE)'
# デフォルトの位置調整はposition_dodge()だと分かる

# mpgデータセットの可視化
ggplot(data = mpg, mapping = aes(x=class, y=hwy, color=drv)) +
  geom_boxplot(position = "dodge")
