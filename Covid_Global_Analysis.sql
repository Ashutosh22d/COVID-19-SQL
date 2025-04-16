
-- View all COVID death data
SELECT *
FROM CovidDeaths
WHERE continent IS NOT NULL
AND location NOT IN ('World', 'Europe', 'Asia', 'North America', 'South America', 'European Union', 'Africa', 'Oceania', 'International')
ORDER BY 3, 4;

-- Total cases vs Total deaths: Likelihood of dying from COVID in each country
SELECT location, date, total_cases, total_deaths, 
       (total_deaths/total_cases)*100 AS DeathPercentage
FROM CovidDeaths
WHERE continent IS NOT NULL
AND location NOT IN ('World', 'Europe', 'Asia', 'North America', 'South America', 'European Union', 'Africa', 'Oceania', 'International')
ORDER BY 1, 2;

-- Total cases vs Population: % of population infected
SELECT location, date, total_cases, population, 
       (total_cases/population)*100 AS PercentPopulationInfected
FROM CovidDeaths
WHERE continent IS NOT NULL
AND location NOT IN ('World', 'Europe', 'Asia', 'North America', 'South America', 'European Union', 'Africa', 'Oceania', 'International')
ORDER BY 1, 2;

-- Countries with highest infection rate compared to population
SELECT location, population, MAX(total_cases) AS HighestInfectionCount, 
       MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM CovidDeaths
WHERE continent IS NOT NULL
AND location NOT IN ('World', 'Europe', 'Asia', 'North America', 'South America', 'European Union', 'Africa', 'Oceania', 'International')
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC;

-- Countries with highest total death count
SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM CovidDeaths
WHERE continent IS NOT NULL
AND location NOT IN ('World', 'Europe', 'Asia', 'North America', 'South America', 'European Union', 'Africa', 'Oceania', 'International')
GROUP BY location
ORDER BY TotalDeathCount DESC;

-- Continent with highest total deaths
SELECT continent, MAX(total_deaths) AS TotalDeathCount
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC;

-- Global summary numbers
SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, 
       (SUM(new_deaths)/SUM(new_cases))*100 AS DeathPercentage
FROM CovidDeaths
WHERE continent IS NOT NULL;

-- Global numbers by date
SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, 
       (SUM(new_deaths)/SUM(new_cases))*100 AS DeathPercentage
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY date;

-- Total population vs vaccinations using JOIN
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
       SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN Covid19.CovidVaccinations vac 
     ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
AND dea.location NOT IN ('World', 'Europe', 'Asia', 'North America', 'South America', 'European Union', 'Africa', 'Oceania', 'International')
ORDER BY dea.location, dea.date;

-- Using CTE for population vs vaccination
WITH PopvsVac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated) AS (
    SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
           SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
    FROM CovidDeaths dea
    JOIN Covid19.CovidVaccinations vac 
         ON dea.location = vac.location AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL
    AND dea.location NOT IN ('World', 'Europe', 'Asia', 'North America', 'South America', 'European Union', 'Africa', 'Oceania', 'International')
)
SELECT *, (RollingPeopleVaccinated / population) * 100 AS PercentPopulationVaccinated
FROM PopvsVac;

-- Using Temp Table
DROP TABLE IF EXISTS PercentPopulationVaccinated;
CREATE TABLE PercentPopulationVaccinated (
    continent TEXT,
    location TEXT,
    date TEXT,
    population INT,
    new_vaccinations INT,
    RollingPeopleVaccinated INT
);

INSERT INTO PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
       SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN Covid19.CovidVaccinations vac 
     ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
AND dea.location NOT IN ('World', 'Europe', 'Asia', 'North America', 'South America', 'European Union', 'Africa', 'Oceania', 'International');

SELECT *, (RollingPeopleVaccinated / population) * 100 AS PercentPopulationVaccinated
FROM PercentPopulationVaccinated;

-- Create a view for easy visualization
CREATE VIEW PercentPopulationVaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
       SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN Covid19.CovidVaccinations vac 
     ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
AND dea.location NOT IN ('World', 'Europe', 'Asia', 'North America', 'South America', 'European Union', 'Africa', 'Oceania', 'International');
