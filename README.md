# Projekt_Biblioteki
Projekt biblioteki cyfrowej
W pracy korzystano z oprogramowania XAMPP.
W pierwszej kolejności należy zaimportować bibliotekę "biblioteka.sql".
Po wybraniu pliku głównego "main.php" ukazuje się nam menu logowania. Możemy zalogować się jako użytkownik np. mail: nowy@mail.com hasło:123 albo administrator - mail: admin@mail.com, hasło:123. 

Użytkownik może wypożyczyć książkę albo zwrócić posiadane książki. Po wybraniu książki i naciśnieciu przycisku "wypożycz" następuje przekazanie prośby o wypożyczenie książki do administratora i książka zostaje udostępniona dopiero po jego zatwierdzeniu. Zwrot natomiast jest wykonywany od razu po naciśnieciu przycisku "zwróć".
Ustawione jest domyślnie, że student wypożyczy dowolną książke na 30 dni, a nauczyciel na 60 dni.

Administrator posiada więcej opcji niż użytkownik, może:
- dodać nową książke wraz z ilością jej kopii
- wyśtwietlić listę wszystkich książek
- akceptować prośby o wypożyczenie książek
- dodać nowego użytkownika
- wyśtwietlić listę użytkowników
- wydać książkę dowolnemu użytkownikowi (bez jego prośby o wypożyczenie) na dowolną liczbę dni
- wyświetlić listę wypożyczonych książek

Po wypozyczeniu wszystkich kopii danej książki, przestaje ona być widoczna jako dostępna do wypożyczenia.
