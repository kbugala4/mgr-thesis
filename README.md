# Rozprawa: głębokie sieci neuronowe w klasyfikacji danych tabelarycznych

Stan na 2026-11-06: pierwsze wersje rozdziałów 1–5 oraz szkielety wynikowe rozdziałów 6–7. Dokument zawiera 20 tabel (w tym puste formularze wyników), 24 cytowane pozycje i 12 miejsc na ilustracje: sześć schematów oraz sześć przyszłych wykresów. Nie zawiera własnych wyników końcowej kampanii. Rozdział 8 pozostaje pusty i nie jest włączony do składu.

## Organizacja

- `main.tex` składa pięć napisanych rozdziałów, dwa szkielety wynikowe i bibliografię.
- `chapters/` zawiera rozdziały; `sections/` jest dostępny do ewentualnego podziału dłuższych części.
- `bibliography/references.bib` zawiera zweryfikowane odniesienia oraz wskazania czytanych wersji.
- [figures/README.md](figures/README.md) określa zawartość, formaty i dokładne ścieżki wszystkich dwunastu ilustracji, sposób wstawiania oraz wymagane pochodzenie danych wynikowych.
- `template/figure-input.tex` automatycznie zastępuje ramkę plikiem, gdy grafika jest dostępna.
- [AGENTS.md](AGENTS.md) określa zasady redakcji i odsyła do autorytatywnych dokumentów w repozytorium eksperymentów.

Obecny układ oparty na klasie `report` służy pracy nad treścią. Nie jest potwierdzonym szablonem PW. Nie skopiowano metadanych ani treści poprzedniej pracy. Wybór ostatecznej klasy, strony tytułowej i danych autora/promotora pozostaje oddzielnym zadaniem.

## Kompilacja docelowa

Wymagane są LuaLaTeX, Biber oraz pakiety użyte w preambule, zwłaszcza `fontspec` z działającym mechanizmem `luaotfload`, `polyglossia` z obsługą języka polskiego, `biblatex`, `graphicx`, `booktabs`, `tabularx` i `hyperref` z jego zależnościami. Bibliografia wymaga BibLaTeX/Biber; BibTeX nie jest docelowym zamiennikiem.

Uruchamiać z katalogu głównego repozytorium:

```bash
mkdir -p build
lualatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex
biber --input-directory=build --output-directory=build main
lualatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex
lualatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex
```

Pierwszy przebieg może zgłosić nierozwiązane cytowania; po udanym Biber i kolejnych przebiegach nie powinny pozostać. Wynikiem jest `build/main.pdf`. Brak pliku ilustracji nie przerywa kompilacji: pojawia się ramka z instrukcją. Przed wersją końcową ramki trzeba zastąpić lub usunąć wraz z odwołaniami.

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
