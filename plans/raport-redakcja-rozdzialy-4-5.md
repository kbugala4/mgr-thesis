# Raport redakcji rozdziałów 4–5

Podstawa: `appendices/zlecenie-redakcja-4-5.md`, stan manuskryptu przed bieżącą redakcją oraz wyjaśnienie autora dotyczące chronologii projektu i wyboru nastaw A/B. Rozdziały 4–5 zostały zredagowane i skompilowane. Rozdziały 6–7 zmieniono wyłącznie w miejscach wskazanych w zleceniu. Nie wykonano analiz statystycznych ani eksperymentów.

## Podstawa faktograficzna i zakres dostępu

Przeczytano dokumenty zakresu naukowego w sąsiednim `mgr-repo`: temat, dobór metod, dobór danych, protokół i stan implementacji. Lokalne repozytorium ma HEAD `e09cf5f`. Dokumenty zawierają także historyczne opisy nieukończonej kwalifikacji oraz niekompletnych/obciętych źródeł B. Przy korektach wykorzystano nowsze, zweryfikowane fakty F1–F34 przekazane w zleceniu, wraz ze wskazanymi tam lokalizacjami dowodów. Nie przedstawia się tego jako ponownego niezależnego audytu maszyny treningowej.

Stanowisko, wykonanie syntetyczne na GPU, chronologia i przyczyna pominięcia Covertype pochodzą z dowodów recenzenta. Nie odczytywano predykcji ani metryk testowych A/B. W `mgr-repo` nie uruchamiano Pythona, testów, programów badawczych ani poleceń Git zmieniających stan.

## Zmiany w rozdziale 5 według zlecenia

| Punkty | Miejsce docelowe | Wykonana zmiana |
| --- | --- | --- |
| 4.0, 4.1–2 | Wstęp | Scalono wymagania ze wstępem, zdefiniowano kampanię, zachowano skalę 3132 zadań i 14 976 dopasowań. Etykieta `sec:wymagania-platformy` nie miała odsyłaczy i została przeniesiona do wstępu. |
| 4.3–6 | Architektura i integracje | Opisano wspólny interfejs, scalanie ustawień i przyczynę sekwencyjnego wykonania. Rozdzielono integracje od przygotowania cech. Tabela warstw jest pojęciowa. Usunięto ścieżki modułów. |
| 4.7–11 | Identyfikowalność danych i spójność predykcji | Ujednolicono sumę kontrolną, usunięto dublety opisu Santander i podziału czasowego. Dopisano tolerancję sum prawdopodobieństw 10⁻⁵ i renormalizację. Zachowano granicę kontroli mapowania klas. Populacja predykcji rozstrzyga o znaczeniu metryki, AP w A dotyczy klasy rzadkiej. |
| 4.12–13 | Zapis wyników, awarie i wznowienie | Opisano identyfikator badania, wpływ ścieżek i brak automatycznego zapisu rewizji. Tabela zawiera zapis, zawartość i rolę przy odtwarzaniu, bez nazw plików i pól. |
| 4.14–15 | Ta sama sekcja | Rozróżniono budżet całej konfiguracji, zatrzymanie lokalnych sieci i niepowodzenie. Wskazano trzy metody zapisujące znacznik oraz zachowanie pozostałych integracji. Dodano metadane i podpróbkowanie KNN powyżej 10 000 wierszy. |
| 4.16–17 | Ta sama sekcja | Zachowano zapis atomowy, blokadę i kontrolę wznowienia. Rozdzielono odtworzenie raportu od ponownego dopasowania potrzebnego do nowych predykcji. Nie zadeklarowano bitowej powtarzalności GPU. |
| 4.18–21 | Dobór partii i ograniczenia pamięci | Zachowano heurystykę, mnożnik i przeliczenie 32/64. Przedziały mają średniki i odstępy tysięcy. Dopisano jawne ustawienie partii w B i korektę TabNet wychodzącą poza potęgi dwójki. Usunięto jednorazowy skrót VRAM i zbędne powtórzenia. |
| 4.22–28 | Pomiar kosztu | Miary opisano po polsku. Rozróżniono wyszukiwanie, wszystkie próby, wybrane konfiguracje i wybór D/T/T+E. Dodano synchronizację GPU, zakres partii predykcji, pomiar RSS procesu i potomnych, próbkowanie 0,05 s oraz pamięć PyTorch. Wyraźnie wskazano brak pomiaru pamięci inferencji i rejestracji obciążenia współdzielonego GPU. Rozdzielono konwencje nieokreślonych metryk. |
| 4.29–30 | Weryfikacja poprawności platformy | Podano 161 testów dla wersji kampanii oraz syntetyczny przebieg: 180 obserwacji, 4 zadania, 32 dopasowania i 6 wierszy raportu. Opisano wykonanie także na docelowym GPU, bez nazywania go pełną kwalifikacją. |
| 4.31–37 | Środowisko wykonania i rozdział 6 | Uzupełniono stanowisko, system, sterownik, CUDA i Python. Zachowano przypis identyfikujący definicje przestrzeni, opis efektywnych parametrów i tożsamość wag TabPFN. Tabela wersji ma format `@{}ll@{}`. Szczegóły scalania przeniesiono do rozdziału 6. |
| 4.38–40 | Cały rozdział | Usunięto podwójne puste linie, ujednolicono znaczenia zadania konfiguracji i ustawienia, dodano `@{}` we wszystkich tabelach. |

