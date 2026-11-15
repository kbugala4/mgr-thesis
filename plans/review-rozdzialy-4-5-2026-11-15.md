# Rozdziały 4–5: uwagi i zlecenie niezależnej weryfikacji

Data: 2026-11-15. Odbiorca: reviewer nadzorujący aktualną kampanię eksperymentalną.

## 1. Cel, zakres i sposób użycia

Celem jest przygotowanie rozdziałów 4 „Metodyka badań” i 5 „Środowisko eksperymentalne i odtwarzalność” do przekazania promotorowi, a następnie do zamknięcia ich treści. Dokument zbiera uwagi merytoryczne, dowodowe, implementacyjne, stylistyczne i redakcyjne. Zawiera również kwestie wymagające sprawdzenia na maszynie treningowej, do której autor tej recenzji nie zaglądał.

**Rozdziały 1–3 są zamknięte decyzją autora i pozostają poza zakresem.** Nie należy ponownie oceniać całej pracy ani rozszerzać puli metod i zbiorów. Ocena dotyczy tekstu oraz zgodności opisanego badania z wykonaniem. Nie jest zleceniem zmiany trwających treningów.

Rozdział 4 ma wystarczającą podstawę do konsultacji metodycznej, lecz wymaga zamknięcia reguł analizy i powiązania ich z wykonaniem. Rozdział 5 opisuje platformę, lecz nie dokumentuje jeszcze dostatecznie jej kwalifikacji na maszynie kampanii ani realizacji A/B. Brak końcowych wyników jakości modeli sam w sobie nie blokuje ukończenia tych dwóch rozdziałów.

Prośba do reviewera: zweryfikować poniższe ustalenia niezależnie, porównać je z rzeczywistą rewizją kampanii i wskazać minimalną korektę tekstu lub brakujący artefakt. Nie potwierdzać uwag wyłącznie dlatego, że występują w tym dokumencie. Przy rozbieżności należy podać dowód i skorygować ocenę.

### Priorytety i status dowodu

- **P0 — przed zależnym etapem badania:** rozstrzygnięcie może wpływać na ważność analizy, kompletność rejestrowanych danych lub izolację kampanii. Nie oznacza automatycznie konieczności zatrzymania wszystkich treningów.
- **P1 — przed uznaniem rozdziału za zamknięty:** brak dowodu, niepełna specyfikacja albo istotna nieścisłość opisu.
- **P2 — redakcja:** poprawa języka, organizacji lub czytelności bez zmiany projektu badania.

**Potwierdzone** oznacza błąd lub lukę widoczną w odczytanym tekście/kodzie. **Do weryfikacji** oznacza pytanie o rzeczywiste wykonanie. **Zalecenie** oznacza proponowane doprecyzowanie, nie stwierdzoną awarię. Stwierdzenie braku informacji w lokalnym repozytorium nie dowodzi braku tej informacji na maszynie kampanii.

## 2. Podstawa i granice przeglądu

Odczytano całe [rozdział 4](../chapters/04-metodyka.tex) i [rozdział 5](../chapters/05-srodowisko.tex), właściwe dokumenty zakresu oraz materiały przekazania. Sprawdzono wybrane fragmenty kodu przygotowania danych i metryk. Nie wykonano nowego audytu literatury ani pełnego audytu implementacji.

| Materiał | Rola |
| --- | --- |
| [Temat pracy](../../mgr-repo/docs/thesis-topic.md) | Nadrzędny zakres naukowy |
| [Dobór metod](../../mgr-repo/docs/study-model-selection.md), [dobór danych](../../mgr-repo/docs/dataset-selection.md) | Przyjęta pula metod i zadań |
| [Protokół](../../mgr-repo/docs/tabarena-evaluation.md) | Autorytatywna dokumentacja badania, lokalnie nadal ze starszym opisem A/B |
| [Stan implementacji](../../mgr-repo/docs/implementation-status.md) | Udokumentowane sprawdzenia i otwarte warunki kwalifikacji |
| [Decyzje A/B](../appendices/badania-ab-materialy-2026-11-15.md) | Pochodzenie nowszego projektu; dokument wewnętrznie datowany na 2026-11-14 |
| [Plan zmian w eksperymentach](zmiany-mgr-repo-badania-ab.md) | Instrukcja implementacji i kwalifikacji, nie dowód jej wykonania |
| [Raport zmian tekstu](raport-zmiany-tekst-badania-ab-2026-11-15.md) | Zakres wcześniejszej redakcji i świadome doprecyzowania względem decyzji |

Numery linii poniżej dotyczą następującej migawki:

```text
mgr-thesis HEAD: 3d7edc6f4c6148d8cd25e9a1a5e4c7398116a595
mgr-repo   HEAD: 79299f573975b45052803d8f26c350f10446e332

SHA-256 chapters/04-metodyka.tex:
1d12297501bf4f0fc0d4f2cc87600b9cabba621a4e8f52399b2998f3a71a627f
SHA-256 chapters/05-srodowisko.tex:
c4ed32b89bb171d44e73cb0f4d7d83eac5cf8dbbdb7cefdc149350f03f640216
SHA-256 ../mgr-repo/docs/tabarena-evaluation.md:
343642a201ffe97b9a715ac92fbc23359b1a1cd900ae79438e9976ad71bcc1c9
SHA-256 ../mgr-repo/docs/implementation-status.md:
bf98e5f8e45863c9cee63e3af560280cfae603ce98734cd377fbc1172e0bce4e
```

