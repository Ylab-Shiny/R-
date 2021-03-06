# loading
library(tidyverse)

tidy4a <- table4a %>% gather(`1999`, `2000`, key = "year", value = "cases")
tidy4b <- table4b %>% gather(`1999`, `2000`, key = "year", value = "population")
ljoin <- left_join(tidy4a, tidy4b)

spread(table2, key = type, value = count)

table3 %>% separate(rate, into = c("cases", "population"), sep = "/")
table3 %>% separate(year, into = c("century", "year"), sep = 2)

table5 %>% unite(new, century, year)
table5 %>% unite(new, century, year, sep = "")

stocks <- tibble(
  year = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr = c(1, 2, 3, 4, 2, 3, 4),
  return = c(1.88, 0.59, 0.35, NA, 0.92, 0.17, 2.66)
)
stocks %>% complete(year, qtr)
stocks %>% fill(return)

View(who)
who1 <- who %>% 
  gather(
    new_sp_m014:newrel_f65, key = "key",
    value = "cases", na.rm = T
  )
who2 <- who1 %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))
who3 <- who2 %>% separate(key, c("new", "type", "sexage"), sep = "_")
who3 %>% count(new)
who4 <- who3 %>% select(-new, -iso2, iso3)
who5 <- who4 %>% separate(sexage, c("sex", "age"), sep = 1)

# まとめ
who %>% gather(code, value, new_sp_m014:newrel_f65, na.rm = T) %>% 
  mutate(
    code = stringr::str_replace(code, "newrel", "new_rel")
  ) %>% 
  separate(code, c("new", "type", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1) %>% View()