W źródle rysunku `figures/source/architektura.tex` zastąpiono „Konfiguracja YAML” określeniem „Ustawienia badania”, a zdanie o wznowieniu rozdzielono bez średnika. Zachowano komentarz o pochodzeniu i pozostałą strukturę rysunku. Jest to dostosowanie ilustracji do pojęciowego opisu architektury, bez tworzenia dodatkowej dokumentacji implementacji.

## Zmiany w rozdziale 4 i załączniku

| Punkty | Miejsce docelowe | Wykonana zmiana |
| --- | --- | --- |
| 5.0–1 | Podziały i przepływ informacji | Stratyfikacja grupowa dotyczy tylko podziału zewnętrznego Diabetes. Wewnętrzne foldy grupowe zachowują rozłączność bez stratyfikacji. Cierpliwość 10 zawężono do trzech lokalnych sieci i opisano reguły pozostałych metod. |
| 5.2–4 | Podziały, budżety, analiza porównawcza | Zachowano odsyłacz do metadanych KNN, wyjaśniono pojedynczy model KNN wobec średniej ośmiu modeli ModernNCA. Budżet 3600 s dotyczy konfiguracji i jest dzielony między foldy, a przekroczenie prognozy może zakończyć ją niepowodzeniem. Nazwano ograniczony zakres znaczników zatrzymania. |
| 5.5, D2 | Wstęp i analiza porównawcza | Po wyjaśnieniu autora rozdzielono wcześniejszy projekt i kierunki A/B od późniejszego wyboru ich konkretnych konfiguracji. W analizie wpisano neutralną chronologicznie zasadę wyboru konfiguracji i wag na walidacji oraz ustalenie reguł A/B przed ich uczeniem. Nie zadeklarowano daty ustalenia konkretnych kontrastów i bootstrapu badania głównego. |
| 5.5b–8 | Badanie B i analiza porównawcza | Kryterium norm opisano jako przedział dla stosunku norm wyznaczony z przewidywanego czynnika, bez liczbowego przedziału z rozdziału 7. Kontrasty mają indeksy M₁/M₂, uzasadnienie i interpretację całych procedur. Brak testów między zadaniami powiązano z celowym doborem i małą liczbą zbiorów. Usunięto drugą zapowiedź braku testów. |
| 5.9–10, 5.14 | Badania A i B | Poprawiono przyczynę wyłączenia TabM, uzasadnienie małych zbiorów B, kryterium pełnego budżetu źródeł B i zgodność zatrzymania CatBoost z badaniem głównym. Rozdzielono liczności używane do wag foldu i komparatora. |
| 5.11–13 | Audyt, losowość, raportowanie | Doprecyzowano zbiór kandydatów, rolę ziarna zespołu i usuwanie kolumn stałych w treningu. Przepisano akapit ziaren, zachowując TabPFN 0 oraz A/B 0, 10, 20. |
| 5.15–17 | Rozdziały 3–4 | Usunięto pustą etykietę, a jedyny zmieniony odsyłacz w rozdziale 3 prowadzi do `sec:podzialy`. Dodano odsyłacz do tabeli warunków. Remis w T rozstrzyga niższy indeks, domyślny ma indeks 0. |
| 5.18–24 | Badania A i B | Rozdzielono uporządkowanie od punktów pracy, poprawiono przenoszenie progu, przeniesiono hipotezę CatBoost–MLP do otwarcia A. Usunięto powtórzenie liczby 164 i wspólnych ustawień B, uproszczono opis rankingu, progu zaniku i liczby epok. |
| 5.25–30 | Metryki, analiza, koszt | Zdefiniowano symbole straty bez dubletu mapowania klas. Poprawiono określenie AP w A, opis kosztu inferencji, nagłówek „Obserwacje”, nazwę głównego zestawienia i tytuł sekcji kosztowej. |
| 5.31–32 | Tabele i styl | Zmieniono szerokości na `\linewidth`, dodano `@{}`, poprawiono miejsce `\small`, kropki w komórkach i tyldy w podpisach. Przeczytano akapity ziaren i wyboru konfiguracji po zmianie. |
| 5.33 | `chapters/A-reguly-szczegolowe.tex` | ModernNCA: maksimum 200 epok i zatrzymanie po ponad 20 bez poprawy. Audyt: zachowanie stałych kolumn na wejściu oraz usunięcie ich w treningu. Progi: jawne rozdzielenie konwencji A/B i raportu głównego. |