Lokalne drzewa zawierają także zmiany i materiały nieśledzone. Sam HEAD nie identyfikuje całego przekazania. W szczególności decyzje A/B i plany należy dostarczyć reviewerowi jako pliki, jeśli nie ma do nich dostępu. Część nazw w starszym przekazaniu jest nieaktualna: istniejący dokument decyzji podano powyżej. Wymienionych tam skryptów selekcji i pełnych pierwotnych artefaktów nie uzyskano w tym przeglądzie.

## 3. Kwestie wspólne dla tekstu i trwającej kampanii

### W01 — Zgodność wersji projektu, kodu i wykonania

**P0; potwierdzona rozbieżność dokumentów, stan wykonania do weryfikacji.** Lokalny protokół w sekcji „Required targeted studies” nadal przewiduje trzy metody w A, trzy warianty w B oraz opublikowaną recepturę MLP. Rozdział 4 opisuje MLP i CatBoost w A oraz cztery warianty konfiguracji 21 w B. Różnią się także kryteria walidacyjne i liczby dopasowań.

Reviewer powinien wskazać osobno dla kampanii głównej, A i B: rewizję, identyfikator badania, wersję planu oraz stan „planowane / zaimplementowane / zakwalifikowane / uruchomione / zakończone”. Następnie uzgodnić autorytatywny protokół z zaakceptowanymi decyzjami. Tekst musi opisywać wykonanie albo jawnie przyjęty plan, bez sugerowania ukończonej implementacji. Nie należy automatycznie cofać tekstu do starszego protokołu.

### W02 — Izolacja zmian od działającej kampanii

**P0; do weryfikacji.** Decyzja U4 i sekcja 0 planu implementacji wskazują, że skrót źródeł wpływa na tożsamość badania, a moduły mogą być importowane dopiero podczas wykonania. Zmiana kodu w katalogu działającego procesu może naruszyć identyfikowalność lub możliwość zgodnego wznowienia.

Należy ustalić, z jakiego katalogu i źródeł działają treningi, gdzie powstaje implementacja A/B i jak zachowano wyniki kampanii głównej. Zmiany redakcyjne nie uzasadniają modyfikacji kodu działających procesów. Jeżeli potrzebna jest poprawka wykonania, reviewer powinien wskazać jej rzeczywisty zakres i dotknięte przebiegi, bez domyślnego zlecania pełnego ponowienia kampanii.

### W03 — Moment zamrożenia analizy i dostęp do testu

**P0; rozdz. 4:160, 171–179, 265; do weryfikacji.** Tekst wymaga zatwierdzenia analizy przed odczytem wyników testowych A/B. Należy wskazać datę i rewizję reguł, moment pierwszego odczytu wyników oraz sposób oddzielenia wyboru konfiguracji, diagnostyki OOF i decyzji o kontroli od analizy testowej.

Jeżeli test był już analizowany, trzeba jawnie rozdzielić decyzje wcześniejsze i późniejsze. Późniejszego wyboru nie wolno opisywać jako uprzednio ustalonego. Nie ma potrzeby ponownego otwierania testu w celu rozstrzygnięcia większości uwag do metodyki.

### W04 — Dane, które trzeba zachować przed usunięciem modeli

**P0; rozdz. 4:169–175, 202–235; rozdz. 5:94; do weryfikacji.** Rozdział 4 wymaga historii ważonej i nieważonej straty, straty treningowej w trybie ewaluacji, norm parametrów, wybranych stanów i liczby aktualizacji. Rozdział 5 opisuje usuwanie modeli po próbie, ale nie wskazuje trwałych artefaktów A/B.

Reviewer powinien sprawdzić, czy potrzebne historie rzeczywiście opuszczają tymczasowy katalog dopasowania i podlegają kontroli integralności. Zapis ma obejmować zbiór, wariant, ziarno, fold, podzbiór, epokę/krok, wybrany stan i przyczynę zatrzymania. Samo posiadanie końcowych predykcji nie pozwala odtworzyć tych pomiarów. Jeżeli czegoś nie zapisano, należy najpierw określić, które analizy są niemożliwe i czy pomiar da się odzyskać; dopiero potem oceniać potrzebę ponowienia konkretnych prób.

## 4. Rozdział 4 — uwagi merytoryczne i dowodowe

### M01 — Audyt danych: procedura nie zastępuje wyniku

**P1; linie 17–45, 63; potwierdzona luka w tekście.** Rozdział wymienia czynności audytu, ale nie podaje rozstrzygnięć dla wszystkich zadań. Szczególnie niejasne pozostają powtarzające się encje Amazonu, zależności przestrzenne Covertype, duplikaty, brakujące wartości oraz dostępność cech w chwili predykcji. Dokument doboru danych także pozostawia część tych spraw otwartą.

Potrzebny jest identyfikowalny rejestr audytu: źródło i wersja, hash przygotowanych danych, rzeczywiste liczności, wyłączenia cech/wierszy, mapowanie klas, duplikaty, grupy, uzasadnienie podziału i ograniczona populacja wnioskowania. W rozdziale wystarczy syntetyczny wynik i odsyłacz. Dla Diabetes należy wskazać rzeczywiste potwierdzenie rozłączności pacjentów. Nie należy wprowadzać nowego podziału w trakcie kampanii bez rozpoznania konsekwencji; ograniczenie wniosku może być właściwą odpowiedzią.

