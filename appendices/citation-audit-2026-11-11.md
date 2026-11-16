# Audyt cytowań — 11 listopada 2026

## Zakres i wynik

Sprawdzono wszystkie **50 miejsc cytowania**, zawierające **55 odwołań do 24 unikalnych źródeł**, w aktualnym manuskrypcie. Przegląd objął treść otaczającą cytowania, powiązane równania, tabelę przeglądu badań i dwa podpisy planowanych ilustracji. W rozdziałach 5–7 nie ma poleceń cytowania. Wszystkie 24 wpisy bibliografii są używane; nie znaleziono brakujących ani powielonych kluczy.

Weryfikacja merytoryczna korzystała z odpowiednich fragmentów pełnych tekstów 21 publikacji oraz trzech źródeł dokumentacji/kodu. Nie ograniczono jej do abstraktów. Numer wersji odczytanego preprintu ma pierwszeństwo przed nowszym tekstem dostępnym pod nieprzypiętym adresem. Zestawienie poniżej wskazuje lokalizatory dowodów. To audyt zgodności cytowań ze źródłami, nie niezależna reprodukcja wyników publikacji ani ocena kompletności całej literatury dziedziny.

Nie stwierdzono odwrócenia głównych wyników cytowanych badań, fikcyjnych publikacji ani błędnych liczebności benchmarków. Zidentyfikowano cztery grupy uwag: nieprecyzyjny opis wejścia PBLD, brak odrębnego źródła definicji AP, zbyt szeroki zakres atrybucji do przeglądu Borisova oraz niepełne przypięcie wersji części źródeł. Dwa cytowania w podpisach można ocenić tylko jako podstawę planu ilustracji.

Manuskrypt i bibliografia nie zostały zmienione w ramach audytu. Propozycje poniżej służą późniejszej korekcie. Zachowano wcześniejsze niezacommitowane zmiany. Dokumenty zakresu badania w `../mgr-repo/docs/` wykorzystano do oddzielenia literatury od decyzji własnych; ich kopii nie tworzono.

## Uwagi wymagające działania

### U1. PBLD: nieprecyzyjna tożsamość dołączanej wartości

**Miejsce:** `chapters/03-metody.tex:156`, zwrot „surową wartość po skalowaniu”.

