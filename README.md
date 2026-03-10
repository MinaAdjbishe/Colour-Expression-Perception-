# 🎨 Colour × Facial Expression Perception Study (R)

## Overview  
This repository contains the R analysis for a repeated‑measures experiment investigating how **background colour** (red vs. yellow) and **facial expression** (open‑mouth smile vs. neutral)** influence perceived happiness**.  
Participants rated faces on a 0–100 scale, and a 2 × 2 repeated‑measures ANOVA was used to test main effects and interactions.

---

## Methods  
- **Design:** 2 × 2 within‑subjects  
- **IVs:**  
  - Facial expression (open‑mouth vs. neutral)  
  - Background colour (yellow vs. red)  
- **DV:** Happiness rating (0–100 slider)  
- **Participants:** 52 after exclusions  
- **Task:** Participants viewed faces and rated how happy they appeared  
- **Analysis:** Repeated‑measures ANOVA with simple‑effects follow‑ups  

---

## Key Findings  
- **Expression main effect:**  
  Open‑mouth smiles were rated *much* happier than neutral expressions.

- **Colour main effect:**  
  Yellow backgrounds produced slightly higher happiness ratings than red.

- **Interaction:**  
  Colour influenced ratings more strongly for **neutral expressions**, showing that contextual cues matter most when the facial signal is ambiguous.

---

## 📈 Visualisations

This study produced several visualisations to support the statistical analysis.  
All plots are available in the repository and can be viewed or downloaded directly.

### **Interaction Plot**
Shows how background colour modifies the effect of facial expression on happiness ratings.  
![Interaction Plot](interaction_plot.png)

### **Q–Q Plot (Normality Check)**
Assesses whether residuals follow a normal distribution.  
![Q-Q Plot](qqplot.png)

### **Scale–Location Plot (Homoscedasticity Check)**
Evaluates whether residuals have equal variance across fitted values.  
![Scale-Location Plot](scalelocation.png)

### **Age × Gender Boxplot**
Visualises demographic age distribution across gender groups.  
![Age-Gender Boxplot](age_gender_boxplot.png)

These visualisations support the assumption checks and help illustrate the interaction between colour and facial expression.


---

## R
I used R to clean and prepare both demographic and task data, converting variables, removing invalid responses, and collapsing trials into condition means.  
I checked ANOVA assumptions, then ran a 2 × 2 repeated‑measures ANOVA with follow‑up simple‑effects tests and effect sizes.  
I generated visualisations including an interaction plot and diagnostic plots to support interpretation of the results.

---

## Interpretation  
The results support cue‑integration models of emotion perception.  
Facial expression was the dominant cue, but colour shaped ratings when the expression was ambiguous.  
Neutral faces were judged less happy on red backgrounds and slightly happier on yellow backgrounds, showing that contextual cues influence emotional interpretation when the facial signal is weak.

---

## Files
- [analysis.R](analysis.R) — full R script containing data cleaning, scoring, visualisations, and mediation analysis  
- [Colour_Expression_Report.pdf](Colour_Expressions_Report.pdf) — full written report  
- [plots/](plots/) — folder containing all exported visualisations (scatterplots, mediation diagram, boxplots, bar charts)
- [.gitignore](.gitignore) — keeps the repo clean  
- [LICENSE](LICENSE) — project license  


## Author
Mina Adjbishe  
BSc Psychology with Counselling  
