--Total Cases vs TotalDeaths
Select sum(new_cases) as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths, (sum(cast(new_deaths as int))/sum(new_cases))*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where continent is not null
order by 1, 2

--Total Death Count in each location
Select Location, sum(cast(new_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
where continent is null
and location not in ('World', 'European Union', 'International', 'Upper middle income', 'High income', 'Lower middle income', 'Low income')
group by Location
order by 2 desc

--Countries with Highest Infection Rate compared to Population
Select Location, population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
--where continent is not NULL
group by location, population
order by 4 desc

--Countries with Highest Infection Rate compared to Population by Date
Select Location, population, date, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
--where continent is not NULL
group by location, population, date
order by PercentPopulationInfected desc