Zachowano decyzję autora o przyjęciu pełnych danych źródłowych, łącznie z powtórzeniami. Nie wprowadzono deduplikacji ani ręcznego czyszczenia danych. Opis usuwania kolumn stałych dotyczy istniejącej procedury bibliotecznej, nie nowej interwencji.

## Przeniesienia i korekty w rozdziałach 6–7

1. Rozdział 6, `sec:wyniki-kompletnosc`: reguła najnowszego źródła według pierwszej próby, bez selekcji według metryk i bez powrotu do starszego źródła. Opis trzech wersji: 70, 12 i 50 par, z wyjaśnieniem zakresu zmian. Wskazano 30 zastąpionych par i zakończenie TabPFN dla Covertype 16 listopada.
2. Ta sama sekcja: sześć równoległych procesów od 9 listopada, współdzielone GPU, brak zapisu obciążenia i komunikat OOM wymieniający dwanaście innych procesów. Sprzęt opisano w rozdziale 5.
3. Rozdział 7, `sec:mechanizmy-kontrole`: Covertype miał komplet udanych konfiguracji, ale 12/26/8 konfiguracji MLP/FT/TabNet obcięto budżetem. Usunięto opis niekompletności i odstępstwa od reguły, ponieważ kryterium pełnego budżetu jest teraz jawne w rozdziale 4. Zachowano potrzebę niezależnego odtworzenia rang z oryginalnych OOF.
4. Kryterium norm B: zapis 16 listopada o 13:29, rewizja `ad5ff91`, po wyborze konfiguracji, przed rozpoczęciem uczenia o 15:07. Usunięto odpowiadające mu pole chronologiczne. W tym samym zdaniu poprawiono omyłkowe PB2 na PB4.
5. Pole chronologii reguł analizy badania głównego na początku rozdziału 6 pozostaje niezmienione, zgodnie ze zleceniem i wyjaśnieniem autora.

## Fakty niewpisane i kwestie dla autora

- **D2:** autor wyjaśnił, że projekt badania głównego i kierunki rozszerzeń istniały wcześniej, natomiast konkretne nastawy A/B wymagały wyników badania głównego. To wyjaśnienie uwzględniono. Do pola w rozdziale 6 pozostaje data i podstawa ustalenia konkretnych kontrastów oraz bootstrapu badania głównego, a także informacja o wcześniejszym oglądaniu raportów testowych. Nie utożsamiono późniejszego doboru nastaw A/B z późniejszym powstaniem całego projektu.
- **Materiał F26 do pola D2:** 7 listopada, `68f0fb3` — ogólne zasady analizy; 9 listopada 19:08 — pierwsze próby; 16 listopada 10:50 — ostatnia próba główna; 16 listopada 13:29, `ad5ff91` — konkretne reguły A/B; 16 listopada 15:07 — start pilota A/B. Historia repozytorium nie rozstrzyga istnienia wcześniejszych ustaleń poza nim.
- **CatBoost zamiast XGBoost w A:** brak udokumentowanego uzasadnienia. Nie dopisano domniemanego powodu. Autor może wskazać rzeczywisty powód wyboru.
- **Przedpremierowy AutoGluon:** wpisano zgodność gałęzi 1.6 z wymaganiem TabArena, bez wymyślania powodu wyboru wydania przedpremierowego. Powód może uzupełnić autor.
- **D6:** bootstrap i kontrasty badania głównego pozostają opisem analizy do wykonania. Zlecenie podaje 3730 zapisanych plików predykcji, ale nie odczytywano ich ani nie wykonywano analizy. Należy zaplanować jej wykonanie poza aktywnym repozytorium eksperymentów albo po zakończeniu A/B.
- Nie podano modelu CPU, ponieważ nie zapisano go w przywołanym źródle. Nie zadeklarowano formalnej kwalifikacji GPU ani pomiaru pamięci predykcji.
- Nie sumowano 161 testów wersji kampanii z 202 testami późniejszej wersji A/B ani z liczbą funkcji testowych. Nie wstawiono ścieżek modułów i pól technicznych do załącznika.
- Nie przepisano pełnych sum źródeł i dat redakcji do rozdziałów 4–5. Przypis z rewizją dotyczy definicji przestrzeni, nie całego wykonania.

## Pomiary przed i po

