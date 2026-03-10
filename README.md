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

## Visualisations  

### Interaction Plot  
`plots/interaction_plot.png`

### Assumption Checks  
- `plots/qqplot.png`  
- `plots/scalelocation.png`

---

## Interpretation  
The results support cue‑integration models of emotion perception.  
Facial expression was the dominant cue, but colour shaped ratings when the expression was ambiguous.  
Neutral faces were judged less happy on red backgrounds and slightly happier on yellow backgrounds, showing that contextual cues influence emotional interpretation when the facial signal is weak.

---

## Files  
- **analysis.R** — full R script  
- **raw_data.csv** — unedited Gorilla export  
- **interaction_plot.png** — visualisation of the interaction  
- **qqplot.png / scalelocation.png** — assumption checks  
- **prereg_form_redacted.pdf** — pre‑registration  
- **Colour_Expression_Report.pdf** — full report  
- **LICENSE** — MIT License  
- **.gitignore** — repository housekeeping  

---

## Author  
Mina Adjbishe  
London/ Nottingham, UK  
2026
