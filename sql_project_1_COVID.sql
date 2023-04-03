-- USE DATABASE
USE alextutorial;
-- SELECT DATE WE WILL BE USING
SELECT Location,date,total_cases,new_cases,total_deaths,population
FROM covid_deaths
ORDER BY 1,2;
-- TOTAL CASES VS TOTAL DEATHS
-- CHANCES OF DEATH IF YOU CATCH COVID
SELECT Location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 AS DeathPercentage
FROM covid_deaths
ORDER BY 1,2;

-- TOTAL CASES VS POPULATION
-- SHOWS WHAT % OF POPULATION GOT COVID
SELECT Location,date,Population,total_cases,(total_cases/population)*100 AS CovidInfectionPercentage
FROM covid_deaths
ORDER BY 1,2;

-- COUNTRIES WITH HIGHEST INFECTION RATE BY POPULATION
SELECT Location,Population,MAX(total_deaths) AS HighestInfectionCount,MAX((total_cases/population))*100 AS CovidInfectionPercentage
FROM covid_deaths
GROUP BY Location,Population
ORDER BY 4 DESC;

-- COUNTRIES WITH HIGHEST DEATH COUNT
SELECT Location,MAX(Total_deaths) as TotalDeathCount
FROM covid_deaths
GROUP BY Location
ORDER BY TotalDeathCount;

-- CONTINENT WITH HIGHEST DEATH COUNT
SELECT continent,MAX(Total_deaths) as TotalDeathCount
FROM covid_deaths
GROUP BY continent
ORDER BY TotalDeathCount;

-- GLOBAL NUMBERS
SELECT date,SUM(new_cases) as NewCases,SUM(new_deaths) as NewDeaths ,SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
FROM covid_deaths
GROUP BY date
ORDER BY 1;

-- JOIN TABLE COVID DEATHS AND COVID VACCINATIONS BASED ON LOCATION
SELECT * FROM covid_deaths dea
JOIN covid_vaccinations vac
ON dea.Location=vac.Location;

Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From covid_deaths
Group by Location, Population, date
order by PercentPopulationInfected desc;












