# 🦠 COVID-19 Global SQL Analysis

## 📌 Project Background
This project focuses on analyzing COVID-19 data across countries using two datasets: **CovidDeaths** and **CovidVaccinations**. The goal is to uncover insights about infection trends, death rates, and vaccination progress, while also understanding how different countries responded during key periods of the pandemic. The datasets contain hundreds of thousands of records covering countries from all continents. By analyzing these datasets, we aim to create data-driven conclusions that can inform public health understanding and policy decisions.

---

## 📖 Important Terminology

- 🧮 **Total Cases**: Cumulative number of confirmed COVID-19 cases.  
- 💀 **Total Deaths**: Cumulative number of COVID-19 related deaths.  
- 📉 **Death Percentage**: `(total_deaths / total_cases) * 100`  
- 🧬 **Infection Rate**: `(total_cases / population) * 100`  
- 💉 **Rolling Vaccinations**: Cumulative vaccinations over time using SQL window functions.

---

## 📊 Executive Summary
This analysis covers **219 global locations** using SQL queries to extract metrics such as infection rate, death percentage, and vaccination progress. The United States, India, and Brazil reported the highest absolute cases and deaths, while smaller nations like Andorra and Montenegro exhibited higher infection percentages relative to population. Vaccination efforts were led by China and the U.S. with over 200M doses each. SQL was used to prepare the dataset for insights, and Tableau was suggested for future dashboard development.

---

## 📈 Summary of Insights

### 🦠 Top Countries by Total Cases:
- 🇺🇸 United States: 32.3M+
- 🇮🇳 India: 19.1M+
- 🇧🇷 Brazil: 14.6M+
- 🇫🇷 France: 5.6M+
- 🇹🇷 Turkey: 4.8M+

### 💀 Top Countries by Total Deaths:
- 🇺🇸 United States: 576K+
- 🇧🇷 Brazil: 403K+
- 🇲🇽 Mexico: 216K+
- 🇮🇳 India: 211K+
- 🇬🇧 United Kingdom: 127K+

### 🧬 Highest Infection Rate (% of population):
- 🇦🇩 Andorra: 17.13%
- 🇲🇪 Montenegro: 15.51%
- 🇨🇿 Czechia: 15.23%
- 🇸🇲 San Marino: 14.93%
- 🇸🇮 Slovenia: 11.56%

### 💉 Top Vaccination Totals:
- 🇨🇳 China: 265M+ doses
- 🇺🇸 United States: 240M+ doses

### 📉 Global Death Rate:
- ~2.12% of infected individuals died globally

---

## ✅ Recommendations

- 🏥 **Strengthen Public Health Infrastructure**: Improve emergency response and hospital readiness.
- 🧭 **Targeted Vaccination Campaigns**: Prioritize highly infected smaller nations.
- 📊 **Invest in Real-Time Dashboards**: Use Tableau or Power BI with SQL views for live insights.
- 🌐 **Continue Global Collaboration**: Emphasize data sharing, transparency, and international coordination.

---

## ⚠️ Assumptions and Caveats

- Some countries may underreport or delay data, affecting accuracy.
- Vaccination data may not distinguish between first and second doses.
- Population is treated as static across the dataset timeline.
- Aggregated regions like "World", "Europe", etc. were excluded from insights.

---

## 🛠️ Technical Project Information

- 🔗 **Source**: [Our World in Data](https://ourworldindata.org/coronavirus)  
- 🗃️ **Data**: `CovidDeaths.csv`, `CovidVaccinations.csv`  
- 🧠 **Tech Used**: SQL (CTEs, Joins, Temp Tables, Views), Tableau  
- 📂 **Output**: Insights, summary tables, and clean views for visualization

---

## 🚀 How to Use

1. Clone the repo  
2. Run the SQL script `Covid_Global_Analysis.sql` in your DBMS  
3. Connect Tableau to your SQL views or use exported CSVs  
4. Build the dashboard (filters, KPIs, maps, line charts)

---

## 🌍 About Me

I'm a data analyst passionate about storytelling with data. This project reflects my interest in real-world impact through clean SQL logic and engaging visualization.

👉 Visit my **[Portfolio](https://github.com/Ashutosh22d)** to see more.