### M02 — Przestrzenie strojenia i kompletna definicja T

**P1; linie 74–78, 96, 173; potwierdzona luka odtwarzalności opisu.** Samo wskazanie plików YAML i generatorów nie określa zakresów, rozkładów losowania ani wszystkich stałych parametrów. Niższy indeks rozstrzyga remis selekcji dla A; analogiczna reguła głównego T nie jest wprost podana.

Należy dostarczyć wersjonowany dodatek lub manifest z domyślnymi wartościami, przestrzeniami, rozkładami, ziarnem oraz efektywnymi kandydatami po rozwiązaniu konfiguracji. W tekście podać odsyłacz i regułę remisów zgodną z raporterem. Sprawdzić, które wyniki należą do przestrzeni po zmianie automatycznych partii z 12 listopada. Nie mieszać starych i nowych losowań pod wspólnym określeniem T.

### M03 — Próg F1 nie obejmuje wszystkich decyzji

**P0 przed analizą progową; linia 177; potwierdzony problem definicji.** Punkty środkowe między unikalnymi wartościami pomijają decyzję „alarm dla wszystkich”, która może maksymalizować F1. Przy stałych predykcjach zbiór kandydatów jest pusty.

Przykład niezależny od danych badania: etykiety `[1, 0]`, prawdopodobieństwa klasy rzadkiej `[0.1, 0.2]`. Jedyny środek, `0.15`, alarmuje wyłącznie dla klasy częstej i daje F1 = 0. Próg `0.1` alarmuje dla obu obserwacji i daje F1 = 2/3.

Należy zamrozić kompletną rodzinę rozróżnialnych decyzji wraz z przypadkami skrajnymi, regułą remisów i reprezentacją progu. Można zachować środki, dodając jawne progi skrajne, albo przyjąć inną pełną rodzinę. Wybór reprezentacji ma znaczenie przy przeniesieniu progu na test. Potwierdzenie wymaga małych sprawdzeń syntetycznych, nie ponownego treningu.

### M04 — „Najmniejszy próg” dla FPR ≤ 1%

**P0 przed analizą progową; linia 179; potwierdzona niepełna specyfikacja.** Przy alarmie `p ≥ t` i progach z całej osi rzeczywistej najmniejszy dopuszczalny próg może nie istnieć. Gdy trzeba wyłączyć grupę negatywnych obserwacji o wyniku `a`, dopuszczalne mogą być wszystkie `t > a`, bez najmniejszego elementu.

Należy wskazać skończony zbiór kandydatów, obsługę remisów, przypadek braku alarmów oraz regułę obliczania dozwolonej liczby FP. Próg wybrać na OOF i bez zmian zastosować do testu. Testowe FPR może przekroczyć 1%; warunek na OOF nie jest gwarancją dla nowej próby. Dowód zamknięcia: zapis reguły, sprawdzenia remisów i stałych predykcji oraz identyczna implementacja w analizie.

### M05 — Brak alarmów: konwencja F1 i zgodność rozdziałów

**P1; linia 177 oraz rozdz. 5:150; potwierdzona rozbieżność wymagająca jawnego rozdzielenia.** Rozdział 4 zapisuje F1 jako brak wartości przy braku alarmów, a ogólny moduł metryk stosuje `zero_division=0`. Nie jest to automatycznie błąd kodu: analiza A może mieć odrębną konwencję, ale należy ją zaimplementować i opisać.

Gdy występują przykłady dodatnie, przy braku alarmów F1 z definicji `2TP/(2TP+FP+FN)` wynosi 0. Nieokreślona jest wtedy precyzja. Reviewer powinien rozstrzygnąć, czy brak F1 jest świadomą konwencją prezentacji, czy wymaga korekty. Trzeba też określić jej wpływ na wybór progu, średnie i bootstrap, aby brak wartości nie prowadził do cichego pomijania niekorzystnych warunków.

### M06 — Konfiguracje źródłowe badania A

**P0 przed zależnymi uruchomieniami A; linia 173; do weryfikacji.** Przekazanie pozostawia konfiguracje T CatBoost dla Credit Card Fraud i Santandera do ustalenia po ukończeniu odpowiednich przebiegów. To historyczny stan przekazania, nie potwierdzenie ich obecnej niedostępności.

Potrzebne są identyfikatory źródłowych zadań, wybrany indeks, pełne parametry, kompletność puli kandydatów i dowód wyboru wyłącznie według OOF AUC. Weryfikować należy konfigurację efektywną, nie jej zaokrąglony opis. Należy też wyraźnie odróżnić ponowne uczenie A z trzema ziarnami i dużym limitem czasu od ponownego użycia wyników T z kampanii głównej.

### M07 — Co mierzy ważenie, a co reguła wyboru stanu

**P1; linie 169–175; zalecenie i weryfikacja wykonania.** Główny kontrast A zmienia stratę uczenia oraz kryterium walidacyjne. Opis zawiera kontrolę warunkową, co należy zachować. Różnicy głównej nie należy nazywać czystym efektem zmiany samej straty.

