# ��Ɗ��̃��Z�b�g
remove(list = ls(all = TRUE))


# ��{�v�Z�̎��{ -----------------------------------------------------------------

# �������v�Z
1 + 2
sqrt(2)

# �x�N�g��
c(1, 2, 3) + c(2, 3, 4)
c(1, 2, 3) * c(2, 3, 4)
sqrt(c(1, 2, 3))

# ���
vec_1 <- c(1, 2, 3)
vec_2 <- c(2, 3, 4)

vec_1 + vec_2
vec_1 * vec_2
sqrt(vec1)

# �^
charvec <- c("a", "b", "c")
charvec

vec1 + charvec

class(vec1)
class(charvec)


# �f�[�^��ǂݍ���ŏ��� -------------------------------------------------------------

# ��Ɗ��̃��Z�b�g
remove(list = ls(all = TRUE))

# �p�b�P�[�W�̃C���X�g�[��
install.packages("tidyverse")

# �p�b�P�[�W�̓ǂݍ���
library(tidyverse)

# �f�[�^�̓ǂݍ���
df_0 <- read_csv("ch2.csv",
  locale = locale(encoding = "cp932")
)

# �f�[�^�̕\��
df_0

# ���L4�͂��ׂē�������
df_0[, c(1:4, 6)]
df_0[, c("�����R�[�h", "��Ж�", "�D��s��", "�Ǝ�", "���㍂")]
select(df_0, �����R�[�h, ��Ж�, �D��s��, �Ǝ�, ���㍂)
df_0 %>% 
  select(�����R�[�h, ��Ж�, �D��s��, �Ǝ�, ���㍂)

# �K�v�ȗ���c���āA�񖼂��p��\�L�ɂ���
df_1 <- df_0 %>%
  select(
    �����R�[�h,
    ��Ж�,
    �Ǝ�,
    ���Z��,
    ���㍂,
    ���㌴��,
    �̊ǔ�
  ) %>%
  rename(
    id    = �����R�[�h,
    name  = ��Ж�,
    ind   = �Ǝ�,
    fm    = ���Z��,
    sales = ���㍂,
    cogs  = ���㌴��,
    sga   = �̊ǔ�
  )

# �ォ��6�s�ڂ܂Ŋm�F
head(df_1)

# �f�[�^�̏����o��
write_csv(df_1, "ch2_new.csv")
