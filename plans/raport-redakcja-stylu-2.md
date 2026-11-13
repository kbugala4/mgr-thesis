# Druga runda redakcji stylu rozdziałów 1–5

Podstawa: `redakcja-stylu-2.md`. Porównanie ze stanem `139c49090b2a864c44181da3ff47455c0d198f8f`. Zachowano kolejność pracy: 4, 2, 5, 3, 1. Zmieniono pięć rozdziałów; jedynym nowym plikiem jest niniejszy raport. Zmiany pozostają bez commitu.

## 1. Pomiary przed i po

Oryginalne skrypty `appendices/stylometry-check.py` i `appendices/corpus-compare.py` nadal nie są dostępne. Zastosowano metodę pomocniczą z [raportu pierwszej rundy](raport-redakcja-stylu.md), rozszerzoną o liczenia wymagane w drugim zleceniu. Wyników nie należy utożsamiać z pomiarami korpusu recenzenta.

| Rozdział | Akapity ze zdaniem >25 słów [%] | zatem / więc / dlatego [liczba] | Otwarcia imiesłowem [liczba] | Otwarcia „Przy” [liczba] | pozostaje / pozostają [liczba] | Zastrzeżenia [%] | Średniki / 1000 słów |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 01 | 28.6 → 28.6 | 4 → 2 | 3 → 1 | 0 → 0 | 3 → 2 | 1.8 → 1.8 | 0.0 → 0.0 |
| 02 | 10.9 → 10.9 | 15 → 9 | 4 → 3 | 5 → 3 | 6 → 3 | 4.4 → 4.4 | 0.38 → 0.38 |
| 03 | 5.0 → 7.5 | 8 → 5 | 2 → 1 | 8 → 8 | 2 → 2 | 4.5 → 4.5 | 0.54 → 0.53 |
| 04 | 8.2 → 14.3 | 11 → 8 | 2 → 0 | 5 → 1 | 8 → 4 | 6.5 → 6.8 | 0.0 → 0.0 |
| 05 | 6.5 → 9.7 | 5 → 3 | 0 → 0 | 6 → 3 | 3 → 2 | 7.1 → 6.5 | 0.56 → 0.56 |
| Łącznie | 9.4 → 12.2 | 43 → 27 | 11 → 5 | 24 → 15 | 22 → 13 | 5.3 → 5.2 | 0.31 → 0.31 |

W każdej komórce podano „przed → po”. Udział akapitów z długim zdaniem wzrósł umiarkowanie, bez wprowadzania takiego zdania do większości akapitów. Otwarcia imiesłowowe zmniejszono o około połowę, a otwarcia „Przy” i łączną liczbę spójników wnioskowych o nieco ponad jedną trzecią. W rozdziale 4 odsetek zdań ze wzorcem zastrzeżenia wzrósł wskutek zmniejszenia liczby zdań; nie dodano tam nowego zastrzeżenia wykrywanego przez zastosowany wzorzec. Łączny udział tych zdań lekko spadł.

Redukcja poszczególnych spójników nie była proporcjonalna: w źródłach „zatem” występuje 17→9 razy, „więc” 14→5, a „dlatego” 12→13. Usuwano przede wszystkim zbędne sygnały wynikania, zachowując związki przyczynowe i wyprowadzenia. Nie zastępowano usuniętych „zatem” i „więc” słowem „dlatego”; jedno nowe „dlatego” łączy ograniczoną moc z ostrożnością interpretacji w akapicie statystycznym. Nie wyrównywano proporcji sztucznie.

Do rozszerzenia pomiaru wykorzystano te same oczyszczone akapity i reguły segmentacji co w pierwszym raporcie. Akapit zaliczano do długich, jeśli choć jedno jego zdanie miało ponad 25 słów liczonych jako ciągi liter. Otwarcia imiesłowowe wykrywano przez pierwsze słowo zakończone na „ąc”, a „Przy” jako całe pierwsze słowo zdania. Pozostałe wskaźniki leksykalne liczono jako całe słowa, bez rozróżniania wielkości liter. Pomiar pomija matematykę, tabele, ilustracje, listy, odwołania i identyfikatory techniczne; skróty i przypisy mogą zakłócać segmentację zdań. Różnice względem liczb ze zlecenia wynikają z użycia tej metody pomocniczej.