Potwierdzić stosowanie wag wyłącznie wyznaczonych z treningu foldu, sposób normalizacji ważonej straty oraz rzeczywiste kryterium wyboru MLP i CatBoost. Dla reguły 12 z 24 ustalić numerowanie epok/iteracji, remisy minimów, brakujące lub nieudane dopasowania i uwzględnienie minimum na końcu uciętej krzywej. Przy niepełnych 24 zapisach nie wolno samoczynnie zmieniać mianownika. Dowodem powinny być historie i tabela decyzji o kontroli, utworzone przed analizą testu.

### M08 — Diagnostyka niestabilności: operacyjność i interpretacja

**P1; linia 175; zalecenie.** Wskazane kryteria są sygnałami, nie dowodami przyczyny pogorszenia. Obecny tekst poprawnie ogranicza interpretację; starszy dokument decyzji formułuje silniejsze przypisanie optymalizacji.

Należy doprecyzować agregację „większości foldów” przez trzy ziarna oraz zachowanie przy zerowym rozstępie AP kontroli i brakujących przebiegach. Rozstęp AP ma pochodzić z OOF i być dostępny przed odczytem testu. Plan implementacyjny odkłada ten składnik do „pełnej analizy”; reviewer powinien sprawdzić rzeczywistą kolejność. Nie należy dopisywać nowych progów diagnostycznych po poznaniu efektów testowych.

### M09 — Komparator logitowy i miary uporządkowania

**P1; linie 179, 183–188; zalecenie doprecyzowania.** Zachować iloraz liczności klasy częstej i rzadkiej, także dla Amazonu z rzadką klasą o kodzie 0. Zachować kwalifikację, że przesunięcie średniej predykcji nie jest tym samym co średnia przesuniętych predykcji.

Do ustalenia w analizie pozostają obsługa `p=0/1`, logitów progów skrajnych, remisów rang i stałych predykcji oraz definicja udziału par o odmiennym porządku. Dla komparatora można wykorzystać równoważną postać `q = r*p/(1-p+r*p)`, gdzie `r=n_cz/n_rz`, zamiast bezpośredniego liczenia nieskończonych logitów. Należy sprawdzić wpływ zaokrągleń na remisy. AP/AUC są niezmiennicze względem ściśle rosnącej transformacji w dokładnej arytmetyce; nie należy rozszerzać tego twierdzenia na ponownie dobrany środek przedziału i jego testowe F1. Nie jest potrzebne nowe uczenie.

### M10 — Dowód selekcji konfiguracji 21

**P1, a przed wykonaniem B także kontrola konfiguracji wejściowej; linie 196–200; potwierdzona luka dowodowa.** Wartości „11 z 26”, „12,75” i liczba dopuszczonych kandydatów pochodzą z przekazania. Komentarz w LaTeX jawnie wskazuje brak pierwotnych skryptów i artefaktów w tym pakiecie.

Należy udostępnić skrypt lub dokładny algorytm, osiem nazw zbiorów, manifesty 26 kandydatów, tabelę ocen i rang OOF, reguły remisów/braków, wynik filtrowania oraz pełne parametry konfiguracji 21. Wyjaśnić wyłączenie Covertype i wskazać, kiedy zamrożono regułę. Zweryfikować, że selekcja nie wykorzystała zadań B ani testu. Konfiguracja 21 jest wyborem spośród dopuszczonych kandydatów, a nie zwycięzcą całego rankingu; tego ograniczenia nie usuwać.

### M11 — Budżet kroków, podzbiory i źródła zmienności B

**P1; linie 202–204; do weryfikacji i uzupełnienia.** Docelowe 1000/400/1800 kroków i wyjątek 1002 wymagają zgodności z rzeczywistą licznością foldów, zaokrągleniem klas, ostatnią partią i pętlą uczenia. Nominalny budżet nie dowodzi liczby wykonanych aktualizacji.

Potrzebna jest tabela lub artefakt dla każdego foldu, udziału i ziarna: liczności klas, indeksy podzbioru, partia, liczba epok, kroki docelowe i wykonane, stan wybrany oraz brak obcięcia czasowego. Potwierdzić identyczne podzbiory między wariantami i dopasowanie przekształceń wyłącznie na danym podzbiorze. Ponieważ ziarno zmienia także podzbiór, zmienność między ziarnami B obejmuje dobór przykładów i uczenie. Nie należy nazywać jej wyłącznie zmiennością inicjalizacji. Stała walidacja oznacza badanie liczności treningu, nie całkowitego budżetu etykietowania.

### M12 — Zanik wag i norma parametrów

**P1; linie 214–231; zalecenie ograniczenia interpretacji.** Rozdział poprawnie oddziela analityczne skurczenie bez gradientu od efektu uczenia. Należy zachować tę ostrożność także w analizie i odpowiedzi reviewera. Przedział stosunku norm `[0,98; 1,00]` jest przyjętą regułą diagnostyczną, a nie konsekwencją równania AdamW przy działających gradientach.

Potwierdzić stałe tempo uczenia lub uwzględnić rzeczywisty harmonogram, zakres parametrów objętych zanikiem i normą, moment pomiaru oraz sposób agregacji foldów. Doprecyzować, czy „wybrane stany” oznaczają osobno wybraną epokę każdego wariantu. Podobieństwo norm ani brak rozstrzygającej różnicy jakości nie dowodzą braku działania regularyzatora. Nie rozszerzać wniosku poza konfigurację 21 i badane budżety.

