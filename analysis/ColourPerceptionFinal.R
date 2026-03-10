# ------------------------------------------------------------------------------
# Title: How Facial Expression and Colour Cues Shape Perceptions of Happiness
# Author: Mina Adjbishe
# Date: 26 February 2026
# Description: Data cleaning, preparation, and analysis script for report.

# ----------------------------- Install Packages ------------------------------
install.packages("pwr")
install.packages("psyntur")
install.packages("tidyverse")
install.packages("janitor")
install.packages("afex")
install.packages("emmeans")
install.packages("effectsize")
install.packages("psych")
install.packages("ggplot2")

# ------------------------------ Load Libraries -------------------------------
library(psych)
library(pwr)
library(psyntur)
library(tidyverse)
library(janitor)
library(afex)
library(emmeans)
library(effectsize)
library(ggplot2)

# =============================================================================
#                               DEMOGRAPHICS
# =============================================================================

# --------------------------- Import & Clean Data -----------------------------
demo <- read.csv("Downloads/demo_data.csv") %>%
  clean_names()

view(demo)

# --------------------------- Wrangling Demographics ---------------------------
df_data <- demo %>%
  slice(-1) %>% 
  filter(event_index != "END OF FILE")

glimpse(df_data)

# Filter for age, gender and colour blindness rows
df_demo <- df_data %>%
  filter(grepl("age|gender|colour blindness", question, ignore.case = TRUE),
         key == "value") %>%
  select(participant_private_id, question, response) %>%
  pivot_wider(names_from = question, values_from = response) %>%
  rename(
    id = 1,
    age = 2,
    gender = 3,
    colour_question = 4
  ) %>%
  mutate(age = as.numeric(age))

glimpse(df_demo)

# --------------------------- Descriptive Statistics ---------------------------
# Claculate the mean and SD for age
describe_across(
  data = df_demo,
  variables = age,
  functions = list(
    avg = mean, stdev = sd, min_age = min,
    max_age = max, med = median, iqr = IQR
  ),
  pivot = TRUE
)

describeBy(df_demo$age, group = df_demo$gender)

#Boxplot
tukeyboxplot(data = df_demo, age)

# Boxplot presentable (ggplot)
ggplot(df_demo, aes(x = gender, y = age)) +
  geom_boxplot(width = 0.5, fill = "grey80", colour = "black") +
  geom_jitter(width = 0.1, alpha = 0.4) +
  labs(x = "Gender", y = "Age (years)") +
  theme_classic() +
  theme(axis.title = element_text(face = "bold"))

df_demo %>% count(gender)

# --------------------------- Power Analysis ----------------------------------
pwr.f2.test(u = 1, f2 = .15, power = .80, sig.level = .05)

# =============================================================================
#                               TASK DATA
# =============================================================================

# --------------------------- Import & Clean Task Data -------------------------
task_data <- read.csv("Downloads/task_data.csv")

df_task <- task_data %>%
  clean_names()

#select the variables that is needed for analysis and rename
df_selected <- df_task %>%
  select(participant_private_id, response_type, response,
         spreadsheet_iv1, spreadsheet_iv2) %>%
  rename(
    id = participant_private_id,
    colour = spreadsheet_iv1,
    smile = spreadsheet_iv2
  )

df_filtered <- df_selected %>%
  filter(response_type == "response")

df_filtered$response <- as.numeric(df_filtered$response)

df_clean <- drop_na(df_filtered)

# --------------------------- Collapse to Means -------------------------------
df_final <- df_clean %>%
  group_by(id, colour, smile) %>%
  describe(score = mean(response))

view(df_final)

# =============================================================================
#                           ASSUMPTION CHECKS
# =============================================================================

model_assum <- lm(score ~ colour * smile, data = df_final)

# Homoscedasticity
plot(model_assum, which = 3)

# Normality of residuals
plot(model_assum, which = 2)

summary(model_assum)

# =============================================================================
#                           REPEATED-MEASURES ANOVA
# =============================================================================

m_within <- aov_car(
  score ~ colour * smile + Error(id / (colour * smile)),
  data = df_final
)

summary(m_within)

# =============================================================================
#                           INTERACTION PLOTS
# =============================================================================

df_final$colour <- factor(df_final$colour)

emmip(m_within, colour ~ smile, CIs = TRUE) +
  labs(x = "smile", y = "score") +
  scale_colour_manual(values = c("Red" = "red", "Yellow" = "gold"))

# =============================================================================
#                           ESTIMATED MARGINAL MEANS
# =============================================================================

emmeans(m_within, ~ colour)
emmeans(m_within, ~ smile)

pairs(emmeans(m_within, ~ colour | smile), adjust = "bonferroni")
pairs(emmeans(m_within, ~ smile | colour), adjust = "bonferroni")

# =============================================================================
#                               EFFECT SIZES
# =============================================================================

eta_squared(
  m_within,
  generalized = TRUE,
  alternative = "two.sided"
)