## 2. Rozstrzygnięcia dla wszystkich kandydatów rytmicznych

Numery linii dotyczą bieżących źródeł. Ostatecznie zmieniono rytm **8 z 15** wskazanych akapitów, w tym wszystkich trzech priorytetowych. Nie zmieniono kolejności akapitów ani sekcji.

| Miejsce | Decyzja i rozpoznana sytuacja |
| --- | --- |
| `04-metodyka.tex:213`, wnioskowanie | Zmieniono. Warunki decyzji o wnioskowaniu połączono z ograniczeniem wynikającym z doboru zadań. Zachowano wszystkie sześć twierdzeń. Nie dodano z przykładu nowej reguły, że testy zawsze mają charakter pomocniczy. |
| `04-metodyka.tex:219`, braki | Zmieniono. Obowiązek raportowania liczby wyników połączono z powodem: selekcją zadań przy analizie kompletnych par. Oddzielono tę kwestię od interpretacji wartości p. |
| `04-metodyka.tex:154`, AP | Zmieniono. Wybór miary połączono z uzasadnieniem przez „ponieważ”. Definicja i rozróżnienie od pola trapezowego pozostały jawne. |
| `04-metodyka.tex:67`, KNN | Zmieniono. Do określenia wyjątku dołączono definicję stosowanej walidacji. Zachowano osobne zdanie o granicy wyłączania informacji i dodano zlecone wyjaśnienie selekcji. |
| `04-metodyka.tex:116`, zespoły | Zmieniono. Definicje poziomów agregacji połączono w jedno wyliczenie po dwukropku. Krótkie zdanie o ich współwystępowaniu zachowano. |
| `04-metodyka.tex:76`, partie | Bez zmian. Kolejne zdania opisują wspólną regułę, mnożnik oraz odmienne ograniczenia dwóch metod. Ich scalenie zacierałoby podział warunków. |
| `04-metodyka.tex:45`, identyfikatory danych | Bez zmian. Poszczególne zdania dotyczą różnych zbiorów i przyczyn traktowania cech; nie tworzą jednej procedury. |
| `02-stan-badan.tex:137`, trzy obszary oceny | Bez zmian. Wyliczenie rozdziela ranking, prawdopodobieństwa i decyzje. Następnie objaśnia się inne pojęcia: AUC, precyzję i symbole macierzy pomyłek. |
| `02-stan-badan.tex:57`, ModernNCA i TabM | Zmieniono. Opis mechanizmu każdej metody połączono z jego objaśnieniem. Zachowano krótkie zdanie otwierające akapit. |
| `02-stan-badan.tex:192`, entropia i dywergencja | Bez zmian. Równanie jest już zakończonym zdaniem; objaśnienie symboli, własności składników i wniosek stanowią czytelne kroki wyprowadzenia. Zachowano też „zatem” we wniosku. |
| `02-stan-badan.tex:207`, eksperymenty uzupełniające | Bez zmian. Dwa eksperymenty mają różne interwencje i kryteria oceny. Zachowano także krótkie zamknięcie i odsyłacz. |
| `05-srodowisko.tex:92`, awarie | Zmieniono. Opis postępowania po awarii połączono z konsekwencją dla kodu zakończenia. Warunek odrębnego raportowania zestawiono w jednym zdaniu z przypadkami blokującymi raport. |
| `05-srodowisko.tex:53`, Parquet i źródła | Bez zmian. Format przechowywania, identyfikacja źródeł, pobieranie Santander i kontrola zgodności są odmiennymi informacjami. |
| `03-metody.tex:172`, TabPFN | Bez zmian. Akapit zawiera już zapis inferencji z objaśnieniem wag i kontekstu. Kolejne scalenie utrudniałoby rozdzielenie pretrenowania, kontekstu i założeń indukcyjnych. |
| `01-wstep.tex:27`, odniesienia konwencjonalne | Zmieniono. Do decyzji o doborze różnych reguł predykcji dołączono ich konkretne wyliczenie, objaśniające zakres tego doboru. |

## 3. Świadomie zachowane konstrukcje i terminy

