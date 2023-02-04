
set echo on
set linesize 300
set pagesize 500
spool BD2C059_TEST.LIS

-- Wyœwietl wszystkich dealerów
SELECT id_dealera, nazwa
FROM dealerzy;

-- Wyœwietl wszystkich sprzedawców
SELECT id_sprzedawcy, imie, nazwisko
FROM sprzedawcy;

-- Wyswietla wszystkie pytania
SELECT * FROM pytania;

-- Wyœwietl wszystkich sprzedawców pracujacych dla dealera o id=6
SELECT s.id_sprzedawcy, s.imie, s.nazwisko
FROM dealerzy d RIGHT JOIN sprzedawcy s ON(d.id_dealera=s.id_dealera)
WHERE d.id_dealera = 1;

-- Wyœwietl wszystkie oceny sprzedawcy o id=3
SELECT ank.id_ankiety, ank.login_klienta, ank.data_wypelnienia, odp.id_pytania, odp.odpowiedz
FROM sprzedawcy s RIGHT JOIN ankiety ank ON(s.id_sprzedawcy=ank.id_sprzedawcy) 
                  RIGHT JOIN odpowiedzi odp ON(ank.id_ankiety=odp.id_ankiety)
WHERE s.id_sprzedawcy = 3
ORDER BY ank.data_wypelnienia, id_pytania ASC;

-- Wyœwietl œrednia z odpowiedzi na ka¿de pytanie dla sprzedawcy o id=1
SELECT odp.id_pytania, AVG(odp.odpowiedz) as srednia
FROM sprzedawcy s RIGHT JOIN ankiety ank ON(s.id_sprzedawcy=ank.id_sprzedawcy) 
                  RIGHT JOIN odpowiedzi odp ON(ank.id_ankiety=odp.id_ankiety)
WHERE s.id_sprzedawcy = 1
GROUP BY odp.id_pytania;

-- Wyœwietla liczbe odpowiedzi o kazdej wartosci dla sprzedawcy o id=3
SELECT odp.id_pytania, odp.odpowiedz as wartosc_odpowiedzi, COUNT(odp.odpowiedz) as liczba_odpowiedzi
FROM sprzedawcy s RIGHT JOIN ankiety ank ON(s.id_sprzedawcy=ank.id_sprzedawcy) 
                  RIGHT JOIN odpowiedzi odp ON(ank.id_ankiety=odp.id_ankiety)
WHERE s.id_sprzedawcy = 3
GROUP BY odp.id_pytania, odp.odpowiedz
ORDER BY liczba_odpowiedzi DESC;

-- Wyswietla srednia ze wszystkich odpowiedzi dla kazdnego sprzedawcy pracujacego dla dealera o id=1
SELECT s.id_sprzedawcy, ROUND(AVG(odp.odpowiedz), 2) as srednia
FROM dealerzy d RIGHT JOIN sprzedawcy s ON(d.id_dealera=s.id_dealera) 
                  RIGHT JOIN ankiety ank ON(s.id_sprzedawcy=ank.id_sprzedawcy) 
                  RIGHT JOIN odpowiedzi odp ON(ank.id_ankiety=odp.id_ankiety)
WHERE d.id_dealera = 1
GROUP BY s.id_sprzedawcy;

spool off
