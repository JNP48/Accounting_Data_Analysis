# ��Ɗ��̃��Z�b�g
remove(list = ls(all = TRUE))


# ����_�@ -------------------------------------------------------------------------

# �ϓ���̌v�Z
vr <- (23.2 - 16.0) / (700 - 300)
vr

# �ō��̉c�Ǝ��̕ϓ���
vc <- vr * 700
vc

# �Œ��̌v�Z
fc <- 23.2 - vc
fc


# CVP���� -------------------------------------------------------------------

# ��Ɗ��̃��Z�b�g
remove(list = ls(all = TRUE))

# �p�b�P�[�W�̓ǂݍ���
library(tidyverse)

# �����ƃf�[�^�̓ǂݍ���
df_retail <- read_csv("ch6_retail.csv",
  na = c("-"),
  locale = locale(encoding = "cp932")
) %>%
  select(
    ���㍂,
    �̊ǔ�
  ) %>%
  rename(
    sales = ���㍂,
    cost  = �̊ǔ�
  )

# �S�|�ƃf�[�^�̓ǂݍ���
df_steel <- read_csv("ch6_steel.csv",
  na = c("-"),
  locale = locale(encoding = "cp932")
) %>%
  select(
    ���㍂,
    �̊ǔ�
  ) %>%
  rename(
    sales = ���㍂,
    cost  = �̊ǔ�
  )

# NA�̏���
df_retail <- df_retail %>%
  drop_na()

# �����Ƃ̎U�z�}
g <- df_retail %>%
  ggplot(aes(x = sales, y = cost)) +
  geom_point() +
  stat_smooth(method = "lm")
g

# �S�|�Ƃ̎U�z�}
g <- df_steel %>%
  ggplot(aes(x = sales, y = cost)) +
  geom_point() +
  stat_smooth(method = "lm")
g

# ���10���̒l����肷��
df_retail %>%
  summarise(
    sales_90 = quantile(sales, 0.90),
    cost_90  = quantile(cost, 0.90)
  )

df_steel %>%
  summarise(
    sales_90 = quantile(sales, 0.90),
    cost_90  = quantile(cost, 0.90)
  )

# ���10���ȏ�̊ϑ��l�����O����
df_retail <- df_retail %>%
  filter(
    sales < 318045,
    cost  < 99395
  )

df_steel <- df_steel %>%
  filter(
    sales < 257315,
    cost  < 23983
  )

# �����Ƃ̎U�z�}
g <- df_retail %>%
  ggplot(aes(x = sales, y = cost)) +
  geom_point() +
  stat_smooth(method = "lm")
g

# �S�|�Ƃ̎U�z�}
g <- df_steel %>%
  ggplot(aes(x = sales, y = cost)) +
  geom_point() +
  stat_smooth(method = "lm")
g

# SHIFT-JIS�ɂ���ƃ`���_��?�ɂȂ��Ă��܂��i��チ���j
# �����Ƃ�CVP����
lm_retail <- lm(cost ? sales, data = df_retail)
summary(lm_retail)

# �S�|�Ƃ�CVP����
lm_steel <- lm(cost ? sales, data = df_steel)
summary(lm_steel)
