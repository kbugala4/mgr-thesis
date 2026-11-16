# Raport poprawek końcowych rozdziałów 4–5

Podstawa: `zlecenie-poprawki-koncowe-rozdzialy-4-5.md`, wersja odnosząca się do commita `25e0b2b`. Fakty implementacyjne przyjęto z dowodów zweryfikowanych przez recenzenta i redaktora. Zmieniono wyłącznie dwa wskazane pliki manuskryptu, poza utworzeniem tego wymaganego raportu.

| Punkt | Status i wykonanie |
| --- | --- |
| 1.1 | Wprowadzono: wybór T i wag T+E opiera się wyłącznie na OOF, mimo automatycznego obliczania metryk testowych po dopasowaniu konfiguracji. Usunięto nieprawdziwą deklarację kolejności. |
| 1.2 | Wprowadzono: usunięto zdanie o 161 testach bez zastępstwa. Zachowano zakres testów i opis kontroli macierzy. |
| 1.3 | Wprowadzono w obu miejscach: cztery wątki CPU dla każdego zadania, GPU tylko dla metod neuronowych i TabPFN. |
| 2.1 | Wprowadzono: opisano brak rejestrowania obciążenia jako właściwość platformy i granicę interpretacji kosztu. |
| 2.2 | Wprowadzono: interpretacja czasu i niepowodzeń uwzględnia możliwą konkurencję o GPU, której natężenia nie mierzono. |
| 2.3 | Wprowadzono: w rozdziale 4 pozostawiono zasadę budżetu i odsyłacz. Szczegóły zatrzymania pozostają w rozdziale 5, gdzie dodano orientacyjny charakter limitu. |
| 2.4 | Wprowadzono: powtórzony warunek pełnego raportu w rozdziale 5 zastąpiono odsyłaczem do rozdziału 4. |
| 2.5 | Wprowadzono: cały akapit o konwencjach metryk przeniesiono bez zmian na koniec sekcji o identyfikowalności danych i spójności predykcji. |
| 2.6 | Wprowadzono: „badania mechanizmów” w podpisie tabeli i rozliczeniu dopasowań. We wstępie rozdziału 4 zachowano „badania kontrolowane” z objaśnieniem terminu. Rozdział 1 pozostał bez zmian. |
| 2.7 | Wprowadzono: poprawiono opis przeznaczenia obliczeń na dwanaście zadań, powtórzenie „stała procedura” i nazwy zbiorów przy licznościach klasy rzadkiej. „Limit doradczy” zastąpiono opisem orientacyjnego limitu w rozdziale 5 zgodnie z punktem 2.3. |
| 2.8 | Wprowadzono podany akapit o identyfikatorach, podziale i granicach wniosku. Usunięto zdanie o nieobecnej kolumnie ID w Santander. |
| 2.9 | Wprowadzono: dwa powtarzające się zdania o znaczeniu klasy rzadkiej zastąpiono jednym. Opis implementacji w rozdziale 5 zachowano. |
| 2.10 | Wprowadzono: definicja kampanii poprzedza jej pierwsze użycie. W heurystyce pamięci przyjęto „na jedną obserwację”. |
| 2.11 | Wprowadzono: w rejestrze zbiorów zapisano 1000, 3751 i 1776. Liczby pięciocyfrowe i większe zachowują separator tysięcy. |

## Decyzje i elementy zachowane

- Przedziały w tabeli doboru partii zachowują dotychczasowy zapis, np. `[2\,000;\ 8\,000)`, zgodnie z dopuszczonym wyjątkiem. Poza przedziałami czterocyfrowe liczby nie mają separatora. Nie zmieniono lat, identyfikatorów ani wersji. `14\,976` i `10\,000` zachowano.
- Etykietę `sec:wymagania-platformy` pozostawiono. Wyszukiwanie w `chapters/` i `figures/` znalazło wyłącznie jej definicję. Usunięcie było opcjonalne, a część 3 poleca przede wszystkim odnotowanie sprawy.
- Nie zmieniono kontrastów, rankingu i bootstrapu badania głównego. Pozostają planem analizy. Według przekazanego zlecenia analizę trzeba wykonać przed opracowaniem rozdziału 6, w którym pozostaje również chronologia ustalenia jej reguł.
- Zachowano specyfikatory położenia tabel i rysunków. Nie zmieniano innych akapitów, rozdziałów, załącznika, bibliografii ani szablonu.

## Kontrole

- Brak zdania „przed wykorzystaniem etykiet testowych” i liczby 161 w rozdziałach 4–5. Przydział GPU w obu wskazanych miejscach dotyczy wyłącznie metod neuronowych i TabPFN.
- Brak znaczników TODO, „do uzupełnienia”, „jeszcze”, „należy” i „przekazan”. Wyszukiwanie wykonano z granicami słów tam, gdzie nieograniczone dopasowanie dawałoby fałszywe trafienie, np. TODO w słowie „metodom”.
- Wyszukiwanie „uzupełniając” i „kontrolowan” zwraca wyłącznie objaśnienie terminu na początku rozdziału 4.
- Etykiety w rozdziałach i źródłach rysunków są unikalne. Wszystkie sprawdzone odsyłacze mają cel. Przeniesiony akapit zachował odsyłacz do załącznika. Nie ma średników w prozie, pozostały separatory matematyczne.
- `bash regen-pdf.sh` zakończyło się powodzeniem. Wynik: `build/wut/main.pdf`, 58 stron. Końcowy log nie zawiera `undefined`, `Overfull` ani błędów LaTeX. `git diff --check` przeszedł.
- Nie korzystano z repozytorium eksperymentów podczas tego zadania, nie zmieniano go i nie odczytywano wyników A/B. Nie wykonano polecenia `status` sugerowanego w części kontrolnej, ponieważ lista dozwolonych poleceń w części 0 go wyklucza. Nie deklaruje się niezależnego sprawdzenia bieżącego stanu maszyny treningowej.
- Nie wykonano commita ani dodania nowych zmian do stage.