### M13 — Luka generalizacji i kontrola niedouczenia

**P1; linie 233–235; zalecenie doprecyzowania.** Zachować stratę treningową i walidacyjną tej samej sieci w trybie ewaluacji oraz rozdzielenie luki modelu foldu od testowej jakości zespołu. Należy potwierdzić, że strata treningowa dotyczy rzeczywiście użytego podzbioru i nie jest średnią strat z partii podczas uczenia z dropoutem.

Kryterium zmiany poniżej 1% w ostatnich 10% kroków wymaga definicji: porównywanych punktów/średnich, mianownika, użycia wartości bezwzględnej, obsługi zerowej straty i historii rejestrowanej raz na epokę. To diagnostyka plateau, nie dowód osiągnięcia optimum. Stały budżet kroków nie gwarantuje równej liczby obejrzanych przykładów ani równego kosztu czasu; tekst powinien zachować właśnie interpretację budżetu aktualizacji.

### M14 — Zamknięty plan analizy statystycznej

**P0 przed zależną analizą wyników; linie 259–267; potwierdzona nieostateczna specyfikacja.** Sformułowania „jeżeli”, „można” i „chyba że” pozostawiają otwarte testowanie między zadaniami, rodzinę porównań i wspólne ustawienia bootstrapu. Nie jest konieczne dodawanie testu istotności; świadoma analiza opisowa jest dopuszczalnym rozstrzygnięciem.

Należy zamrozić: główne kontrasty i metryki, kierunek różnic, warunki D/T/T+E, populację kompletnych par, reguły braków i remisów, ewentualny test oraz kontrolę wielokrotności. Dla bootstrapu określić liczbę replik, poziom i typ przedziału, ziarno, jednostkę losowania i obsługę nieokreślonych replik. A/B mają już roboczo 2000 replik, przedział percentylowy 95% i ziarno 42; trzeba wskazać przyjętą wersję, nie pozostawić otwartego wyjątku.

Zachować sparowanie predykcji, losowanie pacjentów dla Diabetes i odrębne skale AUC/straty. Przedziały dla średniej po trzech ziarnach są warunkowe względem wytrenowanych modeli i podziału; nie obejmują pełnej zmienności ponownego uczenia. Stratyfikowany bootstrap warunkuje też ocenę na obserwowanych licznościach klas. Jeżeli progi pozostają ustalone z OOF, ich estymacji nie powtarza się na teście. W razie raportowania interakcji układu 2×2 należy wcześniej zdefiniować kontrast i skalę; nie jest to wymóg nowej kampanii.

### M15 — Kompletność, budżety i skala badania

**P1; linie 80, 113, 267–298; do weryfikacji.** Nominalne liczby w obecnym tekście są arytmetycznie spójne: A ma 36 ocen, B 108; razem 1008 dopasowań neuronowych i 144 CPU. Kontrola A może dodać maksymalnie 72 GPU i 72 CPU. Nie należy ich korygować do starszych liczb z protokołu.

Potrzebny jest rzeczywisty wykaz stanów i kosztów prób: zakończone, nieudane, niepodjęte, ponowione, obcięte czasowo. Wyjaśnić operacyjnie, kiedy brak losowego kandydata jest dopuszczoną awarią, a kiedy nieukończonym zadaniem blokującym pełny raport. W badaniu głównym poprawnie zakończone uczenie wskutek limitu może być dopuszczone, natomiast A/B wymagają braku obcięcia czasowego. Rozdzielić te reguły. Nie sumować współdzielonego kosztu wyszukiwania osobno dla D, T i T+E.

## 5. Rozdział 5 — uwagi merytoryczne i dowodowe

### S01 — Suma kontrolna UCI dotyczy innego obiektu

**P1; linia 53; potwierdzony błąd rzeczowy względem lokalnego kodu.** Zdanie przypisuje sumę kontrolną pobieranemu archiwum UCI. Tymczasem [data/tasks.py](../../mgr-repo/src/tabular_thesis/data/tasks.py), linie 100–114, oblicza SHA-256 przygotowanego pliku Parquet i zapisuje `data_sha256`. Linie 208–224 kontrolują integralność pobranego ZIP przez `testzip()`, lecz ta ścieżka nie utrwala SHA-256 archiwum.

Minimalna poprawka tekstu:

> Źródła OpenML mają określone identyfikatory i wersje, natomiast przygotowane dane, także pochodzące z archiwów UCI, identyfikuje suma kontrolna pliku Parquet.

Jeżeli maszyna kampanii dodatkowo archiwizuje sumy plików źródłowych, należy wskazać osobny manifest i odpowiednio rozszerzyć opis. Nie trzeba zmieniać działającego kodu tylko po to, aby utrzymać obecne zdanie. Suma przygotowanego pliku nie jest zarazem dowodem pełnej równoważności źródeł danych.

### S02 — Wyniki kwalifikacji zamiast samej listy kontroli

**P1; linie 152–159; potwierdzona luka w tekście.** Sekcja opisuje, co sprawdzać, lecz nie zawiera zwartego zestawienia wykonanych sprawdzeń, ich dat, rewizji, środowiska i wyników.

