
set echo on
set linesize 300
set pagesize 500
spool BD2C059_DML.LIS


-- Testowanie Dealerow

-- Dodanie 2 Dealerow
INSERT INTO DEALERZY (kod_pocztowy, miejscowosc, ulica, nr_budynku, nazwa, nip)
VALUES ('33-444', 'Marianow', 'Pierwsza', '56C', 'Firma1', '1223344556');
INSERT INTO DEALERZY (kod_pocztowy, miejscowosc, ulica, nr_budynku, nazwa, nip)
VALUES ('11-222', 'Grabanow', 'Druga', '22D', 'Firma2', '5647382910');

-- Dodanie dealera drugiego dealera z takim samym nipem (error)
INSERT INTO DEALERZY (kod_pocztowy, miejscowosc, ulica, nr_budynku, nazwa, nip)
VALUES ('12-345', 'Pracowa', 'Trzecia', '44B', 'Firma3', '1223344556');

-- Dodanie dealera ze zlym nipem (error)
INSERT INTO DEALERZY (kod_pocztowy, miejscowosc, ulica, nr_budynku, nazwa, nip)
VALUES ('12-345', 'Pracowa', 'Trzecia', '44B', 'Firma3', '5667227'); -- za krotki
INSERT INTO DEALERZY (kod_pocztowy, miejscowosc, ulica, nr_budynku, nazwa, nip)
VALUES ('12-345', 'Pracowa', 'Trzecia', '44B', 'Firma3', '332211445566778899'); -- za dlugi

-- Dodanie dealera ze zlym kodem pocztowym (error)
INSERT INTO DEALERZY (kod_pocztowy, miejscowosc, ulica, nr_budynku, nazwa, nip)
VALUES ('12345', 'Pracowa', 'Trzecia', '44B', 'Firma4', '8657425963'); -- zly format
INSERT INTO DEALERZY (kod_pocztowy, miejscowosc, ulica, nr_budynku, nazwa, nip)
VALUES ('123-3456', 'Pracowa', 'Trzecia', '44B', 'Firma5', '5362745942'); -- zly format i za dlugi


-- Testowanie Sprzedawcow

-- Dodanie 2 sprzedawcow
INSERT INTO SPRZEDAWCY (id_dealera, imie, nazwisko, email, pesel)
VALUES (1, 'Pawel', 'Kowalski', 'pawel.kowalski@pw.edu.pl', '54358362427');
INSERT INTO SPRZEDAWCY (id_dealera, imie, nazwisko, email)
VALUES (1, 'Gawel', 'Grunwald', 'gawel.grunwald@pw.pl');

-- Dodanie sprzedawcy z niepoprawnym emailem (error)
INSERT INTO SPRZEDAWCY (id_dealera, imie, nazwisko, email)
VALUES (1, 'Jan', 'Dan', 'jan.dan.pw.edu.pl');

-- Dodanie sprzedawcy ze zlym peselem (error)
INSERT INTO SPRZEDAWCY (id_dealera, imie, nazwisko, email, pesel)
VALUES (1, 'Maja', 'Kowalska', 'maja.kowalska@pw.edu.pl', '53748'); -- za krotki
INSERT INTO SPRZEDAWCY (id_dealera, imie, nazwisko, email, pesel)
VALUES (1, 'Ola', 'Grunwald', 'ola.grunwald@pw.edu.pl', '5435852315362427'); -- za dlugi

-- Proba zmiany id_dealera 
UPDATE sprzedawcy SET id_dealera = 2 WHERE imie = 'Gawel';
UPDATE sprzedawcy SET id_dealera = 4 WHERE id_sprzedawcy = 2;


-- Testowanie Klientow

-- Dodanie 2 klientow
INSERT INTO KLIENCI (login, haslo, imie, nazwisko, email)
VALUES ('magadaga', 'haslo_magdy','Magda', 'Tymoszuk', 'magda.tymoszuk@wp.pl');
INSERT INTO KLIENCI (login, haslo, email)
VALUES ('nobody','topsecret', 'anonymous@pw.pl');

-- Dodanie  klienta ze zlym emailem (error)
INSERT INTO KLIENCI (login, haslo, imie, nazwisko, email)
VALUES ('logloglog', 'hashashas','Piotr', 'Dacewicz', 'piotr.dacewicz.sda.sd.pl');

-- Dodanie klienta ze zbyt krotkim haslem (error)
INSERT INTO KLIENCI (login, haslo, imie, nazwisko, email)
VALUES ('lglglglglgl', '123','Jan', 'Dzban', 'jan.dzban@sd.pl');


-- Testowanie Ankiety

-- Dodanie 2 ankiet
INSERT INTO ANKIETY (id_sprzedawcy, login_klienta, data_wypelnienia)
VALUES (1, 'magadaga', to_date('04/02/2008', 'MM/DD/RRRR'));
INSERT INTO ANKIETY (id_sprzedawcy, login_klienta, data_wypelnienia)
VALUES (1, 'nobody', to_date('11/11/2012', 'MM/DD/RRRR'));

-- Dodanie ankiety ze zla data (error)
INSERT INTO ANKIETY (id_sprzedawcy, login_klienta, data_wypelnienia)
VALUES (1, 'magadaga', to_date('13/13/2012', 'MM/DD/RRRR'));

-- Proba zmiany id_sprzedawcy w ankiecie (error)
UPDATE ankiety SET id_sprzedawcy = 2 WHERE id_ankiety = 1;
UPDATE ankiety SET id_sprzedawcy = 2 WHERE id_ankiety = 3;

-- Proba zmiany login_klienta w ankiecie (error)
UPDATE ankiety SET login_klienta = 'magadaga' WHERE id_ankiety = 1;
UPDATE ankiety SET login_klienta = 'nobody' WHERE id_ankiety = 3;


-- Testowanie Pytania

-- Dodanie 2 pytan
INSERT INTO PYTANIA (tresc)
VALUES ('Pytanie1?');
INSERT INTO PYTANIA (tresc)
VALUES ('Pytanie2?');

-- Proba usuniecia pytania z odpowiedziami (error)
DELETE FROM pytania WHERE id_pytania = 1;


-- Testowanie Odpowiedzi

-- Dodanie 3 odpowiedzi na pytania w 9 ankiecie
INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (9, 1, -1);
INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (9, 2, -0.5);
INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (9, 3, -0.5);

-- Proba ponownej odpowiedzi na te same pytania dla tej samej ankiety (error)
INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (9, 1, 1);
INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (9, 2, 0.5);
INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (9, 3, -1);

-- Dodanie odpowiedzi ze zlymi wartosciami odpowiedzi (error)
INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (10, 1, 3);
INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (10, 2, 0.35);
INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (10, 3, -0.15);

spool off
