# Power BI Lab: Advanced DAX & Dynamic SVG Visualizations

[![Power BI](https://img.shields.io/badge/Power_BI-Developer_Mode_(PBIP)-F2C811?logo=powerbi&logoColor=black)](#)
[![DAX](https://img.shields.io/badge/DAX-SVG_Data_URIs-blue)](#)
[![Architecture](https://img.shields.io/badge/Architecture-TMDL_Semantic_Model-green)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Power BI portfolio laboratory featuring custom data visualizations generated entirely in DAX as dynamic SVG Data URIs, automated CET/CEST time-zone conversions, and developer-mode project structure (PBIP).

---

## 🚀 Live Interactive Reports

| Report | Description | Live Link |
| :--- | :--- | :--- |
| **Professional Profile** | Single-script CV report rendered via custom SVG measures with Base64 asset embedding. | [Open in Power BI](https://app.powerbi.com/view?r=eyJrIjoiYTJlZWUxYTUtOGQxNS00ODU3LWIxNjktYzIxMDY3ZGIwZWM5IiwidCI6Ijc2NGY3ZmY0LTY2OWQtNDAwYi1iMDY0LTM4NTAyNDAxMTNiYiIsImMiOjl9) |
| **Workday Monitor** | Real-time workday tracker featuring schedule status, time elapsed/remaining, and automated CET/CEST offset logic. | [Open in Power BI](https://app.powerbi.com/view?r=eyJrIjoiMjU1NjRiMDktZDVkYS00MWU5LWJmZjYtNTRhM2EzNGUzMjJiIiwidCI6Ijc2NGY3ZmY0LTY2OWQtNDAwYi1iMDY0LTM4NTAyNDAxMTNiYiIsImMiOjl9) |

---

## 🛠️ Technical Highlights

* **Pure DAX SVG Generation:** Visual layouts, circular photo frames, dynamic status bars, and UI elements constructed completely within DAX measures and returned as Image URL data URIs.
* **Self-Contained Profile Report:** Entire layout and profile imagery are encapsulated within model measures (Base64 JPEG), requiring zero external image hosting.
* **Deterministic Time-Zone Engine:** Pure DAX implementation of Europe/Warsaw daylight saving time transitions (calculating the last Sunday of March and October) based on UTCNOW().
* **Coordinated Theme System:** Synchronized light and dark visual palettes engineered with Microsoft Fabric design tokens.
* **Modern Developer Lifecycle:** Stored natively in Power BI Project (PBIP) format, enabling granular source control over report layouts and semantic models.

---

## 📂 Repository Structure

power-bi-lab/
├── Professional Profile.Report/
├── Professional Profile.SemanticModel/
├── Workday Monitor.Report/
├── Workday Monitor.SemanticModel/
├── LICENSE
└── README.md

---

## ⚙️ How It Works

### Dynamic Workday Engine
The schedule runs against configurable DAX parameters:
* Start: 08:00
* End: 16:00
* Time Zone: Europe/Warsaw (CET = UTC+1, CEST = UTC+2)
* Tracking: Progress percentage, time remaining, and current interval status calculated dynamically on evaluation.

### Visual Rendering Setup
Measures are categorized as Image URL in the semantic model. Visual containers are optimized by:
1. Stripping default titles, backgrounds, and padding.
2. Setting strict SVG viewBox coordinates to guarantee pixel-perfect responsiveness across desktop and mobile form factors.

---

## 📌 Architectural Notes & Known Boundaries

* **Demonstration Scope:** This lab serves as an exploratory showcase pushing the boundaries of DAX-driven UI rendering without third-party custom visuals.
* **Clock Dynamics:** Timestamps reflect model evaluation instances (UTCNOW()) rather than client-side continuous JavaScript clocks.

---

## 📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
