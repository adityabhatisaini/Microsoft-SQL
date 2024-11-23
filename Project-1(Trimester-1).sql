select name from sys.databases;
create DATABASE SQLexam;
use SQLexam;
select name from sys.tables;

--Q.1 What is the average literacy percentage by state?

select state,avg(Literacy) as Avg_Literacy_percentage
from Literacy2011 
group by state;



--Q.2 Which state has the highest literacy percentage overall?
select top 1 State,avg(Literacy) as avg_literacy 
from Literacy2011 
group by state 
order by avg(Literacy) desc;

--Q.3 What is the total population of states with literacy rates above the national average?

SELECT P.states,sum(P.population) AS Avg_Literacy
FROM population2011 P
JOIN Literacy2011 L ON P.states = L.state
GROUP BY P.states
having avg(L.Literacy) > (select avg(Literacy) from Literacy2011);


--Q.4 What is the average literacy percentage for states with a population over 10 million?
select State,avg(literacy) from Literacy2011 
where state in 
(select states from population2011 where population>10000000) 
group by state;
--OR
select L.state,avg(L.literacy) as xc 
from Literacy2011 L 
join population2011 P on L.State=P.states 
where P.states in (select state from population2011 
where population>1000000)
GROUP BY L.State;


--Q.5 Which districts have a literacy percentage below 60%?
select District,literacy from Literacy2011 
where literacy > 60;



--Q.6 What is the state-wise distribution of literacy percentages across different districts?
SELECT state,district,literacy FROM Literacy2011
ORDER BY state,literacy desc;



--Q.7 Find the state with the lowest literacy percentage.

select top 1 state,avg(literacy) as lowest_literacy from Literacy2011 L 
group by state 
order by avg(literacy) asc;