Lokalny `implementation-status.md` zawiera nowsze dowody niż historyczne 71 testów z 6 listopada: 89 testów dla zmiany budżetów z 11 listopada, 158 dla zmiany partii z 12 listopada i 161 dla zmiany źródła Santandera. Zapisuje też syntetyczny smoke: 4 zadania, 32 dopasowania foldów i 6 wierszy raportu. To różne migawki weryfikacji, nie liczby do zsumowania. Dokument nadal odróżnia je od kwalifikacji GPU, świeżej instalacji, kontenera i TabPFN.

Reviewer powinien wskazać aktualne dowody dla rewizji rzeczywiście wykonującej kampanię. Do tekstu potrzebna jest tabela: zakres kontroli, rewizja/data, środowisko, wynik, artefakt i ograniczenie. Nie wolno z historycznego lokalnego braku CUDA wnioskować, że obecne zdalne treningi nie działają. Z kolei samo działanie treningów nie potwierdza wszystkich własności izolacji i wznowienia.

### S03 — Rzeczywiste środowisko kampanii

**P1; linie 127, 148, 164–189; potwierdzony brak pełnej charakterystyki w tekście.** Wersje z pliku zależności i liczba wątków nie identyfikują użytej maszyny.

Uzupełnić CPU, przydzielone rdzenie/wątki, RAM, GPU i VRAM, system, sterownik, środowisko CUDA/PyTorch, identyfikator obrazu — jeśli użyto kontenera — oraz warunki współdzielenia urządzeń. Powiązać je z manifestami przebiegów. Rozróżnić wersje zadeklarowane od rzeczywiście zainstalowanych. Dla wielu maszyn lub środowisk podać mapowanie zadań; nie przypisywać wszystkim jednego sprzętu. Nie przedstawiać prognozy czasu jako pomiaru.

### S04 — Implementacja i kwalifikacja A/B

**P1; linie 19–40, 66–94, 152–159; potwierdzona luka opisu, wykonanie do weryfikacji.** Rozdział opisuje przede wszystkim kampanię główną. Potrzebna jest krótka sekcja o rzeczywistej obsłudze A/B, dopisana dopiero po potwierdzeniu implementacji.

Zakres: niezależne ziarno uczenia, wagi liczone na treningu foldu, wybór kryterium walidacyjnego, podzbiory przed przekształceniami, wyłączone zatrzymanie walidacyjne w B, wybór najlepszego stanu po pełnym przebiegu, trwałe historie oraz analiza bez przedwczesnego odczytu testu. Wskazać oddzielne plany, katalogi i test równoważności ścieżki bazowej z rewizją kampanii. Plan implementacji nie wystarcza jako dowód. Jeżeli część jest nadal planowana, podać dokładnie jej status.

### S05 — Tożsamość danych, konfiguracji i checkpointu

**P1; linie 53–66, 164–189; do weryfikacji.** Tekst dobrze wyjaśnia ogólny mechanizm identyfikacji, ale trzeba powiązać go z konkretnym wykonaniem. Potrzebne są źródłowe manifesty, hash kodu i zależności, rewizja repozytorium, ewentualne lokalne poprawki, tożsamość kontenera oraz rzeczywisty checkpoint TabPFN.

Sprawdzić w szczególności rozdzielenie starych danych Santandera od OpenML 46859 v2 oraz wyników sprzed i po zmianie partii. Git commit i obraz nie są według protokołu automatycznie przechwytywane przez runner; należy wykazać ich osobny zapis. Nie trzeba przepisywać pełnych manifestów do tekstu: wystarczy czytelny odsyłacz do trwałego, wersjonowanego załącznika.

### S06 — Granice pomiaru czasu, pamięci i inferencji

**P1; linie 125–148; zalecenie i kontrola artefaktów.** Zachować obecne rozróżnienie czasu dopasowania, czasu prób i sumy czasów predykcji wybranych konfiguracji. `selected_inference_seconds` nie jest automatycznie latencją gotowego zespołu, a pamięć podczas dopasowania nie jest pamięcią inferencji.

Sprawdzić, czy rzeczywiste rekordy zawierają te pomiary i znaczniki dostępności oraz czy czasy współbieżnych procesów nie są przedstawiane jako czas kalendarzowy kampanii. Opisać dostępny zapis obciążenia GPU albo brak takiego pomiaru. Osobny pomiar inferencji jest potrzebny dopiero do twierdzeń o pełnej latencji/pamięci wdrożenia; nie należy bez potrzeby rozszerzać kampanii. Przy braku takich pomiarów trzeba zawęzić wnioski kosztowe.

### S07 — Metryki, nazwy pól i przypadki nieokreślone

**P1; linie 57–61, 150; do potwierdzenia w analizie.** Zachować ostrzeżenie, że `log_loss_val` oznacza stratę testową i że zbiorcze binarne AP dotyczy kodu 1. Dla Amazonu analiza rzadkiej klasy wymaga kolumny 0. Kod [evaluation/metrics.py](../../mgr-repo/src/tabular_thesis/evaluation/metrics.py), linie 70–112, potwierdza konwencję `zero_division=0` i rozdzielenie AP zbiorczego od `per_class`.

Reviewer powinien sprawdzić mapowanie w eksporcie do tabel oraz rozdzielić: poprawne zero, metrykę nieokreśloną i brak wyniku z powodu awarii. Potrzebna jest reguła analizy A zgodna z rozstrzygnięciem M05. Numeryczna poprawność macierzy prawdopodobieństw nie dowodzi zgodności znaczenia jej kolumn; wymagany jest ślad mapowania klas i kontroli identyfikatorów obserwacji.

