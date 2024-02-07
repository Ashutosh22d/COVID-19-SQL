SELECT *
FROM CovidDeaths
where continent is not null
order by 3,4;

-- SELECT *
-- FROM CovidVaccinations
-- ORDER BY 3, 4

SELECT Location, date, total_cases,new_cases,total_deaths,population
FROM CovidDeaths
where continent is not null
ORDER BY 1,2;

-- Total cases vs Total deaths
-- Shows likelihood of dying if you contract Covid in the country
SELECT Location, date, total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
FROM CovidDeaths
WHERE location like '%states%'
WHERE continent is not null
ORDER BY 1,2;

-- Looking at Total Cases vs Population
-- Shows what % of population got Covid
SELECT Location, date, total_cases,population,(total_cases/population)*100 as PercentPopulationInfected
FROM CovidDeaths
WHERE location like '%states%'
ORDER BY 1,2;

-- Countries with Highest infection rate compared to population

SELECT Location,population,MAX(total_cases) as HighestInfectionCount,MAX((total_cases/population))*100 as
    PercentPopulationInfected
FROM CovidDeaths
-- WHERE location like '%states%'
where continent is not null
Group BY Location, population
ORDER BY PercentPopulationInfected desc;


-- Country with the highest Death Count per Population

SELECT Location,MAX(total_deaths) as TotalDeathCount
FROM CovidDeaths
-- WHERE location like '%states%'
where continent is not null
Group BY Location
ORDER BY TotalDeathCount desc;

-- By Continent

-- Continent With Highest Death count per population

SELECT continent,MAX(total_deaths) as TotalDeathCount
FROM CovidDeaths
-- WHERE location like '%states%'
where continent is not null
Group BY continent
ORDER BY TotalDeathCount desc;

-- Global numbers
SELECT SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, (sum(new_deaths)/sum(new_cases))*100 as DeathPercentage
FROM CovidDeaths
-- WHERE location like '%states%'
where continent is not null
-- group by date
ORDER BY 1,2;

-- Global number by date
SELECT date, SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, (sum(new_deaths)/sum(new_cases))*100 as DeathPercentage
FROM CovidDeaths
-- WHERE location like '%states%'
where continent is not null
group by date
ORDER BY 1,2;


-- Total Population vs vaccinactions
SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
       sum(vac.new_vaccinations) over (PARTITION BY dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from CovidDeaths dea
JOIN Covid19.CovidVaccinations vac on dea.location = vac.location  and dea.date =  vac.date
where dea.continent is not null
order by 2,3;

-- Using CTE
With PopvsVac (Continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
as
(
SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
       sum(vac.new_vaccinations) over (PARTITION BY dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from CovidDeaths dea
JOIN Covid19.CovidVaccinations vac on dea.location = vac.location  and dea.date =  vac.date
where dea.continent is not null
-- order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac;


-- TEMP TABLE

Drop Table if exists PercentPopulationVaccinated;
Create Table PercentPopulationVaccinated
(
Continent TEXT,
Location TEXT,
Date TEXT,
Population INT,
New_vaccinations INT,
RollingPeopleVaccinated INT
)

Insert into PercentPopulationVaccinated
SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
       sum(vac.new_vaccinations) over (PARTITION BY dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from CovidDeaths dea
JOIN Covid19.CovidVaccinations vac on dea.location = vac.location  and dea.date =  vac.date
where dea.continent is not null
-- order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From PercentPopulationVaccinated;

-- Creating View to store data for Visulations

CREATE VIEW PercentPopulationVaccinated as
SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
       sum(vac.new_vaccinations) over (PARTITION BY dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from CovidDeaths dea
JOIN Covid19.CovidVaccinations vac on dea.location = vac.location  and dea.date =  vac.date
where dea.continent is not null
order by 2,3

Select *
FROM PercentPopulationVaccinated