- Otwarcia imiesłowowe zachowano w `01:10` („Dobierając reprezentację”), `02:10` („Definiując zadanie”), `02:59` („Porównując ten model”), `02:133` („Badając wpływ”) i `03:8` („Dobierając metody”). Opisują wykonywaną czynność; po zmianie sąsiednich miejsc nie tworzą już serii podobnych otwarć.
- „Przy” pozostawiono przy istotnych warunkach: narzuconej reprezentacji, przygotowaniu danych i stałej liczbie epok (`02:36,46,133`); ocenie MLP, konwencji dropoutu, pominięciu gradientu, wymiarze tokenu, zadanej metryce i dokładnej predykcji (`03:73,75,89,112,141,151`); poprawnym zatrzymaniu (`04:81`); kontroli wznowienia i konkretnym limicie pamięci (`05:90,120`). Wystąpienia w `03:46,165` i `05:61` należą ponadto do fragmentów chronionych.
- „Zatem” zachowano w wyprowadzeniach `02:169,176,192`, a także tam, gdzie zaznacza wniosek lub należy do chronionego fragmentu. Pozostawiono przyczynowe „dlatego” m.in. przy rozdzieleniu walidacji i testu (`04:53`), miękkim limicie czasu (`04:81`) i wspólnym koszcie wyszukiwania (`04:248`). Nie przeredagowano chronionego zdania CatBoost (`03:68`).
- „Pozostaje / pozostają” zachowano dla nierozstrzygniętego pytania i możliwego rozszerzenia (`01:18,31`), zakresu porównania i niezmienionej liczby decyzji (`02:79,192`), rozróżnienia pytań (`02:120`), zewnętrznego kosztu RealMLP i utrzymania miękkiej agregacji w predykcji (`03:136,149`), wewnętrznego zespołu, dopuszczenia wyników, kosztu awarii oraz stałej walidacji i testu (`04:110,114,177`), pustego pola kosztu i zewnętrznego pretrenowania (`05:125,144`).
- „W przypiętej implementacji” (`04:112`) wiąże opis zachłannej selekcji z konkretną wersją kodu. Podpis tabeli „Wybrane przypięcia zależności środowiska” (`05:166`) nazywa jej zawartość. Termin objaśniono przy pierwszym użyciu w opisie TabM (`03:167`), a w innych miejscach zastosowano skreślenie lub opis wersji.
- „Nadpisania” w tabeli konfiguracji (`05:29`) zachowano jako krótki termin techniczny; w opisie strojenia zastąpiono je zmianami zadanymi w konfiguracji (`04:74`). „Nadpisanie cechy” (`05:55`) oznacza natomiast nadpisanie danych, więc zastąpienie go ustawieniami domyślnymi zmieniłoby sens.
- „Liczność treningu” zachowano w krótkim opisie zależności (`02:133`), w nagłówku (`04:171`, zakaz zmiany nagłówków) i w odsyłaczu do schematu (`04:179`). Pełniejsze formy wprowadzono w opisie Bioresponse, benchmarku i projektu badania B.
- Angielskie `precision--recall` pozostało wyłącznie jako objaśnienie polskiego terminu przy pierwszym użyciu (`02:155`). Wyrażenia „reżim” w prozie, „W obrazie” i „estymatory inferencji” usunięto ze wszystkich wskazanych miejsc. Etykieta `sec:trudne-rezimy` jest identyfikatorem i pozostała bez zmian.
- Termin `checkpoint` w tabeli (`03:30`) pozostawiono krótki, a objaśniono go w opisie modelu (`03:176`), zgodnie z dopuszczonym wariantem zlecenia. Wyjaśniono również `smoke` (`05:155`).

## 4. Kontrola nowych powtórzeń

Poniżej liczby wystąpień w źródłach rozdziałów, po ujednoliceniu twardych spacji i wielkości liter.

| Konstrukcja | Przed | Po |
| --- | --- | --- |
| W porównaniu z | 0 | 0 |
| Gdy | 6 | 7 |
| w ustalonej wersji | 0 | 1 |
| W ocenie | 0 | 1 |
| przy czym | 0 | 1 |
| jest przypisany | 0 | 1 |
| jest powiązany | 0 | 1 |
| czyli | 4 | 5 |

Z badanych konstrukcji ponad dwa wystąpienia mają „gdy” i „czyli”. W obu przypadkach wzrost wynosi jedno wystąpienie: pierwsze w opisie budżetu, drugie w objaśnieniu przypięcia wersji. Nie wprowadzono serii zdań rozpoczynanych tak samo. Część form „pozostaje” zastąpiono zwykłym „jest”, część przebudowano na czynność, a pozostałe zachowano. Nie wyrównywano użycia spójników przeciwstawnych ani słów rozdzielania.