### S08 — Wznawianie, usuwanie modeli i odtwarzalność

**P1; linie 90–94, 191; zalecenie doprecyzowania.** Odtworzenie raportu z predykcji, ponowienie treningu i uzyskanie identycznych bitowo wyników to różne własności. Tekst powinien rozdzielać te znaczenia.

Wystarczy wskazać sprawdzony scenariusz wznowienia i jego artefakt, zakres usuwanych plików oraz brak możliwości nowych predykcji bez ponownego uczenia po usunięciu modelu. Nie deklarować bitowej deterministyczności GPU wyłącznie na podstawie zapisanych ziaren. Nie zaleca się przechowywania wszystkich modeli, jeśli nie wymagają tego analizy; trzeba jednak zachować komplet danych z W04.

## 6. Uwagi stylistyczne i redakcyjne

Poniższe poprawki nie wymagają ponownego treningu. Ich wykonanie powinno nastąpić po rozstrzygnięciu kwestii merytorycznych, żeby nie utrwalać nieostatecznych reguł w nowej redakcji.

| ID | Priorytet i miejsce | Uwaga i proponowana poprawka |
| --- | --- | --- |
| R01 | P2; 4:160–190 | Badanie A jest zbyt zwarte. Podzielić na cel i warunki, wybór stanu, progi i komparator, diagnostykę oraz ograniczenia. Krótka tabela warunków może zastąpić część wyliczeń w prozie. |
| R02 | P2; 4:198–235 | W B wyraźniej oddzielić pochodzenie konfiguracji, wykonanie, pomiary i hipotezę. Szczegóły rankingu lub pełne parametry przenieść do dodatku, zachowując w tekście regułę selekcji i ograniczenie interpretacji. |
| R03 | P2; 4:261–265 | Po decyzji statystycznej zastąpić otwarte warianty jednoznacznym opisem przyjętej analizy. Warunkowość pozostawić tylko tam, gdzie opisuje z góry ustaloną regułę, np. kontrolę A. |
| R04 | P2; 4:43–45 i 5:155–159 | Rozdzielić trzy formy wypowiedzi: wymaganą procedurę, wykonaną kontrolę i uzyskany wynik. Unikać przedstawiania listy czynności jako dowodu zakończenia audytu. |
| R05 | P2; 4:78, 202–204 | Ujednolicić nazwy: ziarno podziału, ziarno uczenia, ziarno foldu; zadanie konfiguracji, dopasowanie foldu, ocena warunku. Skróty „przebieg” i „wynik” doprecyzować tam, gdzie wpływają na mianownik. |
| R06 | P2; 4:177–188 | Konsekwentnie używać „klasa rzadka”, „alarm”, „próg” i „przesunięcie logitu”. Nie utożsamiać rzadkiej klasy z kodem 1. Progu 0,5 z regułą `≥` nie nazywać bezwarunkowo równoważnym `argmax` przy remisie. |
| R07 | P2; 4:202–233 | Rozróżniać krok aktualizacji od epoki, stan wybrany od stanu końcowego oraz normę wszystkich parametrów od normy parametrów objętych zanikiem. Podawać normę i stratę dla określonego stanu. |
| R08 | P2; 4:272–294 | Utrzymać w podpisie tabeli słowo „nominalna”. Dodać czytelną uwagę, że kontrola A jest kosztem warunkowym poza podstawową liczbą, a komparator nie wymaga dopasowania. |
| R09 | P2; 5:19–40, 66–94 | Pozostawić architekturę i kluczowe artefakty, ale nie rozbudowywać rozdziału do instrukcji obsługi kodu. Długie listy kluczy i pełne komendy można umieścić w dodatku; w rozdziale wyjaśniać ich znaczenie dla wiarygodności wyników. |
| R10 | P2; 5:189 | Poprawić „Rewizję, nazwę pliku i suma kontrolna wag wskazuje konfiguracja” na „Konfiguracja wskazuje rewizję, nazwę pliku i sumę kontrolną wag”. |
| R11 | P2; oba rozdziały | Ograniczyć powtórzenia o budżecie, pamięci i identyfikowalności. Rozdział 4 powinien wyjaśniać reguły i konsekwencje naukowe, rozdział 5 — realizację, artefakty i dowody. Stosować odsyłacze zamiast powtarzania pełnych opisów. |
| R12 | P2; tabele i rysunki | Po poprawkach skompilować pełny dokument w `build/`. Sprawdzić etykiety, cytowania, tabele partii i skali, schematy podziałów i zespołów, łamanie ścieżek oraz zgodność podpisów z nowymi regułami. Nie zmieniać treści rozdziałów 1–3. |

Nie jest potrzebne przepisanie obu rozdziałów od początku. Największy zysk przyniesie domknięcie specyfikacji i dodanie dowodów, następnie skrócenie najgęstszych fragmentów.

## 7. Elementy poprawne, których nie należy utracić przy korekcie