Pomiar przybliżony, tą samą metodą po obu stronach: słowa alfabetyczne, z zachowaniem polskich znaków i słów z łącznikiem, po usunięciu wzorów między `$`, komentarzy, nazw komend oraz argumentów odsyłaczy, cytowań i ścieżek. Uwzględniono tekst tabel i nagłówków. Krótkie zdania liczono oddzielnie w akapitach prozy, z pominięciem tabel i bloków zaczynających się komendą. Podział po kropce jest przybliżony ze względu na skróty i liczby. Wynik służy porównaniu kierunku zmian, nie jest licznikiem słów wyrenderowanego PDF.

| Miara | R. 4 przed | R. 4 po | R. 5 przed | R. 5 po |
| --- | ---: | ---: | ---: | ---: |
| Słowa | 3719 | 4026 | 2359 | 2149 |
| „się” | 40 | 47 | 40 | 24 |
| „się” na 1000 słów | 10,76 | 11,67 | 16,96 | 11,17 |
| Zdania krótsze niż 8 słów | 20 | 15 | 14 | 12 |
| Wszystkie segmenty zdaniowe prozy | 244 | 251 | 141 | 132 |
| `\texttt` / `\path` | 5 | 5 | 59 | 6 |
| Średniki poza matematyką | 3 | 0 | 2 | 0 |
| Średniki łącznie z matematyką | 5 | 2 | 4 | 7 |

Rozdział 5 spełnia cele 2000–2400 słów, mniej niż 13 „się” na 1000 słów i najwyżej 12 oznaczeń kodowych. Pozostało pięć nazw bibliotek oraz jedna ścieżka w przypisie z rewizją. W obu rozdziałach nie ma „należy”. Średniki pozostały wyłącznie jako separatory matematyczne, w tym w przedziałach tabeli zgodnie z punktem 4.19. Rozdział 4 urósł wskutek uzupełnienia wymaganych reguł, bez rozszerzenia zakresu badania.

## Kontrole końcowe

- Sprawdzono wspólne liczby: 3132, 14 976, 3600 s, cztery wątki, partia predykcji 4096, 26 kandydatów i osiem foldów. Liczby i reguły korekt zestawiono z faktami przekazanymi w zleceniu.
- Brak znaczników TODO, „Do uzupełnienia”, „jeszcze” i „należy” w rozdziałach 4–5. Szerokie wyszukiwanie ze zlecenia trafia w datę będącą częścią numeru wersji AutoGluon i w dopuszczony przypis z rewizją. Wariant bez granic słowa i bez rozróżniania wielkości liter dopasowuje też ciąg „todo” w słowie „metodom”. Żadne z tych trafień nie jest śladem procesu redakcyjnego.
- Każda etykieta rozdziału 5 została zachowana. Nie ma duplikatów etykiet ani odsyłaczy bez celu w sprawdzonych rozdziałach i źródłach rysunków. Wszystkie użyte klucze cytowań istnieją w bibliografii. Nie dodawano nowych pozycji ani twierdzeń literaturowych wymagających nowej kwerendy.
- `sec:przygotowanie-procedura` nie występuje w manuskrypcie. Jedyna zmiana w rozdziałach 1–3 to wskazany odsyłacz w rozdziale 3. Bibliografia i szablon pozostały bez zmian.
- Nie stwierdzono serii kolejnych akapitów opartych na jednym nowym otwarciu typu „ponieważ”, „aby”, „przyjęto” czy „opisuje się”. Zachowano prozę bezosobową, przeplataną podmiotami rzeczowymi.
- `bash regen-pdf.sh` zakończyło się powodzeniem. Wynik: `build/wut/main.pdf`, 56 stron. Końcowy log nie zawiera `undefined`, `Overfull` ani błędów LaTeX. Skontrolowano wizualnie strony z pięcioma tabelami rozdziału 5. Poprawiono ich umieszczenie, aby pierwsza tabela nie poprzedzała tytułu rozdziału, a tabela wersji nie zajmowała samotnej strony.
- Rozdziały 6–7 nie wchodzą do `main.tex`, więc ich zmiany sprawdzono tekstowo i przez kontrolę etykiet. Nie deklaruje się ich kompilacji w ramach tego zlecenia, które ogranicza kompilację do `bash regen-pdf.sh`.
- `git diff --check` przeszedł. Nie wykonano commita ani instalacji zależności.
- `mgr-repo` pozostało tylko do odczytu. `git --no-optional-locks diff --stat` nie wykazało zmian śledzonych plików przed ani po pracy, HEAD pozostał `e09cf5f`. Nie wykonano sugerowanego w części 8 polecenia `status`, ponieważ część 0 zlecenia zabrania go i dopuszcza tylko zamkniętą listę poleceń Git. Brak zmian nieśledzonych nie był niezależnie sprawdzany.

Rozdziały 4–5 można przekazać do oceny promotora jako opis metodyki i środowiska. Nie oznacza to zakończenia bootstrapu badania głównego, opracowania A/B ani uzupełnienia chronologii szczegółowych reguł analizy w rozdziale 6.
