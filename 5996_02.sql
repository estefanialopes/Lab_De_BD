--1--
select pnome, unome
from funcionario
where salario > 30000;
--2--
select pnome, endereco
from funcionario join
departamento on
dnumero=numdept
where dnome= 'Administracao';
--3--
select unome, horas
from funcionario, trabalhaem
where cpf = fcpf and projnumero=3
order by horas desc;
--4--
select pnome, unome  
from funcionario as f join trabalhaem as tr on cpf = fcpf join projeto as pr on
pr.projnumero = tr.projnumero
where   projnome = 'Transmogrifador';
--5--
select f.pnome, f.unome, s.pnome, s.unome
from funcionario as f left outer join funcionario as s on
f.cpf= s.cpfsuperv;
--6---
select projnumero
from projeto;
--7--
select p.projnome as nome_projeto, min(t.horas) as minimo, round (avg(t.horas),2) as media, max(t.horas) as maximo
from trabalhaem t join projeto p on t.projnumero=p.projnumero
group by p.projnumero;
--8--
select dnome, count(*), avg (salario)>33000 as recebe
from  funcionario, departamento
group by dnome;