- Jednostką porównania między zadaniami pozostaje zbiór; foldy i konfiguracje nie zwiększają liczby niezależnych zadań.
- Test służy ocenie, nie wyborowi konfiguracji, progów, wag zespołu ani reguł kontrolnych.
- KNN IID ma jawny wyjątek LOO, a stały TabPFN nie jest pozornie strojony ani sztucznie powielany w T/T+E.
- F1 po doborze progu na OOF nie jest samodzielnym dowodem zmiany uporządkowania; tekst już to poprawnie zaznacza.
- Komparator używa klasy semantycznie rzadkiej i nie gwarantuje identycznych decyzji po ponownym wyznaczeniu środka przedziału.
- Budżet B jest docelowo wyrównany w krokach, z jawnym zaokrągleniem 1000 do 1002 w opisanym przypadku.
- Czynnik zaniku bez gradientu jest przewidywaniem analitycznym, nie wynikiem eksperymentalnym.
- Brak istotności nie oznacza równoważności, a trzy ziarna przy jednym podziale nie opisują pełnej zmienności badania.
- Koszt pretrenowania TabPFN jest zewnętrzny, a czas z zapisanych predykcji i pamięć dopasowania mają ograniczony zakres interpretacji.

## 8. Oczekiwana odpowiedź reviewera

Odpowiedź powinna zawierać identyfikację faktycznie sprawdzanej kampanii i ocenę każdej uwagi W01–W04, M01–M15, S01–S08 oraz R01–R12. Dla uwag wyłącznie redakcyjnych można udzielić odpowiedzi grupowej, zachowując identyfikatory wyjątków.

| Pole | Wymagana treść |
| --- | --- |
| ID uwagi | Identyfikator z tego dokumentu |
| Rozstrzygnięcie | Potwierdzona / odrzucona z dowodem / już rozwiązana / wymaga decyzji / brak dostępu |
| Dowód | Rewizja i ścieżka kodu albo identyfikator badania, plik artefaktu i konkretne pole; w miarę możliwości hash |
| Stan rzeczywisty | Co robi implementacja i co wykonano, osobno od planu |
| Korekta | Proponowane brzmienie lub brakujący materiał do rozdziału |
| Wpływ na obliczenia | Tylko tekst / ponowna analiza zapisanych danych / brakujący pomiar / wskazane próby wymagają ponowienia |
| Warunek zamknięcia | Konkretny dowód pozwalający uznać punkt za rozwiązany |

Minimalny pakiet dowodowy do przekazania autorowi tekstu:

1. Manifesty kampanii głównej i A/B, rewizje, źródła danych, zależności, sprzęt oraz datowany stan wykonania. Bez konieczności przekazywania całych macierzy predykcji.
2. Rejestr audytu danych, podziałów i mapowania klas oraz manifest przestrzeni strojenia.
3. Dowody wyboru konfiguracji A i konfiguracji 21 dla B, oparte na OOF.
4. Zamrożone reguły progów, kontroli A, metryk, niepewności i obsługi braków.
5. Przykładowy rzeczywisty, kompletny rekord historii A/B oraz wykaz jego pól i trwałej lokalizacji.
6. Wyniki kwalifikacji odpowiadające rewizjom wykonania, wraz z ograniczeniami i listą brakujących sprawdzeń.

Jeżeli artefakt jest niedostępny, odpowiedź powinna wskazywać brak i jego konsekwencję. Nie zastępować dowodu ogólnym zapewnieniem, że kampania działa prawidłowo.

## 9. Kolejność napraw i kryteria zamknięcia

1. **Najpierw zgodność wykonania i zachowanie dowodów:** W01–W04 oraz aktualny stan A/B. Nie czekać z kontrolą trwałego zapisu historii do usunięcia modeli.
2. **Następnie reguły analizy:** M03–M09 i M14, przed zależnym od nich odczytem wyników. Większość tych punktów dotyczy analizy zapisanych predykcji, nie treningu.
3. **Uzupełnienie podstaw odtwarzalności:** audyt danych, HPO, selekcja konfiguracji 21, budżety rzeczywiste, sprzęt i kwalifikacja.
4. **Redakcja rozdziałów:** korekta S01 i R10, dopisanie dowodów i statusu A/B, skrócenie gęstych fragmentów oraz kontrola składu.

**Rozdział 4 można zamknąć**, gdy opis jest zgodny z zaakceptowanym i identyfikowalnym protokołem, reguły analizy są jednoznaczne, a dane, wybory konfiguracji i wyjątki mają wskazane dowody. Końcowe wartości jakości modeli mogą pozostać do rozdziałów wynikowych.

**Rozdział 5 można zamknąć**, gdy poprawiono błąd sumy kontrolnej, opisano rzeczywiste środowisko oraz udokumentowaną kwalifikację, wskazano status i artefakty A/B, a twierdzenia o odtwarzalności i kosztach odpowiadają temu, co zapisano i sprawdzono. Jeśli A/B pozostają niezrealizowane, rozdział może być gotowy do konsultacji jako jawnie częściowy opis środowiska, lecz nie jako potwierdzenie wykonania całego badania.

W przygotowaniu tego dokumentu nie zmieniano manuskryptu, kodu eksperymentów, konfiguracji ani artefaktów kampanii. Nie uruchamiano treningów ani testów platformy, nie odczytywano predykcji testowych i nie wykonywano nowej kompilacji LaTeX. Ocena bieżącego stanu zdalnej kampanii pozostaje zadaniem odbiorcy dokumentu.