## 5. Uzupełnienie o KNN i podstawa sprawdzenia

Zdanie w `04-metodyka.tex:67`:

```latex
W~zadaniach IID wybór konfiguracji KNN w~warunku T i~wag zespołu w~T+E opiera się na predykcjach LOO zamiast na predykcjach OOF z~ośmiu foldów stosowanych w~pozostałych metodach strojonych.
```

Doprecyzowanie rozdziela wybór konfiguracji w T i wybór wag w T+E. Ograniczono porównanie do pozostałych metod strojonych, aby nie objąć nim stałego TabPFN.

Podstawą są [protokół](../../mgr-repo/docs/tabarena-evaluation.md), wiersz wyjątku KNN i opis wariantów raportowania, oraz [stan implementacji](../../mgr-repo/docs/implementation-status.md), część o natywnym LOO. W `src/tabular_thesis/experiments/backend.py:134` repozytorium eksperymentów włącza się `use_child_oof` dla `evaluation == "loo"` wyłącznie przy braku grup. Raporter (`experiments/reporting.py:79–99`) wykorzystuje zapisane predykcje walidacyjne zarówno do wyboru T, jak i dopasowania wag T+E. Nazwa techniczna `oof_probabilities` obejmuje tu także natywne predykcje LOO.

Tabela `tab:warunki` podaje ogólną regułę wyboru na predykcjach walidacyjnych pod nazwą OOF; dopisek jawnie określa jej wyjątek dla IID KNN. W równaniu `eq:zespol-konfiguracji` i jego objaśnieniu zachowano pojedyncze dopasowanie KNN w miejsce średniej foldów. Nie zmieniono tabeli ani równania.

Objaśnienie ośmiu predykcji TabPFN sprawdzono w lokalnej dokumentacji parametru `n_estimators` w `.venv/lib/python3.11/site-packages/tabpfn/classifier.py:300–304`: biblioteka łączy wyniki kolejnych przejść z różnymi danymi wejściowymi. Domyślne `average_before_softmax=False` oraz kod agregacji potwierdzają uśrednianie prawdopodobieństw. Konfiguracja `configs/model/tabpfn.yaml` określa osiem składników. Jest to kontrola opisu implementacji, nie wynik uruchomienia modelu.

## 6. Kontrola treści i kompilacji

Po każdym rozdziale sprawdzono odwołania i chronione elementy. Końcowa kontrola potwierdziła:

- zachowanie liczb zapisanych cyframi, wzorów, 15 równań, nagłówków, komentarzy TODO oraz wszystkich wystąpień `\label`, `\ref`, `\cite`, `\texttt` i `\path`;
- zachowanie wszystkich sześciu chronionych fragmentów, z jedyną zleconą zamianą „Dla ilustracji” na „Na przykład”;
- zachowanie 19 obowiązkowych ograniczeń z pierwszego zlecenia, w tym niepewności warunkowej, granic LOO, interpretacji klas, budżetów i pamięci;
- brak nierozwiązanych cytowań i etykiet; zachowano 86 etykiet, 46 odwołań, 69 miejsc cytowania i 29 kluczy bibliograficznych;
- zachowanie struktury i kolejności akapitów oraz brak zmian w plikach poza pięcioma rozdziałami i tym raportem;
- brak błędów `git diff --check`.

Wykonano oba skreślenia z zadania 5. Po usunięciu zdania o dowodzie weryfikacji informację o rewizji programu, danych i środowisku zachowano w następnym zdaniu. Nie usuwano innych krótkich zamknięć akapitów.

Kompilacja `bash regen-pdf.sh` zakończyła się powodzeniem. [PDF](../build/wut/main.pdf) ma 47 stron. Końcowy log nie zawiera błędów odwołań, cytowań ani komunikatów `Overfull`; pozostało osiem komunikatów `Underfull \vbox`. Obejrzano strony 30, 32 i 38 z redagowanymi fragmentami oraz tabelami i schematami; nie stwierdzono obcięcia treści.

Nie uruchamiano eksperymentów ML ani pełnego audytu literatury. Oryginalne pomiary recenzenta i pełna kontrola typograficzna wszystkich stron pozostają poza wykonaną weryfikacją.
