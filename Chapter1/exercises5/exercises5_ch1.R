### p.23 練習問題 ###

### 1 ###
?stat_summary
'> stat_summary(mapping = NULL, data = NULL, geom = "pointrange",
  position = "identity", ..., fun.data = NULL, fun.y = NULL,
  fun.ymax = NULL, fun.ymin = NULL, fun.args = list(), na.rm = FALSE,
  show.legend = NA, inherit.aes = TRUE)'
# デフォルトgeomがpointrangeだと分かる

# 書き直しコード
ggplot(data = diamonds) +
  geom_pointrange(mapping = aes(x=cut, y=depth),
                  stat = "summary",
                  fun.ymin = min,
                  fun.ymax = max,
                  fun.y = median
                  )

### 2 ###
# geom_bar()
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x=cut, y=depth), stat = "identity"
  )

# geom_col()
ggplot(data = diamonds) +
  geom_col(
    mapping = aes(x=cut, y=depth)
  )

### 3 ###
# 今回は省略

### 4 ###
# 1.y: 回帰による予測値
# 2.ymin: 回帰線より下の信頼区間
# 3.ymax: 回帰線より上の信頼区間
# 4.se: 信頼区間を描画するかどうか

### 5 ###
# ダメな例
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x=cut, fill=color, y=..prop..))

# 良い例
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x=cut, y=..prop.., group=1))


