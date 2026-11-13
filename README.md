# Rozprawa: głębokie sieci neuronowe w klasyfikacji danych tabelarycznych

## Źródło danych Santander

Santander Customer Satisfaction jest pobierany przez wspólny etap `prepare` z OpenML 46859, wersja 2, zamiast z lokalnego pliku konkursowego Kaggle. Automatyczne pobieranie obejmuje wszystkie dwanaście zbiorów: osiem źródeł OpenML i cztery archiwa UCI. Aktualną konfigurację i zasady przygotowania danych określają [rejestr danych](../mgr-repo/docs/dataset-selection.md) oraz [instrukcja przygotowania](../mgr-repo/docs/setup.md#prepare-datasets); zmiana dostawcy nie zmienia przyjętej puli zadań.

Zaktualizowano opis automatycznego pobierania w [rozdziale 5](chapters/05-srodowisko.tex) oraz odnośnik do źródła w [tabeli rejestru zadań rozdziału 4](chapters/04-metodyka.tex). W rozdziale 4 doprecyzowano również, że wykorzystywana wersja Santander z OpenML nie zawiera kolumny identyfikatora `ID`.

Brak kolumny `ID` potwierdzono bezpośrednio w publicznym API OpenML dla zbioru 46859, wersji 2: [opis zbioru](https://www.openml.org/api/v1/json/data/46859) zawiera zdanie „Also, the ID column is dropped.”, a [pełna lista kolumn](https://www.openml.org/api/v1/json/data/features/46859) obejmuje 370 pozycji, w tym etykietę `TARGET` i 369 predyktorów, bez kolumny `ID`. Jest to weryfikacja opisu i schematu źródła, nie porównanie wszystkich wartości danych z pierwotnym plikiem Kaggle.

Opis Santander jako oznakowanych danych treningowych konkursu pozostaje zgodny z pochodzeniem danych. Kopie w `appendices/provenance/` dokumentują dawny stan i nie podlegają aktualizacji. Zmiana źródła ma osobną tożsamość w pamięci podręcznej; stan sprawdzenia zgodności danych i hashy opisuje [dokumentacja eksperymentów](../mgr-repo/docs/implementation-status.md).

## Bieżący skład: 2026-11-11

[PDF części teoretycznej i metodologicznej](build/wut/main.pdf) składa rozdziały 1–5 oraz streszczenia zakresu i metodyki. Opis procedur używa czasu teraźniejszego; informacje o stanie realizacji i instrukcje redakcyjne pozostają poza PDF. Rozdziały 6–7 zachowano bez zmian w źródłach jako szkielety wynikowe i wyłączono z `main.tex`. Nie dodano wyników ani deklaracji przeprowadzenia kampanii.

Sześć ramek instruktażowych zastąpiono schematami pojęciowymi zapisanymi w LaTeX. Makro zachowuje możliwość wstawienia zewnętrznego pliku; przy jego braku składa kompletny schemat z czwartego argumentu. Nie wygenerowano wykresów empirycznych. [Notatka redakcyjna](appendices/editorial-status-2026-11-11.md) zachowuje otwarte ustalenia i wskazuje dokumenty autorytatywne. Wcześniejszy [audyt cytowań](appendices/citation-audit-2026-11-11.md) dotyczy zapisanej tam wersji i numeracji linii; nie wdrażano przy tej korekcie odrębnych zmian bibliograficznych.

Weryfikacja: pełny przebieg pdfLaTeX/Biber/pdfLaTeX/pdfLaTeX, zachowanie 50 miejsc cytowania i 14 równań, kontrola tekstu PDF oraz oględziny sześciu stron ze schematami. Brak błędów cytowań i odwołań oraz przepełnionych wierszy; pozostają komunikaty `Underfull` dotyczące rozkładu stron. Dane autora, albumu i instytutu nadal są oznaczone do uzupełnienia. Streszczenia wymagają dodania wyników przy składaniu kompletnej pracy.

## Wcześniejsze etapy

Stan na 2026-11-06: pierwsze wersje rozdziałów 1–5 oraz szkielety wynikowe rozdziałów 6–7. Dokument zawiera 20 tabel (w tym puste formularze wyników), 24 cytowane pozycje i 12 miejsc na ilustracje: sześć schematów oraz sześć przyszłych wykresów. Nie zawiera własnych wyników końcowej kampanii. Rozdział 8 pozostaje pusty i nie jest włączony do składu.

## Organizacja

- `main.tex` składa stronę tytułową, miejsca na streszczenia, pięć napisanych rozdziałów, dwa szkielety wynikowe, bibliografię i spisy.
- `chapters/` zawiera rozdziały; `sections/` jest dostępny do ewentualnego podziału dłuższych części.
- `bibliography/references.bib` zawiera zweryfikowane odniesienia oraz wskazania czytanych wersji.
- [figures/README.md](figures/README.md) określa zawartość, formaty i dokładne ścieżki wszystkich dwunastu ilustracji, sposób wstawiania oraz wymagane pochodzenie danych wynikowych.
- `template/figure-input.tex` automatycznie zastępuje ramkę plikiem, gdy grafika jest dostępna.
- [AGENTS.md](AGENTS.md) określa zasady redakcji i odsyła do autorytatywnych dokumentów w repozytorium eksperymentów.

Dokument korzysta z **WUT-Thesis** z lokalnego repozytorium `../WUT-Thesis`. [Pochodzenie, ustawienia i zakres adaptacji](template/wut-thesis/README.md) opisują wersję klasy i ograniczenia. Dane strony tytułowej znajdują się w [template/metadata.tex](template/metadata.tex); niepotwierdzone pola oznaczono do uzupełnienia. Streszczenia pozostają szkieletami w [template/abstracts.tex](template/abstracts.tex).

## Kompilacja

Kompilacja używa **pdfLaTeX i Biber**, zgodnie z domyślną ścieżką `quick` źródłowego szablonu. Wymagane są pakiety klasy WUT-Thesis, polskie wzorce dzielenia, `booktabs`, `tabularx` i `xurl`. BibTeX nie zastępuje Biber.

Na tej maszynie brakujące pakiety są zainstalowane lokalnie w `build/texmf`. Uruchamiać z katalogu głównego:

```bash
mkdir -p build/wut build/texmf-var build/texmf-config
export TEXMFHOME="$PWD/build/texmf"
export TEXMFVAR="$PWD/build/texmf-var"
export TEXMFCONFIG="$PWD/build/texmf-config"
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build/wut main.tex
biber --input-directory=build/wut --output-directory=build/wut main
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build/wut main.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build/wut main.tex
```

W kompletnej instalacji systemowej lub na Overleafie pomija się trzy zmienne `TEXMF*`. Wynik to **`build/wut/main.pdf`**. Katalog `build/before-wut/` zachowuje lokalną kopię wcześniejszego układu; stary `build/main.pdf` nie jest wynikiem nowej kompilacji. Nie usuwać `build/` bez uwzględnienia lokalnych zależności opisanych w dokumentacji szablonu.

Pierwszy przebieg może zgłosić nierozwiązane cytowania; po Biber i kolejnych przebiegach nie powinny pozostać. Brak ilustracji nadal daje ramkę z instrukcją. Przed złożeniem pracy należy uzupełnić dane, streszczenia i wyniki oraz zastąpić ramki rzeczywistymi ilustracjami.

Poniższe datowane zapisy opisują wcześniejsze etapy redakcji i kompilacji, w tym poprzedni układ `report`.

## Zakres kontroli źródeł

Podstawą był [rejestr literatury](../mgr-repo/docs/literature-review.md), uzupełniony ponownym otwarciem tekstów potrzebnych do rozdziałów i źródłami definicji regularyzacji. Zachowano przyjęty dobór metod i naukową granicę przeglądu 2026-10-27. Data kontroli źródeł i dokumentacji technicznej to 2026-11-06. Nie włączono późniejszej rewizji raportu TabPFN do zmiany zakresu.

| Klucz bibliografii | Sprawdzony fragment lub rodzaj źródła | Wykorzystanie |
| --- | --- | --- |
| `borisov2022survey` | Preprint v3; definicje, III-C i III-D; tekst dostępny | Mapa pojęć, heterogeniczność i podział podejść. |
| `gorishniy2021revisiting` | Tekst konferencyjny, sekcje 3–4 i tabela zadań | Historyczny benchmark i tokenizacja FT-Transformer. |
| `grinsztajn2022trees` | Tekst konferencyjny, 3.1–3.5 i 5 | Selekcja danych i zakres interwencji. |
| `mcelfresh2024tabzilla` | Rozszerzony preprint v4, 2.1–2.2 i opis protokołu | Zakres 176 zadań i interpretacja heterogeniczności; bibliografia nie utożsamia listy autorów v4 z rekordem konferencyjnym. |
| `holzmueller2024realmlp` | Tekst konferencyjny, 1.1 i opis receptury w 3 | Meta-train/meta-test oraz kompletny potok RealMLP. |
| `ye2025talent` | Preprint v4, 4.3, 5 i opis zbiorów | Liczby i mieszane typy zadań; bez przenoszenia rankingu na własne wyniki. |
| `erickson2025tabarena` | Tekst konferencyjny, 2–3 | Definicja benchmarku, walidacja i zespoły. |
| `rubachev2025tabred` | Preprint v4, wprowadzenie, opis benchmarku i podziałów | Granice oceny losowej i czasowej. |
| `kadra2021regularization` | Tekst konferencyjny, opis regularyzacji i eksperymentów | Zestawy regularyzacji a ablacja jednego składnika. |
| `saito2015pr` | Tekst PLOS, wyniki i omówienie | Uzasadnienie precision–recall, nie dowód poprawy po ważeniu. |
| `cawley2010selection` | Tekst JMLR, abstrakt i wprowadzenie do problemu selekcji | Rozdzielenie wyboru od niezależnej oceny. |
| `demsar2006comparisons` | Tekst JMLR, jednostki i porównywalność w sekcji 3 | Brak pseudoreplikacji; bez automatycznego narzucania jednego testu. |
| `arik2021tabnet` | Tekst preprintu v5, opis architektury i masek | Sekwencyjna selekcja. Bieżące otwarcie strony AAAI blokował mechanizm dostępu; metadane publikacji były sprawdzone we wcześniejszym przeglądzie. |
| `ye2025modernnca` | Preprint v2, 3–4 | Miękkie sąsiedztwo, reprezentacja i próbkowanie kandydatów. |
| `gorishniy2025tabm` | Preprint v2, 3 i opis zespołów | Współdzielenie parametrów; nie zakłada się tożsamości każdego detalu z późniejszym wydaniem. |
| `jaeger2026tabpfn35` | Preprint v2, tabela 1, sekcje 2–3 | Rozdzielenie modelu bazowego, wariantów i kosztów; bez twierdzenia o własnej kwalifikacji. |
| `chen2016xgboost` | Tekst autorów, 2.1–2.3 | Addytywne drzewa i regularyzacja. |
| `prokhorenkova2018catboost` | Preprint v5, 3–4; rekord NeurIPS 2018 | Kategorie i porządek; bez przypisywania każdemu uruchomieniu wariantu Ordered. |
| `cover1967nearest` | Tekst na stronie autora, opis reguły NN | Historyczna podstawa sąsiedztwa; nie powielano twierdzeń asymptotycznych. |
| `srivastava2014dropout` | Tekst JMLR, opis metody i trybu predykcji | Mechanizm dropoutu, bez przenoszenia wyników empirycznych na badane tabele. |
| `loshchilov2019adamw` | Tekst autorów ICLR 2019, opis rozdzielenia zaniku wag | Rozróżnienie AdamW i kary L2. |
| `sklearnLogistic`, `sklearnNeighbors` | Dokumentacja autorów o mechanizmach | Definicje; nie określa wersji środowiska eksperymentalnego. |
| `rtdlImplementation` | Repozytorium autorów | Rola prostych odniesień i pochodzenie implementacji. |

Nie użyto szczegółowych ustaleń artykułu Nature o wcześniejszym TabPFN, do którego nie uzyskano pełnego dostępu w poprzedniej sesji. Nie dołączono też nieprzeczytanego podręcznika: próby otwarcia autorskiego serwisu ESL oraz strony historycznego artykułu Coxa zakończyły się błędami dostępu. Obecny opis regresji logistycznej odsyła do dostępnej dokumentacji autorów implementacji.

## Pochodzenie twierdzeń o własnym środowisku

Zakres badania pochodzi z dokumentów wskazanych w `AGENTS.md`. Przed redakcją sprawdzono także `configs/config.yaml`, wybrane pliki `configs/model/*.yaml`, `experiments/catalog.py`, `experiments/upstream_models.py`, `models/dl/torch_classifier.py`, `models/preprocessing.py` i adapter FT-Transformer w repozytorium eksperymentów. To źródła stwierdzeń o lokalnym MLP, przestrzeniach nadrzędnych i implementacjach. Nie są dowodem ich końcowej jakości.

Wątki wymagające dalszej kwalifikacji, takie jak rzeczywista inferencja TabPFN, audyty danych i dokładna receptura kontrolowanego MLP, opisano jako przyszłe działania. Nie dodano nieuzasadnionych wyników, terminów zakończenia ani rozstrzygnięć o przewadze modeli.

## Weryfikacja wcześniejszej wersji rozdziałów 1–3

Sprawdzono kompletność 24 kluczy bibliografii, odwołania do etykiet, sześć tabel, trzy ścieżki ilustracji i bilans środowisk LaTeX. Potwierdzono zachowanie pustych rozdziałów 4–8 oraz brak zmian w chronionych plikach implementacji i protokołu eksperymentów.

Zbudowano tymczasowy podgląd treści przy użyciu pdfLaTeX/BibTeX i uproszczonej preambuły. Sprawdzono skład tabel i ramek, rozwiązywanie cytowań i odwołań oraz obie ścieżki makra ilustracji: brak pliku daje ramkę, obecny plik zastępuje dokładnie właściwą ramkę. W podglądzie nie pozostały niezdefiniowane cytowania/odwołania ani przepełnione wiersze. Obejrzano także renderowane strony z tabelami i ramką.

Nie jest to pełna weryfikacja docelowego dokumentu. Natywna próba LuaLaTeX zakończyła się błędem ładowania fontu; lokalnie brak również Biber i pakietu BibLaTeX. W podglądzie pominięto niedziałające zależności `hyperref` oraz polskie ustawienia językowe. Docelowe dzielenie wyrazów, lokalizacja bibliografii, hiperłącza i pełny przebieg LuaLaTeX/Biber wymagają sprawdzenia w kompletnym środowisku. Nie instalowano zależności i nie uruchamiano eksperymentów ML.


## Rozszerzenie o rozdziały 4–7

Rozdział 4 opisuje projekt, audyt danych, podziały, przygotowanie cech, strojenie, D/T/T+E, metryki, oba wymagane badania mechanizmów, proponowaną analizę oraz granice pomiaru kosztu. Rozdział 5 przedstawia zaimplementowaną platformę, kontrole izolacji, artefakty, wznowienie, datowane dowody weryfikacji i otwarte bramki kwalifikacji. Nie zmieniono zaakceptowanej puli metod i danych ani plików protokołu.

Rozdziały 6–7 zawierają sekcje, puste tabele i wymagania dotyczące dowodów. Są oznaczone jako szkielety. Nie wpisano zer, przykładowych pomiarów, sztucznych krzywych ani wniosków o przewadze metod. Rozdział 8 pozostaje do napisania po analizie wyników. Tekst rozdziałów 1–3, bibliografia i makro ilustracji nie zostały zmienione.

### Podstawa opisu własnego badania

| Zagadnienie | Sprawdzone źródło w repozytorium eksperymentów |
| --- | --- |
| Zakres i kolejność rozdziałów | `docs/thesis-topic.md`, `docs/thesis-plan.md`, `docs/study-model-selection.md` |
| Źródła danych i wymagania audytu | `docs/dataset-selection.md`, `configs/dataset/*.yaml`, `src/tabular_thesis/data/tasks.py` |
| Główny protokół i liczby planowane | `docs/tabarena-evaluation.md`, `configs/config.yaml`, `experiments/backend.py`, `experiments/catalog.py` |
| D/T/T+E, metryki i koszty | `experiments/reporting.py`, `evaluation/metrics.py`, `experiments/backend.py` |
| Manifesty, próby i wznowienie | `experiments/artifacts.py`, `experiments/runner.py` |
| Dostępne dowody i granice kwalifikacji | `docs/implementation-status.md`, `docs/verification-2026-11-06.json`, `docs/session-handoff.md` |
| Przypięcia zależności i checkpointu | `uv.lock`, `pyproject.toml`, `configs/model/tabpfn.yaml` |

Ścieżki modułów `experiments/` i `evaluation/` w powyższej tabeli są względne wobec `src/tabular_thesis/`. Artefakt weryfikacji jest datowaną obserwacją infrastruktury. Nie oznacza wykonania kampanii naukowej ani kwalifikacji późniejszych rewizji.

### Co pozostaje przed eksperymentami

W tekście jawnie oznaczono brak pełnego audytu danych i finalnej konfiguracji węzła. Wymagają zamrożenia: ziarna badań A/B, surowe etykiety rzadkie i reguła progów, niezależna receptura MLP, zasady podzbiorów i zatrzymania, końcowe kontrasty, wielokrotność oraz dokładny bootstrap. Opis proponowanej procedury nie nadaje jej statusu zaakceptowanej zmiany protokołu. Oba runnery mechanizmów, rzeczywiste wykonanie GPU/TabPFN i końcowa analiza nadal wymagają kwalifikacji.

### Weryfikacja rozszerzenia

Sprawdzono 24 klucze cytowań, unikalność 98 etykiet, rozwiązanie 36 odwołań, strukturę środowisk i klamer, kolejność siedmiu rozdziałów, 20 tabel oraz zgodność wszystkich 12 ścieżek ilustracji z instrukcją. Kontrola sum plików potwierdziła zachowanie rozdziałów 1–3, bibliografii, makra i pustego rozdziału 8.

Tymczasowy podgląd pdfLaTeX/BibTeX z uproszczoną preambułą składa 47 stron; nie pozostały niezdefiniowane cytowania/odwołania ani przepełnione wiersze. Nie jest to docelowy skład LuaLaTeX/Biber ani zatwierdzony szablon PW. Ograniczenia środowiska opisane powyżej nadal obowiązują. Nie instalowano zależności i nie uruchamiano eksperymentów ML.


## Korekta zgodności tekstu z implementacją: 2026-11-08

Ponownie sprawdzono pięć ustaleń wcześniejszego przeglądu. [Zapis dowodów i rozstrzygnięć](appendices/alignment-review-2026-11-08.md) wskazuje źródła i rozróżnia nieprawidłowe przypisanie kontroli od brakującego doprecyzowania. Poprawiono zakres limitu partii, granice pomiarów pamięci, opis walidacji klas i znaczenie budżetu zespołu. Nie zmieniono algorytmów, puli metod, danych ani protokołu eksperymentów.

[Archiwum podstawy redakcji](appendices/provenance/2026-11-08/README.md) zachowuje bajtowo identyczne kopie lokalnego planu, rejestru literatury, przekazania sesji i datowanego dowodu weryfikacji. Manifest zawiera ich SHA-256, źródła i tożsamość HEAD; kopie nie są drugim, niezależnie edytowanym protokołem. Dokumenty źródłowe są ignorowane przez Git w repozytorium eksperymentów. Archiwum jest przygotowane do zachowania w historii manuskryptu; nie wykonano commitu ani publikacji.

Walidacja tej korekty obejmuje zgodność kopii z manifestem, zachowanie kodu i konfiguracji, 24 cytowane pozycje, 98 etykiet, 36 odwołań, 12 ścieżek ilustracji i 20 tabel. W obecnym środowisku pełny przebieg LuaLaTeX/Biber/LuaLaTeX/LuaLaTeX zakończył się poprawnie i utworzył 47-stronicowy PDF bez nierozwiązanych cytowań i odwołań. Wcześniejszy brak Biber i błąd fontów nie opisują już bieżącego środowiska. Pozostają ostrzeżenia o braku polskich wzorców dzielenia wyrazów, osiem przepełnionych wierszy oraz zalecenie pakietu csquotes. To udany przebieg kompilacji, lecz nie potwierdzenie docelowej typografii ani wymagań PW. Nie instalowano pakietów i nie kwalifikowano ponownie GPU, TabPFN ani eksperymentów.

## Migracja do WUT-Thesis: 2026-11-11

Adaptowano dokument do wskazanego repozytorium szablonu, zachowując treść rozdziałów i wcześniejsze zmiany. Nowy PDF ma 52 strony. Końcowa kompilacja pdfLaTeX/Biber nie zgłasza ostrzeżeń, przepełnień, brakujących cytowań ani odwołań. Polskie dzielenie wyrazów jest aktywne. [Szczegóły migracji i weryfikacji](template/wut-thesis/README.md) obejmują pochodzenie klasy, lokalne zależności, kontrolę zachowania treści oraz zakres oględzin PDF. Dane autora, albumu i instytutu oraz streszczenia pozostają do uzupełnienia.

### Tekst główny i marginesy po korekcie

Na polecenie użytkownika zastosowano TeX Gyre Heros 11 pt oraz marginesy: wewnętrzny 30 mm, zewnętrzny 20 mm, górny i dolny 25 mm. Bieżący `build/wut/main.pdf` ma 47 stron; kompilacja kończy się bez ostrzeżeń i przepełnień. Szczegóły pomiaru parametrów zapisano w [dokumentacji szablonu](template/wut-thesis/README.md). Jest to korekta tych dwóch elementów, nie deklaracja pełnej zgodności wszystkich elementów dokumentu z wytycznymi.

## Pogłębienie części teoretycznej: 2026-11-11

Przeredagowano rozdziały 1–3 pod kątem odbiorcy znającego uczenie maszynowe. Rozwinięto syntezę ustaleń benchmarków, uzasadnienie własnego projektu i mechanizmy metod. Dodano analizę optimum ważonej straty logarytmicznej, interpretację jakości prawdopodobieństw, równania regularyzacji i mechanizmów modeli oraz konsekwencje kosztowe. Rozdziały 4–5 dostosowano terminologicznie i powiązano z teorią; techniczną interpretację pól raportera przeniesiono do opisu środowiska. Zachowano pulę danych i metod, protokół, status niewykonanych eksperymentów oraz szkielety wynikowe.

Wcześniejsza praca autora była wyłącznie odniesieniem redakcyjnym: wykorzystano sposób wiązania opisu rozwiązania z uzasadnieniem decyzji. Nie przenoszono treści ani metadanych. Zachowano granicę literatury 2026-10-27; ponowne odczyty dotyczyły istniejącego korpusu, nie nowego przeglądu.

### Źródła rozwiniętych fragmentów

Kontrola 2026-11-11 obejmowała treść wskazanych sekcji, nie tylko abstrakty. Poniższy zapis uzupełnia wcześniejszy rejestr kontroli; nie oznacza ponownego audytu wszystkich cytowań i implementacji.

| Źródło i wersja | Sprawdzony fragment i wykorzystanie |
| --- | --- |
| RTDL, tekst NeurIPS 2021; pomocniczo arXiv v2 | Sekcje 3.3 i 4: tokenizacja FT-Transformer, rola odniesień i zakres porównania. |
| Grinsztajn i in., tekst NeurIPS 2022; pomocniczo arXiv v1 | Sekcje 4–5: wynik benchmarku, cechy nieinformatywne i obroty. |
| [TabZilla, v4](https://arxiv.org/html/2305.02997v4) | Sekcja 2.1, „Algorithm selection vs. tuning”: porównanie lekkiego strojenia i wyboru rodziny. |
| RealMLP, tekst NeurIPS 2024; pomocniczo [v3](https://arxiv.org/html/2407.04491v3) | Sekcje 3 i 5.2: skalowanie, PBLD, przenoszenie ustawień i zależność wyniku od kolekcji. |
| [TALENT, v4](https://arxiv.org/html/2407.00956v4) | Sekcja 5.1: pozycje rodzin i korzyści zespołowania; bez utożsamiania braku istotności z równoważnością. |
| [TabNet, v5](https://arxiv.org/html/1908.07442v5) | „TabNet for Tabular Learning”: sparsemax, pamięć użycia cech, maski i kara entropijna. |
| [ModernNCA, v2](https://arxiv.org/html/2407.03257v2) | Sekcje 4.1–4.2: miękka predykcja, strata logarytmiczna, reprezentacja i próbkowanie banku. |
| [TabM, v2](https://arxiv.org/html/2410.24210v2) | Sekcje 3.2–3.3 i 5.1: współdzielenie wag, wariant mini, średnia strat i średnia predykcji. |
| [TabPFN-3.5, v2](https://arxiv.org/html/2609.17895v2) | Sekcja 3: kodowanie wartości i ECDF, syntetyczny rozkład pretrenowania; rozróżnienie wariantów. |
| [XGBoost, v3](https://arxiv.org/html/1603.02754v3), [CatBoost, v5](https://arxiv.org/pdf/1706.09516v5) | Odpowiednio sekcja 2.2 oraz sekcje 3–4: wartość liścia, uporządkowane statystyki i wzmacnianie. |
| [Dropout, JMLR](https://jmlr.org/papers/volume15/srivastava14a/srivastava14a.pdf), [AdamW, v3](https://arxiv.org/html/1711.05101v3) | Maskowanie i przybliżenie zespołu; sekcja 2 AdamW: odłączenie zaniku od adaptacyjnego gradientu. |
| Kadra i in., NeurIPS 2021; Saito i Rehmsmeier, PLOS ONE | Zakres 40 zadań i regularyzacja dobierana wspólnie; zależność precision–recall od częstości klasy. |

Równania optimum ważonej straty, rozkładu straty na entropię i dywergencję, liczby parametrów warstwy zespołowej oraz składania predykcji rozwijają argumentację analityczną. Nie są nowymi wynikami empirycznymi ani deklaracją nowości tych zależności. Opisy algorytmów odróżniono od wariantów faktycznie wykonywanych przez adaptery.

### Weryfikacja redakcji

Pełny przebieg pdfLaTeX/Biber/pdfLaTeX/pdfLaTeX utworzył `build/wut/main.pdf` (51 stron). Brak błędów kompilacji, nierozwiązanych cytowań i odwołań oraz przepełnień. Pozostały komunikaty `Underfull` dotyczące rozkładu tekstu na stronach. Kontrola struktury potwierdziła 24 cytowane pozycje, 110 unikalnych etykiet (w tym etykiety makra ilustracji), 51 odwołań, 14 równań, 20 tabel i 12 miejsc na ilustracje. Sprawdzono wizualnie strony z analizą ważenia oraz mechanizmami ModernNCA i TabM. Nie wykonywano eksperymentów, instalacji ani ponownej kwalifikacji środowiska ML.
