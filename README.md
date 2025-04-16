
COVID-19 Global SQL Analysis

Project Background
This project focuses on analyzing COVID-19 data across countries using two datasets: CovidDeaths and CovidVaccinations. The goal is to uncover insights about infection trends, death rates, and vaccination progress, while also understanding how different countries responded during key periods of the pandemic. The datasets contain hundreds of thousands of records covering countries from all continents. By analyzing these datasets, we aim to create data-driven conclusions that can inform public health understanding and policy decisions.

Important terminology:

Total Cases: The cumulative number of confirmed COVID-19 infections in a country.
Total Deaths: The cumulative number of confirmed COVID-19 related deaths.
Death Percentage: The likelihood of dying if infected, calculated as (total deaths / total cases) * 100.
Infection Rate: The percentage of a country’s population infected.
Rolling Vaccinations: The cumulative number of people vaccinated over time.

Executive Summary
The analysis is based on COVID data across 219 locations. Using SQL, key metrics such as infection rate, death percentage, and vaccination coverage were computed and ranked. The United States, India, and Brazil emerged as countries with the highest total case and death counts. However, smaller nations like Andorra and Montenegro showed significantly higher infection percentages relative to population. Vaccination progress was tracked using rolling sums, showing China and the U.S. as leaders in total administered doses. Global death percentage was calculated to be approximately 2.12%.

Summary of Insights

Top Countries by Total Cases:
- United States: 32.3 million+
- India: 19.1 million+
- Brazil: 14.6 million+
- France: 5.6 million+
- Turkey: 4.8 million+

Top Countries by Total Deaths:
- United States: 576,000+
- Brazil: 403,000+
- Mexico: 216,000+
- India: 211,000+
- United Kingdom: 127,000+

Infection Rate (% of population):
- Andorra: 17.13%
- Montenegro: 15.51%
- Czechia: 15.23%
- San Marino: 14.93%
- Slovenia: 11.56%

Vaccination Leaders:
- China: 265M+ doses
- United States: 240M+ doses

Global Death Rate:
- Approximately 2.12% of infected individuals died based on total recorded cases and deaths.

Recommendations
Based on these findings, the following recommendations can be made:

Strengthen Public Health Infrastructure: Countries with high death percentages may benefit from better hospital resources and early treatment strategies.

Targeted Vaccination Campaigns: Smaller nations with high infection rates should be prioritized for vaccination and health education programs.

Invest in Data Collection and Reporting: Standardized and timely data collection helps in accurate modeling and quicker decision-making.

Build Dashboard Interfaces: The SQL views and queries can feed into visualization tools like Tableau and Power BI for dynamic public-facing dashboards.

Continue Global Collaboration: The virus’s spread across countries reinforces the importance of international collaboration in healthcare and research.

Assumptions and Caveats
- The death percentages assume accuracy in reporting of total cases and deaths. Undercounting or delays in reporting can affect this.
- Vaccination figures do not distinguish between first and second doses unless explicitly specified.
- Population data is assumed static and is not adjusted for birth/death rate during the period analyzed.
- Aggregate regions like “World” and “Europe” were excluded from ranked lists to focus only on individual countries.

Technical Project Information
The original datasets are from Our World in Data (https://ourworldindata.org/coronavirus), containing COVID statistics for 219 locations. SQL was used to filter, group, join, and compute metrics such as rolling sums and percentages. Temporary tables, common table expressions (CTEs), and views were used to organize logic for analysis and BI dashboard integration.

The full SQL code can be found in the file: Covid_Global_Analysis.sql.

For more about my projects and data journey, visit my Portfolio.
