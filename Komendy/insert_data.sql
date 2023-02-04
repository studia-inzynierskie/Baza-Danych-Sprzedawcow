SET DEFINE OFF
-- DEALERZY

INSERT INTO DEALERZY (kod_pocztowy, miejscowosc, ulica, nr_budynku, nazwa, nip, data_zalozenia)
VALUES ('43-432', 'Wokulinka', 'Bazowa', '12A', 'Przedsiebiorstwo autowe', '1234567890', to_date('04/15/1997', 'MM/DD/RRRR'));

INSERT INTO DEALERZY (kod_pocztowy, miejscowosc, ulica, nr_budynku, nazwa, nip, data_zalozenia)
VALUES ('43-432', 'Wokulinka', 'Danowa', '53B', 'Auto-San', '4536577897', to_date('08/11/1998', 'MM/DD/RRRR'));

INSERT INTO DEALERZY (kod_pocztowy, miejscowosc, ulica, nr_budynku, nazwa, nip, data_zalozenia)
VALUES ('12-345', 'Krasnik', 'Wielkomiejska', '82', 'Grand Auto Sell-Man', '0987654321', to_date('12/02/2002', 'MM/DD/RRRR'));

INSERT INTO DEALERZY (kod_pocztowy, miejscowosc, ulica, nr_budynku, nazwa, nip)
VALUES ('00-006', 'Warszawa', 'Malomiejska', '123', 'Sa-mo-cho-dy', '1122334455');

INSERT INTO DEALERZY (kod_pocztowy, miejscowosc, ulica, nr_budynku, nazwa, nip)
VALUES ('00-013', 'Warszawa', 'Plac Politechniki', '15C', 'Auto na Politechnice', '6677889900');

commit;

--------------------------------------------------------------------------------
SET DEFINE OFF
--SPRZEDAWCY

INSERT INTO SPRZEDAWCY (id_dealera, imie, nazwisko, email, pesel)
VALUES (1, 'Andrzej', 'Kowalski', 'andrzej.kowalski@pw.edu.pl', '12345678900');

INSERT INTO SPRZEDAWCY (id_dealera, imie, nazwisko, email, pesel)
VALUES (1, 'Mariusz', 'Grunwald', 'mariusz.grunwald@pw.pl', '11223344556');

INSERT INTO SPRZEDAWCY (id_dealera, imie, nazwisko, email)
VALUES (1, 'Dariusz', 'Kowaluk', 'dariusz.kowaluk@pw.pl');

INSERT INTO SPRZEDAWCY (id_dealera, imie, nazwisko, email, pesel)
VALUES (3, 'Pawel', 'Cichopek', 'pawel.cichopek@pw.pl', '66778899012');

INSERT INTO SPRZEDAWCY (id_dealera, imie, nazwisko, email)
VALUES (4, 'Julian', 'Myrcha', 'julian.myrcha@pw.edu.pl');

INSERT INTO SPRZEDAWCY (id_dealera, imie, nazwisko, email, pesel)
VALUES (4, 'Aleksander', 'Macedonski', 'aleksander.macedonski@pw.pl', '57846396284');

commit;

--------------------------------------------------------------------------------
SET DEFINE OFF
--KLIENCI

INSERT INTO KLIENCI (login, haslo, imie, nazwisko, email)
VALUES ('mtymosz', 'haslo123', 'Marcin', 'Tymoszuk', 'marcin.tymoszuk@wp.pl');

INSERT INTO KLIENCI (login, haslo, email)
VALUES ('agraba', 'zxcasdqwe123', 'andrzej.grabarz@wp.pl');

INSERT INTO KLIENCI (login, haslo, imie, nazwisko, email)
VALUES ('krol_i_czek', 'asdfghjkl', 'Tobiasz', 'Krolikowski', 'tobiasz.krolikowski@wp.pl');

INSERT INTO KLIENCI (login, haslo, email)
VALUES ('login', 'maslo123', 'lukasz.grzywka@wp.pl');

INSERT INTO KLIENCI (login, haslo, imie, nazwisko, email)
VALUES ('pauuula', 'matmatmat', 'Paulina', 'Matuszewicz', 'paulina.matuszewicz@wp.pl');

commit;

--------------------------------------------------------------------------------
SET DEFINE OFF
--ANKIETY

INSERT INTO ANKIETY (id_sprzedawcy, login_klienta, data_wypelnienia)
VALUES (1, 'mtymosz', to_date('04/02/2008', 'MM/DD/RRRR'));

INSERT INTO ANKIETY (id_sprzedawcy, login_klienta, data_wypelnienia)
VALUES (1, 'mtymosz', to_date('11/11/2012', 'MM/DD/RRRR'));

INSERT INTO ANKIETY (id_sprzedawcy, login_klienta, data_wypelnienia)
VALUES (3, 'pauuula', to_date('12/02/2014', 'MM/DD/RRRR'));

INSERT INTO ANKIETY (id_sprzedawcy, login_klienta, data_wypelnienia)
VALUES (3, 'pauuula', to_date('05/09/2011', 'MM/DD/RRRR'));

INSERT INTO ANKIETY (id_sprzedawcy, login_klienta, data_wypelnienia)
VALUES (3, 'login', to_date('02/12/2010', 'MM/DD/RRRR'));

INSERT INTO ANKIETY (id_sprzedawcy, login_klienta, data_wypelnienia)
VALUES (2, 'agraba', to_date('08/05/2012', 'MM/DD/RRRR'));

INSERT INTO ANKIETY (id_sprzedawcy, data_wypelnienia)
VALUES (3, to_date('12/12/2012', 'MM/DD/RRRR'));

INSERT INTO ANKIETY (id_sprzedawcy, data_wypelnienia)
VALUES (4, to_date('01/11/2011', 'MM/DD/RRRR'));

commit;

--------------------------------------------------------------------------------
SET DEFINE OFF
--PYTANIA

INSERT INTO PYTANIA (tresc)
VALUES ('Czy sprzedawca sluzyl panu/pani pomoca?');

INSERT INTO PYTANIA (tresc)
VALUES ('Czy sprzedawca byl w stosunku do pana/pani mily?');

INSERT INTO PYTANIA (tresc)
VALUES ('Czy jest pan/pani zadowolona z zakupu?');

commit;

--------------------------------------------------------------------------------
SET DEFINE OFF
--ODPOWIEDZI

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (1, 1, -1);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (1, 2, -0.5);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (1, 3, 0);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (2, 1, 0.5);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (2, 2, -1);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (2, 3, 1);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (3, 1, 1);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (3, 2, 0.5);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (3, 3, -1);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (4, 1, -0.5);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (4, 2, -0.5);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (4, 3, 0.5);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (5, 1, 0.5);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (5, 2, 1);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania)
VALUES (5, 3);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (6, 1, 1);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania)
VALUES (6, 2);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (6, 3, 1);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (7, 1, 0.5);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (7, 2, -1);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (7, 3, 0.5);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (8, 1, -0.5);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (8, 2, -0.5);

INSERT INTO ODPOWIEDZI (id_ankiety, id_pytania, odpowiedz)
VALUES (8, 3, 1);

commit;