**Dowód:** [RealMLP, §3 i rys. 1(a)](https://papers.nips.cc/paper_files/paper/2024/file/2ee1c87245956e3eaa71aaba5f5753eb-Paper-Conference.pdf). Kolejność obejmuje skalowanie, smooth clipping i dopiero osadzenia. Wartość dołączana przez PBLD pochodzi z przygotowanego wejścia.

**Ocena:** niejednoznaczność techniczna. Słowo „surową” może sugerować obejście smooth clipping. Źródło jest właściwe, lecz parafraza nie opisuje jednoznacznie całego przekształcenia.

**Proponowana korekta:** „łączące wartość cechy po skalowaniu i płynnym ograniczeniu zakresu z jej uczoną reprezentacją okresową”. Nie ma potrzeby zmiany wzoru smooth clipping.

### U2. Definicja AP wymaga własnego źródła

**Miejsca:** `chapters/02-stan-badan.tex:73` i `chapters/04-metodyka.tex:131`.

**Dowód:** [Saito i Rehmsmeier, części PRC](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0118432) uzasadniają analizę precision–recall przy niezrównoważeniu. Dokładną sumę przyrostów recall ważonych precision i odróżnienie od trapezów opisuje [dokumentacja average_precision_score](https://scikit-learn.org/stable/modules/generated/sklearn.metrics.average_precision_score.html). Tę funkcję wywołuje `../mgr-repo/src/tabular_thesis/evaluation/metrics.py:109` oraz `:112`.

**Ocena:** obecne cytowanie Saito jest adekwatne do zdania uzasadniającego użycie PR. Nie jest błędnym wynikiem ani fałszywym przypisaniem wzoru, ale pozostawia bez bezpośredniego źródła sąsiadującą definicję konkretnego wariantu AP. „Standardowa definicja” jest mniej precyzyjne niż wskazanie stosowanej konwencji.

**Proponowana korekta:** zachować Saito przy uzasadnieniu PR; przy definicji dodać odrębne źródło dokumentacyjne. Napisać „W stosowanej implementacji AP…” lub „Przyjęto nieinterpolowaną AP…”. Przypiąć dokumentację do wersji środowiska; `uv.lock` zawiera scikit-learn 1.9.0, podczas gdy adres `stable` w dniu audytu wyświetla 1.9.1. Nie stwierdzono przez to rozbieżności samego wzoru.

### U3. Zakres odwołań do Borisova należy zawęzić

**Miejsca:** `chapters/02-stan-badan.tex:38` i `:112`.

**Dowód:** [Borisov v3, III-C i III-D](https://arxiv.org/html/2110.01889v3) omawia brak naturalnej lokalności oraz dzieli metody na transformacje danych, specjalizowane architektury i regularyzację. [Grinsztajn, część dotycząca rotacji](https://proceedings.neurips.cc/paper_files/paper/2022/file/0378c7692da36807bdec87ab043cdadc-Paper-Datasets_and_Benchmarks.pdf) jest bezpośrednim źródłem analizy orientacji danych.

**Ocena:** w linii 38 odwołanie poprawnie wspiera końcowe zdanie o lokalności, lecz może zostać odczytane jako źródło całego akapitu o obrotach. W linii 112 „procedura uczenia” jest szerszą kategorią niż „regularization models” w źródle. Są to uwagi do granic atrybucji, nie dowód fałszu rozumowania autora.

**Proponowana korekta:** przy zdaniu o orientacji dodać już obecne w bibliografii źródło Grinsztajna; zachować Borisova przy lokalności. Taksonomię oznaczyć jako własne rozszerzenie: „Na potrzeby tej pracy rozszerzono podział […] o ogólny poziom procedury uczenia”. Alternatywnie przytoczyć dokładne trzy kategorie przeglądu i dopiero potem wprowadzić własny podział.

### U4. Część źródeł nie ma jednoznacznej wersji

**Miejsce:** wpisy `chen2016xgboost`, `loshchilov2019adamw`, `sklearnLogistic`, `sklearnNeighbors`, `rtdlImplementation` w `bibliography/references.bib`.

**Dowód:** w audycie odczytano [XGBoost v3 z 10 czerwca 2016](https://arxiv.org/abs/1603.02754v3) i [AdamW v3 z 4 stycznia 2019](https://arxiv.org/abs/1711.05101v3); bibliografia podaje adresy bez wersji. Dwa adresy `stable` i główna gałąź repozytorium RTDL również mogą zmienić zawartość.

**Ocena:** brak odtwarzalności źródła, nie wykazana niezgodność merytoryczna. Przypięcie wykonawczego pakietu RTDL 0.0.2 w projekcie już istnieje; nie należy przedstawiać go jako brakującego.

**Proponowana korekta:** dopisać wersje czytanych preprintów, wersję dokumentacji i trwały identyfikator wydania lub commitu kodu. Zachować historyczne daty dostępu, o ile dokumentują rzeczywisty wcześniejszy odczyt; nie zastępować ich automatycznie datą audytu. Nie ma potrzeby zmiany wszystkich preprintów na najnowsze wydania.

## Ograniczenia i dodatkowe zalecenia

- `chapters/03-metody.tex:144` i `:215`: dobrano właściwe źródła koncepcji, lecz ilustracje są planowane. Nie można jeszcze potwierdzić zgodności ich strzałek, bloków, oznaczeń ani samodzielności wykonania. Po ich utworzeniu potrzebna jest kontrola wizualna.
- Wzór AdamW ma jawną konwencję mnożenia zaniku przez tempo uczenia. Odmienna notacja współczynnika w źródle nie czyni wzoru błędnym. Iloczyn czynników zaniku jest wyprowadzeniem autora.
- Wzór ModernNCA jest zgodny z równaniem (4) czytanej wersji i opisem wyłączenia własnego przykładu. Audyt cytowania nie dowodzi identyczności wszystkich szczegółów z użytym adapterem bibliotecznym.
- Cawley i Talbot oraz Demšar uzasadniają zasady oceny, ale nie certyfikują własnych podziałów, niezależności danych ani implementacji. Tekst właściwie odróżnia te poziomy.
- Zestawienie RealMLP można dodatkowo uzupełnić o zastrzeżenie autorów dotyczące błędu obsługi rzadkich kategorii w części ich wyników XGBoost (podpis rys. 2, dodatek B). Obecny ostrożny wniosek o konkurencyjności, w tym porównanie z CatBoost, nie wymaga przez to odwrócenia.
- Nie wykonano nowego audytu pochodzenia wszystkich zbiorów ani eksperymentów. Nie oceniano dowodów dla nieistniejących wyników własnych. Przyszłe stwierdzenia empiryczne wymagają osobnych artefaktów.
- Metadane konferencyjne ICLR/AAAI zestawiono z rekordami wydawców. W przypadku ModernNCA bezpośrednie otwarcie PDF OpenReview napotkało kontrolę przeglądarki; pełna weryfikacja treści dotyczy dostępnego preprintu v2, czyli wersji zadeklarowanej w bibliografii. Nie deklaruje się porównania całego preprintu z finalnym PDF konferencyjnym.

## Rejestr źródeł

Poniżej podano wersję faktycznie sprawdzaną i lokalizator treści. Strony oznaczają strony publikacji/PDF zgodnie z dopiskiem; w HTML użyto nazw sekcji i numerów równań. Uwagi o własnych wyprowadzeniach nie przypisują tych wyprowadzeń autorom źródeł.

| Klucz i źródło | Wersja sprawdzana | Fragment dowodowy | Ocena |
| --- | --- | --- | --- |
| [borisov2022survey](https://arxiv.org/abs/2110.01889v3) | preprint v3, 29.06.2022 | III-C, III-D; IV-A | Heterogeniczność, przygotowanie danych i brak naturalnej lokalności: zgodne. Własna taksonomia i obrót wymagają rozdzielenia zakresu atrybucji (U3). |
| [gorishniy2021revisiting](https://proceedings.neurips.cc/paper/2021/file/9d86d83f925f2149e9edb0ac3b49229c-Paper.pdf) | NeurIPS 2021, PDF wydawcy | §3.2–3.3, rys. 1–2; §4–5, tab. 1–2 | Jedenaście zadań, silny ResNet, FT-Transformer i brak uniwersalnego zwycięzcy: zgodne. Tokenizacja i token CLS odpowiadają opisowi. |
| [grinsztajn2022trees](https://proceedings.neurips.cc/paper_files/paper/2022/file/0378c7692da36807bdec87ab043cdadc-Paper-Datasets_and_Benchmarks.pdf) | NeurIPS 2022, PDF wydawcy | §3.1–3.3; §4–5, doświadczenia z cechami i rotacją | 45 zbiorów; ograniczony trening, usuwanie braków i równoważenie klas: zgodne. Nie należy przenosić przewagi na każdy reżim danych; tekst tego nie robi. |
| [mcelfresh2024tabzilla](https://arxiv.org/abs/2305.02997v4) | preprint v4, 15.07.2024 | §2.1, zwłaszcza Algorithm selection vs. tuning; rys. 4; dodatek D.2 | 19 algorytmów i 176 zbiorów: zgodne. Około jednej trzeciej dotyczy określonego porównania strojenia CatBoost z różnicą najlepszych domyślnych NN/GBDT; tekst zachowuje ten zakres. |
| [holzmueller2024realmlp](https://papers.nips.cc/paper_files/paper/2024/file/2ee1c87245956e3eaa71aaba5f5753eb-Paper-Conference.pdf) | NeurIPS 2024, PDF wydawcy | §2; §3, rys. 1(a); §5.2, rys. 2–3 | 118 meta-train i 90 meta-test oraz zależność wyniku od kolekcji: zgodne. Opis wejścia PBLD wymaga doprecyzowania (U1). |
| [ye2025talent](https://arxiv.org/abs/2407.00956v4) | preprint v4, 07.11.2025 | opis danych, tab. 1; Data splits and tuning; §5.1 | 40 metod, 300 zbiorów bazowych, 64/16/20 i 100 prób: potwierdzone. Wnioski o rodzinach modeli są ograniczone do zestawień autorów. |
| [erickson2025tabarena](https://papers.neurips.cc/paper_files/paper/2025/file/1697e3fb412da11dc9488249f9e7bbc9-Paper-Datasets_and_Benchmarks_Track.pdf) | NeurIPS 2025, PDF wydawcy | rys. 1; opis benchmarku i metryk; dodatek C.3 (s. 47 PDF) | 51 zbiorów, log-loss dla klasyfikacji wieloklasowej, D/T/T+E oraz średnia ośmiu modeli foldów: potwierdzone. Adaptacja pracy własnej jest jawnie odróżniona od oryginału. |
| [rubachev2025tabred](https://arxiv.org/abs/2406.19380v4) | preprint v4, 24.10.2024; publikacja ICLR 2025 | §4, tab. 2; §5.4, rys. 2 | Osiem zbiorów przemysłowych oraz zmiana względnej oceny przy podziale czasowym: potwierdzone. Praca własna nie przypisuje sobie tej analizy. |
| [kadra2021regularization](https://proceedings.neurips.cc/paper_files/paper/2021/file/c902b497eb972281fb5b4e206db38ee6-Paper.pdf) | NeurIPS 2021, PDF wydawcy | §4; §5.1; wyniki i analiza składników | 40 zbiorów oraz wspólny dobór regularyzatorów: potwierdzone. Rozróżnienie takiej optymalizacji i własnej ablacji przy stałych ustawieniach jest zasadne. |
| [saito2015pr](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0118432) | PLOS ONE 10(3), e0118432, 2015 | sekcje PRC o precyzji, czułości i ruchomej linii bazowej; tab. 2 | Adekwatne uzasadnienie analizy precision–recall. Nie jest bezpośrednim źródłem definicji nieinterpolowanej AP używanej w projekcie (U2). |
| [cawley2010selection](https://jmlr.csail.mit.edu/papers/volume11/cawley10a/cawley10a.pdf) | JMLR 11, 2079–2107, 2010 | część o over-fitting in model selection i selection bias; §6 Conclusions | Skończona walidacja i selekcja mogą obciążać ocenę. Cytowanie wspiera zasadę oddzielenia selekcji od testu; nie dowodzi zachowania lokalnego kodu. |
| [demsar2006comparisons](https://jmlr.org/papers/volume7/demsar06a/demsar06a.pdf) | JMLR 7, 1–30, 2006 | §2–3, zwłaszcza s. 5; §3.1–3.2 | Jednostką porównań między zadaniami jest zbiór, nie fold. Cytowanie adekwatne; nie gwarantuje niezależności konkretnych dwunastu zadań. |
| [arik2021tabnet](https://arxiv.org/abs/1908.07442v5) | preprint v5, 09.12.2020; AAAI 2021 | opis TabNet encoder, attentive transformer, równania masek i prior | Sparsemax, sekwencyjne maski, prior i kara entropijna: zgodne. Podpis przyszłego schematu pozostaje warunkowy. |
| [ye2025modernnca](https://arxiv.org/abs/2407.03257v2) | preprint v2, 03.03.2025; ICLR 2025 | §3; §4.1, równanie (4); §4.2 | Miękka agregacja, strata logarytmiczna, nieliniowa reprezentacja i losowanie kandydatów: zgodne. Tekst poprawnie wyłącza własną obserwację z banku treningowego. |
| [gorishniy2025tabm](https://arxiv.org/abs/2410.24210v2) | preprint v2, 11.11.2024; ICLR 2025 | §3.2–3.3, rys. 1; §5.1 | Modulacja współdzielonych wag, mini, osobne głowice, średnia strat i predykcji: zgodne. Foldy i zespół konfiguracji są odrębnymi elementami własnego protokołu. |
| [jaeger2026tabpfn35](https://arxiv.org/abs/2609.17895v2) | raport techniczny v2, 22.09.2026 | §3.1–3.3, rys. 8; opis inferencji | Stałe wagi i kontekst, syntetyczny prior, Fourier, ECDF oraz wskaźniki braków: potwierdzone. Niezmienniczość ograniczono do sygnału rangowego. |
| [chen2016xgboost](https://arxiv.org/html/1603.02754v3) | preprint v3, 10.06.2016; KDD 2016 | §2.2, równania (2)–(7) | Statystyki gradientu i krzywizny, wartość liścia oraz kary: zgodne. W bibliografii brak przypięcia v3 (U4). |
| [prokhorenkova2018catboost](https://arxiv.org/abs/1706.09516v5) | preprint v5, 20.01.2019; NeurIPS 2018 | §3: target statistics; §4: ordered boosting; opis Plain/Ordered | Przeciek przy statystykach kategorii i uporządkowane wzmacnianie: zgodne. Tekst nie utożsamia kodowania ordered z bezwarunkowym użyciem boosting_type=Ordered. |
| [cover1967nearest](https://isl.stanford.edu/~cover/papers/transIT/0021cove.pdf) | IEEE Transactions on Information Theory 13(1), 21–27, 1967 | §I–II, s. 21–22 | Lokalna reguła predykcji według zadanej metryki: zgodna. Uogólnienie do k sąsiadów wsparto dodatkowo dokumentacją; nie przypisano tej pracy odkrycia całej rodziny KNN. |
| [srivastava2014dropout](https://jmlr.org/papers/volume15/srivastava14a/srivastava14a.pdf) | JMLR 15(56), 1929–1958, 2014 | opis procedury i przybliżenia model averaging; §10, skalowanie w treningu | Inverted dropout oraz odróżnienie oczekiwanej aktywacji od oczekiwanego wyniku sieci: zgodne. |
| [loshchilov2019adamw](https://arxiv.org/html/1711.05101v3) | preprint v3, 04.01.2019; ICLR 2019 | §2, algorytm 2, Proposition 2 | Rozdzielenie zaniku i adaptacyjnej aktualizacji: zgodne. Manuskrypt jawnie stosuje inną konwencję współczynnika niż algorytm 2; nie jest to błąd wzoru. Brak wersji w bibliografii (U4). |
| [sklearnLogistic](https://scikit-learn.org/stable/modules/linear_model.html#logistic-regression) | dokumentacja stable, odczyt 11.11.2026; strona oznaczona 1.9.1 | §1.1.11.1–1.1.11.2 | Liniowy logit, model wieloklasowy i regularyzacja: zgodne. Uwagi o braku interakcji są konsekwencją liniowej reprezentacji. |
| [sklearnNeighbors](https://scikit-learn.org/stable/modules/neighbors.html#nearest-neighbors-classification) | dokumentacja stable, odczyt 11.11.2026; strona oznaczona 1.9.1 | §1.6.2 | Głosowanie k sąsiadów, wybór metryki i wag: zgodne. Odległość kwadratowa 2 przy pełnym one-hot jest poprawnym wyprowadzeniem autora. |
| [rtdlImplementation](https://github.com/yandex-research/rtdl-revisiting-models) | repozytorium autorów; lokalnie pakiet 0.0.2 | README: How to use / Code overview; lokalny import FTTransformer | Źródło implementacji jest właściwe. Import i wersję potwierdzono w models/dl/ft_transformer.py oraz pyproject.toml sąsiedniego repozytorium. |

## Rejestr wszystkich miejsc cytowania

**A** — adekwatne w obecnym zakresie; **D** — doprecyzowanie atrybucji lub parafrazy; **U** — uzupełnienie źródła sąsiedniej definicji; **W** — warunkowa ocena planowanej ilustracji. U i D nie oznaczają automatycznie sprzeczności ze źródłem. Każdy klucz odsyła do dowodu w rejestrze źródeł powyżej.

| Miejsce | Klucze | Wynik |
| --- | --- | --- |
| `chapters/01-wstep.tex:8` | `borisov2022survey` | A — Synteza charakterystyki tabel; decyzja o celu pracy jest własna. |
| `chapters/01-wstep.tex:10` | `gorishniy2021revisiting` | A — Mocne odniesienia i wspólny protokół; własne pytania są oznaczone. |
| `chapters/01-wstep.tex:47` | `demsar2006comparisons` | A — Jednostka międzyzbiorowa; nie przypisano autorowi teorii interwencji. |
| `chapters/02-stan-badan.tex:10` | `borisov2022survey` | A — Heterogeniczność i kodowanie; komentarz geometryczny jest własny. |
| `chapters/02-stan-badan.tex:38` | `borisov2022survey` | D — U3: lokalność potwierdzona; rotacja wymaga bliższego odnośnika. |
| `chapters/02-stan-badan.tex:44` | `grinsztajn2022trees` | A — Interwencje na informatywności, regularności i orientacji: zgodne. |
| `chapters/02-stan-badan.tex:50` | `prokhorenkova2018catboost` | A — Ryzyko przecieku statystyk etykiet: zgodne. |
| `chapters/02-stan-badan.tex:61` | `kadra2021regularization` | A — 40 zbiorów i wspólny dobór; własna ablacja odróżniona. |
| `chapters/02-stan-badan.tex:73` | `saito2015pr` | U — U2: uzasadnienie PR potwierdzone; dodać źródło AP. |
| `chapters/02-stan-badan.tex:101` | `erickson2025tabarena` | A — Log-loss wieloklasowy: zgodny; dane własne nie pochodzą z tego cytowania. |
| `chapters/02-stan-badan.tex:105` | `rubachev2025tabred` | A — Osiem zbiorów i wpływ podziału czasowego: zgodne. |
| `chapters/02-stan-badan.tex:112` | `borisov2022survey` | D — U3: własne rozszerzenie taksonomii powinno być jawne. |
| `chapters/02-stan-badan.tex:131` | `gorishniy2021revisiting` | A — 11 zadań, ResNet i FT-Transformer: zgodne. |
| `chapters/02-stan-badan.tex:133` | `grinsztajn2022trees` | A — 45 zbiorów oraz ograniczenia populacji: zgodne. |
| `chapters/02-stan-badan.tex:135` | `mcelfresh2024tabzilla` | A — 19/176 i około jednej trzeciej: właściwy kontekst porównania. |
| `chapters/02-stan-badan.tex:139` | `holzmueller2024realmlp` | A — 118/90 i słabsza klasyfikacja od CatBoost na Grinsztajnie: zgodne. |
| `chapters/02-stan-badan.tex:141` | `ye2025talent` | A — 40/300, 64/16/20, 100 prób oraz kierunek syntezy: zgodne. |
| `chapters/02-stan-badan.tex:143` | `erickson2025tabarena` | A — 51 zbiorów i rozdzielenie warunków; własna adaptacja jawna. |
| `chapters/02-stan-badan.tex:154` | `gorishniy2021revisiting` | A — Wiersz tabeli: 11 zadań. |
| `chapters/02-stan-badan.tex:155` | `grinsztajn2022trees` | A — Wiersz tabeli: 45 zbiorów i kontrolowany reżim. |
| `chapters/02-stan-badan.tex:156` | `mcelfresh2024tabzilla` | A — Wiersz tabeli: 176 zbiorów, różne podzbiory analiz. |
| `chapters/02-stan-badan.tex:157` | `holzmueller2024realmlp` | A — Wiersz tabeli: 118 meta-train, 90 meta-test. |
| `chapters/02-stan-badan.tex:158` | `ye2025talent` | A — Wiersz tabeli: 300 bazowych, osobne rozszerzenia. |
| `chapters/02-stan-badan.tex:159` | `erickson2025tabarena` | A — Wiersz tabeli: 51 początkowych zbiorów. |
| `chapters/02-stan-badan.tex:160` | `rubachev2025tabred` | A — Wiersz tabeli: 8 zbiorów i czasowy podział. |
| `chapters/02-stan-badan.tex:168` | `gorishniy2021revisiting`, `holzmueller2024realmlp`, `ye2025talent` | A — Synteza autora oparta na trzech źródłach; nie wspólny eksperyment. |
| `chapters/02-stan-badan.tex:170` | `grinsztajn2022trees`, `holzmueller2024realmlp` | A — Niejednorodność protokołów i zależność od kolekcji: zgodne. |
| `chapters/02-stan-badan.tex:174` | `cawley2010selection` | A — Ryzyko przeuczenia selekcji: adekwatne źródło. |
| `chapters/02-stan-badan.tex:176` | `demsar2006comparisons` | A — Zbiór jako jednostka; komentarz o meta-ekspozycji jest własny. |
| `chapters/03-metody.tex:44` | `sklearnLogistic` | A — Model liniowych logitów i regularyzacja: zgodne. |
| `chapters/03-metody.tex:51` | `cover1967nearest`, `sklearnNeighbors` | A — Lokalna reguła i k sąsiadów: zgodne; odległość one-hot wyprowadzona. |
| `chapters/03-metody.tex:64` | `chen2016xgboost` | A — Wartość liścia i kary: zgodne z równaniami XGBoost. |
| `chapters/03-metody.tex:71` | `prokhorenkova2018catboost` | A — Ordered TS i ordered boosting rozróżnione poprawnie. |
| `chapters/03-metody.tex:86` | `srivastava2014dropout` | A — Skalowanie treningowe i przybliżenie zespołowe: zgodne. |
| `chapters/03-metody.tex:94` | `loshchilov2019adamw` | A — AdamW: konwencja współczynnika jawna, brak utożsamienia z L2. |
| `chapters/03-metody.tex:127` | `arik2021tabnet` | A — Maski, prior, sparsemax i entropia: zgodne. |
| `chapters/03-metody.tex:134` | `gorishniy2021revisiting` | A — Tokenizator i CLS: zgodne; koszt uwagi dotyczy opisanego mechanizmu. |
| `chapters/03-metody.tex:138` | `rtdlImplementation` | A — Źródło kodu zgodne; lokalny import i pin sprawdzone. |
| `chapters/03-metody.tex:144` | `gorishniy2021revisiting`, `arik2021tabnet` | W — źródła koncepcji trafne; ilustracja jeszcze nie istnieje. |
| `chapters/03-metody.tex:156` | `holzmueller2024realmlp` | D — U1: sprecyzować wejście PBLD po smooth clipping. |
| `chapters/03-metody.tex:173` | `ye2025modernnca` | A — Równanie, cel, inferencja i bank: zgodne z tekstem źródła. |
| `chapters/03-metody.tex:187` | `gorishniy2025tabm` | A — Modulacja, mini, głowice i uśrednianie: zgodne. |
| `chapters/03-metody.tex:204` | `gorishniy2025tabm` | A — Wewnętrzny zespół TabM: właściwa atrybucja. |
| `chapters/03-metody.tex:215` | `gorishniy2025tabm` | W — TabM wspiera zespół wewnętrzny; reszta to protokół własny; brak ilustracji. |
| `chapters/03-metody.tex:222` | `jaeger2026tabpfn35` | A — Inferencja warunkowana kontekstem i prior: zgodne. |
| `chapters/03-metody.tex:224` | `jaeger2026tabpfn35` | A — Fourier/ECDF/braki: zgodne; zastrzeżenie o całym modelu poprawne. |
| `chapters/04-metodyka.tex:12` | `demsar2006comparisons` | A — Zbiór jako jednostka; celowy dobór nie daje automatycznej niezależności. |
| `chapters/04-metodyka.tex:56` | `cawley2010selection` | A — Źródło wspiera zasadę selekcji/testu, nie twierdzenie o lokalnym kodzie. |
| `chapters/04-metodyka.tex:89` | `erickson2025tabarena` | A — Średnia foldów bez dodatkowego refitu: zgodna inspiracja C.3. |
| `chapters/04-metodyka.tex:131` | `saito2015pr` | U — U2: PR adekwatnie uzasadnione; źródło definicji AP do dodania. |

Łącznie: **43 A, 3 D, 2 U, 2 W**. Te liczby dotyczą miejsc cytowania, nie liczby zdań ani unikalnych publikacji. U4 jest uwagą do metadanych źródeł, dlatego nie zmienia oceny merytorycznej odpowiednich wystąpień.

## Identyfikacja audytowanej wersji

Poniższe SHA-256 dotyczą lokalnych plików, wraz z wcześniejszymi niezacommitowanymi zmianami. Nie są manifestem pobranych publikacji. Numeracja linii w raporcie odnosi się do tej wersji.

| Plik | SHA-256 |
| --- | --- |
| `main.tex` | `db402c7aabedab5db9b12374afb62ba97dd83debeaa17d1e4b961c4af3fb6174` |
| `chapters/01-wstep.tex` | `af114017a5a4730380fbadf1a12f4d913b79c160d09cc8f09eccc074a3a4887a` |
| `chapters/02-stan-badan.tex` | `88a549dd87174ec63c4271251565d4eb78ba5dcb09ff1e5df26384e23392141d` |
| `chapters/03-metody.tex` | `ede9d7106cfe2eb2e1e0f648295b19efa4f3c31a4d3e450c7477a446686b0cd0` |
| `chapters/04-metodyka.tex` | `91c62ac4eb1a3b586f2322621f6b74ebf32317df4b07f8f242c528b307ada0bd` |
| `chapters/05-srodowisko.tex` | `f2221f859eb6f97324418d12b6284faa4281e2469d42506775913896cdc374e8` |
| `chapters/06-wyniki.tex` | `2fc1c516b936a6999d2ecb0d442a433878e39e3e7f612365fc84b5cb9b282acd` |
| `chapters/07-mechanizmy.tex` | `42bb37244ecc31b48e673ab21d929dcd68f45caa0bb630e0a7ae6e0a3baeb708` |
| `chapters/08-dyskusja.tex` | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` |
| `bibliography/references.bib` | `3fdd9df35942301a08b04e5d505162c51972eb1fc2f8b391a4bfb6119ef13902` |

Kontrola techniczna raportu: wszystkie 50 wystąpień otrzymało wpis, wszystkie 24 klucze mają rejestr źródła, brak nierozwiązanych kluczy bibliograficznych. Nie kompilowano ponownie LaTeX, ponieważ audyt nie zmienił manuskryptu ani bibliografii. Brak uwag krytycznych nie stanowi dowodu prawdziwości wyników cytowanych prac.
