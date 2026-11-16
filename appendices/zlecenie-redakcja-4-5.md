"# Zlecenie: redakcja końcowa rozdziału 5 i domknięcie rozdziału 4

Ten plik wystarcza do wykonania zadania razem z `AGENTS.md` repozytorium pracy. Wszystkie fakty o implementacji sprawdzono w kodzie 16.11.2026. Dowody podano w części 3. Nie trzeba ich ponownie weryfikować, ale można.

Stan wyjściowy:
- repozytorium pracy: commit `5f421bc`, numery linii odnoszą się do niego. Po pierwszych edycjach szukaj miejsc po treści;
- repozytorium eksperymentów: `/home/k.bugala/ws/ablation-experiments` (remote `mgr-repo`), HEAD `e09cf5f`.

Zastępuje `plans/plan-redakcja-rozdzial-5.md`, który powstał bez dostępu do kodu.

---

## 0. Bezwzględne ograniczenia

1. **Repozytorium eksperymentów jest tylko do odczytu.** Trwają w nim uruchomienia badań A i B, a ich identyfikator obejmuje sumę kontrolną kodu. Każda zmiana pliku w `src/`, `pyproject.toml` lub `uv.lock` może je unieważnić. Nie wolno:
   - zapisywać, tworzyć ani usuwać żadnych plików;
   - uruchamiać poleceń git innych niż `git --no-optional-locks log/show/diff/grep/ls-files`;
   - uruchamiać Pythona, `uv`, `make`, testów i skryptów z tego repozytorium;
   - tworzyć `__pycache__`, `.venv` ani plików tymczasowych w jego katalogu.

   Do odczytu używaj `Read`, `Grep`, `cat`, `sed -n`. Jeśli coś liczysz, uruchamiaj `python3 -I` z `/tmp` i podawaj bezwzględną ścieżkę pliku jako argument. Nie importuj modułów z repozytorium.
2. **Nie czytaj predykcji ani metryk testowych badań A i B** (`results/study-a*`, `results/study-b`).
3. **Nie zmieniaj rozdziałów 1–3**, z jednym wyjątkiem w pkt 5.15. Nie zmieniaj też bibliografii ani `template/`.
4. **Nie zmieniaj projektu badań:** liczb, reguł, metryk, zbiorów ani metod. Wyjątkiem są poprawki niezgodności tekstu z kodem z części 3.2. Tekst ma opisywać to, co zaimplementowano.
5. **Nie commituj.** Kompilacja tylko w `build/` przez `bash regen-pdf.sh`. Jeśli brakuje `pdflatex`, zgłoś to i nie deklaruj kompilacji.
6. **Zasady treści:**
   - Badania A i B są zamierzonym rozszerzeniem badania głównego, więc zdania o kolejności („po badaniu głównym”, „przed uczeniem w B”) są dopuszczalne.
   - W rozdziałach 4–5 nie może być zdań o stanie prac: „jeszcze”, „należy sprawdzić”, „wymaga porównania”, „Do uzupełnienia”, „TODO”.
   - Nie może być odwołań do dokumentów roboczych, sesji, przekazań ani dat redakcji.

---

## 1. Cel

- **Rozdział 4:** domknąć luki w regułach i poprawić niezgodności z kodem. Rozdział jest merytorycznie mocny i wymaga poprawek punktowych.
- **Rozdział 5:** przebudować tak, żeby opisywał środowisko badawcze w kategoriach istotnych dla wiarygodności wyników, a nie dokumentację repozytorium.

Ocena wyjściowa (niezależny recenzent i redaktor, skala 1–10):

| Kryterium | R. 4 | R. 5 |
| --- | ---: | ---: |
| Merytoryka | 7–8 | 6 |
| Struktura | 7–8 | 5 |
| Język | 7–8 | 6 |
| Stylistyka | 6–7 | 4 |
| „Ludzkość” | 6–7 | 4 |
| Gotowość | 7 | 4 |

Pomiary dla r. 5:
- około 2550 słów;
- „się” 15,7 na 1000 słów (r. 1–4: 9,5–14,0);
- 59 wystąpień `\texttt`/`\path` (r. 4: 5, r. 3: 2).

Cele dla r. 5 po redakcji:
- 2000–2400 słów;
- „się” poniżej 13 na 1000 słów;
- `\texttt`/`\path` najwyżej 12, tylko w nazwach bibliotek i w przypisie z rewizją;
- „należy” 0–1 raz.

---

## 2. Decyzje autora

Agent stosuje kolumnę „Przyjęte”. Autor może ją zmienić przed przekazaniem.

| ID | Kwestia | Przyjęte |
| --- | --- | --- |
| D1 | Gdzie opisać sprzęt | **R. 5** zawiera konfigurację stanowiska z części 3.1, F1. **R. 6** opisuje współbieżne uruchomienia i obciążenie. |
| D2 | **Chronologia reguł analizy badania głównego.** Weryfikacja (F26) wykazała, że przed kampanią (9.11) zapisano tylko ogólne zasady (zbiór jako jednostka, opisowe rankingi jako uzupełnienie, wymóg wcześniejszego ustalenia kontrastów). Konkretne kontrasty i bootstrap nie są zapisane w repozytorium dla badania głównego. Reguły bootstrapu dodano 16.11, po kampanii, i dotyczą one A i B. | **Patrz pkt 5.5.** W r. 4 nie twierdzić, że konkretne reguły analizy badania głównego ustalono przed treningami. Zastosować sformułowanie neutralne co do czasu, z prawdą o rozdzieleniu wyboru od testu. Fakt chronologiczny wpisze autor do r. 6 (pole w `06:10` pozostaje). **Autor musi to zatwierdzić.** |
| D3 | `log_loss_val` (dotąd fragment chroniony) | Usunąć z r. 5 nazwę pola i wyznanie usterki. Zostaje jedno zdanie zasady: metryki w tabelach pracy przypisuje się według populacji, na której powstała predykcja. |
| D4 | Ścieżki, moduły, pola JSON | Zastąpić opisem pojęciowym. Nie przenosić ich do załącznika. |
| D5 | Dublet `tab:poziomy-zespolow` i `fig:zespoly` w r. 4 | Zostawić bez zmian. Poprawić tylko formatowanie tabeli. |
| D6 | Bootstrap badania głównego nie jest zaimplementowany (F27), a predykcje są zapisane (3730 plików) | R. 4 opisuje bootstrap jako część planu analizy. To dopuszczalne, ale analizę trzeba wykonać poza repozytorium eksperymentów albo po zakończeniu A/B. **Nie zmieniać kodu teraz.** Zgłosić w raporcie. |

---

## 3. Zweryfikowane fakty

Ścieżki są względne wobec `/home/k.bugala/ws/ablation-experiments`. `SP/` oznacza `.venv/lib/python3.11/site-packages`.

### 3.1. Fakty do wykorzystania w tekście

| ID | Fakt | Dowód | Użycie |
| --- | --- | --- | --- |
| F1 | Stanowisko: GPU NVIDIA RTX PRO 6000 Blackwell Max-Q Workstation Edition, 95 GiB pamięci (`gpu_memory_bytes` 102 069 305 344), sterownik 615.71.10, CUDA 13.0, PyTorch 2.13.0+cu130, Python 3.11.15, Linux 7.0 x86-64 (glibc 2.39), 128 wątków logicznych CPU, ok. 755 GiB RAM. Host ma cztery karty. Model widzi urządzenie 0. Na zadanie przydzielano 4 wątki CPU i jedno GPU. Uruchomienia na hoście, bez kontenera. Identyczne we wszystkich 30 manifestach kampanii. Model CPU nie jest zapisany. | `results/runs/thesis-lite/*/manifest.json` → `identity.host`; `runner.py:306-331` | 5.7 |
| F1a | GPU było współdzielone. 9.11 o 19:08 wystartowało równolegle sześć procesów roboczych, a komunikat OOM wymienia 12 innych procesów na GPU 0. Obciążenia GPU nie rejestrowano: `nvidia-smi` służy tylko do odczytu wersji sterownika. | `results/logs/w1..w6.log:2`; `compact/final_failures.csv` (bioresponse-realmlp-001); F18 | 5.5 (granica pomiaru), r. 6 |
| F2 | Budżet 3600 s obejmuje całe zadanie konfiguracji: 8 foldów i przetwarzanie wstępne AutoGluon. Dzieli go AutoGluon dynamicznie: fold dostaje około 0,8 × (pozostały czas / pozostałe foldy). Gdy prognoza czasu pozostałych foldów przekracza budżet albo czas się kończy, AutoGluon zgłasza przekroczenie limitu i konfiguracja jest nieudana. Limit jest doradczy, a nie twardym limitem procesu, więc pojedyncze natywne dopasowanie może go przekroczyć. Wczytanie danych i podział zewnętrzny są poza limitem. | `configs/config.yaml:11`; `backend.py:168-171`; `SP/autogluon/core/models/ensemble/fold_fitting_strategy.py:156,248-264,292-299`; `docs/setup.md:25` | 4 (pkt 5.4), 5.3 |
| F3 | **Nieudana:** wyjątek przekroczenia limitu od AutoGluon albo lokalna sieć bez ukończonej pierwszej epoki. **Zatrzymana i dopuszczona:** lokalne MLP i FT-Transformer kończą przed kolejną epoką albo porzucają niepełną epokę i wracają do najlepszego stanu. TabNet kończy bieżącą epokę. Znacznik zatrzymania z powodu budżetu zapisują **tylko** MLP, FT-Transformer i TabNet. TabM i ModernNCA kończą pętlę epok według prognozy czasu i przywracają najlepszy stan **bez znacznika**. RealMLP przekazuje budżet do pytabkit, też bez znacznika. W A i B obcięcie dyskwalifikuje wynik. | `dl/training.py:18-44`; `dl/torch_classifier.py:83-95,176-180`; `dl/tabnet_model.py:24-33`; `runner.py:285-288`; `SP/tabarena/models/tabm/_internal/_tabm_internal.py:297-301`; `SP/tabarena/models/modernnca/_internal/modernnca_method.py:145-150` | 4 (pkt 5.4), 5.3 |
| F4 | Zatrzymanie i wybór stanu w badaniu głównym:<br>• **MLP, FT-Transformer:** strata walidacyjna, cierpliwość 10, do 100 epok, najlepszy stan.<br>• **TabNet:** cierpliwość 10, AUC (binarne) lub strata log. (wieloklasowe).<br>• **RealMLP:** domyślnie bez zatrzymania. W wariancie rozszerzonym przestrzeni z zatrzymaniem. Wybór najlepszej epoki według metryki zadania.<br>• **ModernNCA:** zatrzymanie po ponad 20 epokach bez poprawy (do 200), powrót do najlepszego stanu.<br>• **TabM:** cierpliwość 16, najlepszy stan.<br>• **CatBoost:** zatrzymanie po 50 iteracjach bez poprawy na walidacji foldu, w badaniu głównym i w A tak samo.<br>• **XGBoost:** bez wczesnego zatrzymania, pełne `n_estimators`.<br>• **Regresja logistyczna:** do 1000 iteracji.<br>• **KNN:** nie dotyczy. | `torch_classifier.py:135`; `tabnet_model.py:102-115,440,449`; `SP/tabarena/models/realmlp/model.py:313-316`; `modernnca_method.py:428-432`; `SP/tabarena/models/tabm/hpo.py:15`; `catboost_model.py:42-46`; `xgboost_model.py:36-41` | 4 (pkt 5.1), załącznik |
| F7 | Prawdopodobieństwa przy zapisie: zakres [0, 1], wartości skończone, suma wiersza zgodna z 1 z tolerancją bezwzględną $10^{-5}$, potem renormalizacja. | `evaluation/metrics.py:130-138`; `backend.py:56-62` | 5.2 |
| F8 | Identyfikator badania to SHA-256 kanonicznego zapisu: pełnych ustawień (w tym ścieżek danych i wyników), manifestów danych, sumy kontrolnej kodu (`src/**/*.py`, `pyproject.toml`, `uv.lock`) i wersji pakietów, charakterystyki sprzętu oraz protokołu. Ścieżki wchodzą, bo należą do ustawień, a w kodzie brak uzasadnienia. Commit git i obraz kontenera nie są zapisywane automatycznie. | `artifacts.py:64-100`; `runner.py:60-76,299-331`; `configuration.py:20-37` | 5.3 |
| F9 | Dla KNN zapisuje się dostępną i efektywną liczbę wierszy zbioru odniesienia oraz efektywną liczbę sąsiadów. Podpróbkowanie przez budżet działa tylko przy ponad 10 000 wierszy. | `upstream_models.py:55-63`; `SP/autogluon/tabular/models/knn/knn_model.py:170-219` | 5.3 (cel odsyłacza `04:68`) |
| F11 | Wykonanie sekwencyjne (`sequential_local`, pętla bez równoległości). Uzasadnienie w kodzie i dokumentacji: jedno GPU i 4 wątki na zadanie, a integracja ModernNCA zakłada sekwencyjne dopasowania. Wersja AutoGluon 1.6.3b20260918 jest zgodna z wymaganiem TabArena 0.1.0 (`autogluon.tabular>=1.6,<1.7`). Powodu wyboru wersji przedpremierowej w repozytorium nie zapisano. | `backend.py:150`; `runner.py:1,92-101`; `upstream_models.py:41`; `SP/tabarena-0.1.0.dist-info/METADATA` | 5.1, 5.7 |
| F12 | T+E: zachłanny wybór do 100 kroków z najkrótszym prefiksem najlepszego wyniku. Ziarno 42 rozstrzyga **wyłącznie remisy**: wybór losowy spośród równorzędnych, z pierwszeństwem modeli już obecnych. Konfiguracja domyślna ma indeks 0. T to pierwsze maksimum po indeksie, więc remis rozstrzyga niższy indeks. $\mathcal{C}$ obejmuje udane konfiguracje jednej metody na jednym zbiorze. | `reporting.py:56,64-100`; `SP/autogluon/core/models/greedy_ensemble/ensemble_selection.py:43-68,150-178,208-213`; `catalog.py:39-42` | 4 (pkt 5.11, 5.18) |
| F13 | Pola czasu w raporcie:<br>• czas dopasowania udanych konfiguracji;<br>• czas rzeczywisty wszystkich prób, łącznie z nieudanymi i powtórzonymi (pusty, gdy próba nie ma zapisanego końca);<br>• czas dopasowania i czas predykcji testowej konfiguracji o dodatniej wadze;<br>• czas samego wyboru D/T/T+E z zapisanych predykcji OOF. | `reporting.py:19-25,101-137` | 5.5 |
| F15 | Ziarna badania głównego:<br>• 42: podział zewnętrzny (pierwszy z trzech foldów);<br>• 42 + numer foldu (42…49): inicjalizacja modeli;<br>• ziarno podziału wewnętrznego wyznacza AutoGluon;<br>• ziarno wyszukiwania (42) jest osobnym polem;<br>• ziarno zespołu (42) jest stałą w raporcie;<br>• TabPFN: 0.<br>W A i B ziarno uczenia (0, 10, 20) zastępuje ziarno modeli, a fold dostaje ziarno + numer foldu. Wartość 42 występuje więc w kilku niezależnych rolach. | `configuration.py:33-35`; `data/tasks.py:34-42`; `backend.py:108,149-154`; `catalog.py:27-37`; `reporting.py:92` | 4 (pkt 5.13) |
| F16 | Konwencje metryk przy zerowym mianowniku:<br>• **raport badania głównego**: precyzja, czułość i F1 klas = 0 (`zero_division=0`), a nieokreślone AUC = brak wartości;<br>• **analiza A i B**: precyzja bez alarmów jest nieokreślona, czułość i FPR przy zerowym mianowniku też, F1 jest nieokreślone tylko przy zerowym pełnym mianowniku.<br>Obie konwencje są zamierzone i rozdzielne. | `evaluation/metrics.py:70-71,94-96`; `scripts/mechanism_analysis.py:61-67` | 5.5, załącznik `A:250` |
| F17 | Przed i po dopasowaniu oraz predykcji na GPU wykonuje się synchronizację urządzenia, żeby asynchroniczne obliczenia CUDA mieściły się w mierzonym czasie. | `backend.py:25-52,192` | 5.5 |
| F18 | Pamięć mierzy się wyłącznie podczas dopasowania: szczyt RSS procesu i procesów potomnych (próbkowanie co 0,05 s) oraz pamięć przydzieloną i zarezerwowaną przez PyTorch na urządzeniu 0. Pamięci inferencji nie mierzy się. Czas inferencji mierzy się (predykcja testowa). Pomiary pamięci zostają w rekordach konfiguracji i nie trafiają do raportu zbiorczego. | `SP/tabarena/benchmark/exec_models/base.py:328-370`; `SP/tabarena/utils/memory_utils.py:97-166`; `docs/setup.md:125-131` | 5.5 |
| F19 | 4 wątki CPU na zadanie (zmienne OMP/MKL/OpenBLAS, `torch.set_num_threads`, `thread_count` CatBoost, `n_jobs` XGBoost). Partia predykcji 4096 trafia tylko do lokalnych adapterów: MLP i FT-Transformer biorą minimum z partią uczenia, a TabNet używa jej jako partii predykcji. Natywne integracje i TabPFN jej nie dostają. | `configs/config.yaml:10,12`; `runtime.py:42-51`; `backend.py:129-135` | 5.5 lub 5.7 |
| F20 | Scalanie wyników: dla każdej pary zbiór–metoda bierze się uruchomienie z najpóźniejszym czasem pierwszej próby. Brak powrotu do starszego: niekompletność albo nieudana konfiguracja domyślna kończy się błędem. Wymagana jest jedna suma danych i jeden podział na zbiór. Zastąpiono 30 komórek (lokalne sieci z pierwszej wersji kodu). Eksport łączy trzy wersje kodu:<br>• 70 par: pierwsza wersja, przed obcinaniem budżetu i automatycznym doborem partii. Tylko metody, których to nie dotyczy: LR, KNN, XGBoost, CatBoost, RealMLP, ModernNCA, TabM na 10 zbiorach;<br>• 12 par: z automatycznym doborem partii (MLP, TabNet, FT-Transformer na czterech małych zbiorach);<br>• 50 par: wersja końcowa (11 metod).<br>Wyłączenie `Time` działa przez ustawienia zbioru, których suma kodu nie obejmuje. | `scripts/aggregate_final.py:5-8,27-34,78,91-98,134-137`; `results/final/final_sources.csv`; `compact/final_superseded.csv` | **r. 6** (fakt), r. 5 jedno zdanie zasady |
| F21 | Kompletność: 372 wiersze (D 132, T 120, T+E 120), 3132 zadania, 3097 udanych, 35 nieudanych (34 limit czasu, 1 brak pamięci GPU). 80 konfiguracji i 436 foldów ze znacznikiem obcięcia: FT 53/340, TabNet 15/35, MLP 12/61. Liczby w r. 6 są poprawne. | `compact/final_summary.csv`, `final_sources.csv`, `final_failures.csv` | r. 6 bez zmian |
| F22 | Czas predykcji testowej jest dla wszystkich 372 wierszy, w tym KNN i TabPFN na 12 zbiorach. | `compact/final_summary.csv` | 5.5 |
| F23 | TabPFN dla Covertype ukończony 16.11. Wynik jest w eksporcie. | `final_sources.csv` | r. 6 |
| F25 | Covertype pominięto w wyborze konfiguracji B, bo przebiegi MLP, FT i TabNet po zmianie doboru partii były **obcięte budżetem** (wszystkie 26 konfiguracji udane, ale 12/26/8 obciętych). Nie wynikało to z braku konfiguracji. Reguła kompletności źródeł B: 26 udanych kandydatów na zbiorze, identyczne parametry, zgodne sumy artefaktów. | `docs/tabarena-evaluation.md:102`; `scripts/select_mechanism_sources.py:13-16,38-39,382-391`; `final_sources.csv` | r. 7 (korekta opisu), 4 (pkt 5.9b) |
| F26 | Chronologia:<br>• 7.11, `68f0fb3`: ogólne zasady analizy;<br>• 9.11 19:08: pierwsze próby kampanii;<br>• 16.11 10:50: ostatnia próba (TabPFN, Covertype);<br>• 16.11 13:29, `ad5ff91`: konkretne reguły A/B (2000 replik, ziarno 42, przedział 95%, kryterium norm [0,98; 1,00], wyłączenie Covertype);<br>• 16.11 15:07: start pilota A/B.<br>Zamrożenie kontrastów badania głównego figuruje w dokumentacji jako zadanie otwarte. | `git log` dla `docs/tabarena-evaluation.md`; `docs/implementation-status.md:88` | D2, r. 6 i 7 |
| F27 | Badanie główne nie ma implementacji bootstrapu ani kontrastów. `evaluation/statistical.py` zawiera nieużywane funkcje Wilcoxona i Friedmana. Bootstrap istnieje tylko dla A/B. Predykcje badania głównego są zapisane. | `evaluation/statistical.py:1`; `scripts/mechanism_analysis.py:170-257`; `docs/setup.md:113` | D6 |
| F28 | Weryfikacja platformy:<br>• 9 plików testów i 92 funkcje testowe w HEAD; wliczając parametryzację, dokumentacja podaje 202 testy dla wersji A/B;<br>• dla wersji kampanii dokumentacja podaje 161 zaliczonych testów;<br>• test syntetyczny: 180 wierszy, regresja logistyczna i dwuepokowe MLP, konfiguracja domyślna i jedna losowa, 8 foldów, czyli 4 zadania, 32 dopasowania foldów i 6 wierszy raportu;<br>• na docelowej karcie wykonano jeden przebieg syntetyczny na GPU (9.11, przed kampanią);<br>• formalnej kwalifikacji GPU ani zalecanego pilotażu nie przeprowadzono. | `tests/`; `docs/implementation-status.md:44-86`; `results/runs/smoke/78e82b55*/manifest.json` | 5.6 |
| F29 | AutoGluon usuwa kolumny stałe w obrębie foldu (lub podzbioru B) przed dopasowaniem modelu (`drop_unique=True`), także we wszystkich metodach z baggingiem. Wejście danych zachowuje stałe kolumny. | `SP/autogluon/core/models/abstract/_auxiliary_params.py:143`; `backend.py:181-185` | 4 (pkt 5.12) |
| F30 | Diabetes: rozłączność pacjentów na obu poziomach. Stratyfikacja grupowa **tylko na poziomie zewnętrznym**. Foldy wewnętrzne to `GroupKFold` z tasowaniem, bez stratyfikacji (ziarno biblioteki 4267). | `data/tasks.py:41`; `backend.py:116`; `SP/data_foundry/curation_recommendations.py:17,367` | 4 (pkt 5.0) |
| F31 | KNN w zadaniach IID: przygotowanie cech (kodowanie zero-jedynkowe, skalowanie) i jedno dopasowanie na całej części rozwojowej. Predykcja testowa pochodzi z tego jednego modelu, a nie ze średniej foldów. | `backend.py:155`; `SP/autogluon/core/models/ensemble/bagged_ensemble_model.py:397-403,870-871`; `SP/tabarena/models/knn/model.py:31` | 4 (pkt 5.3) |
| F32 | Uzasadnienia doboru w A i B z dokumentacji:<br>• zbiory A to trzy przewidziane zadania rzadkiej klasy;<br>• TabM wyłączono, bo integracja natywna wymagałaby osobnej ścieżki ważonej straty;<br>• zbiory B: mała liczność i wysoka wymiarowość.<br>Wyboru CatBoost zamiast XGBoost **nie uzasadniono**. XGBoost w potoku nie ma obsługi mechanizmów A. | `docs/dataset-selection.md:22-24,67-69`; `docs/tabarena-evaluation.md:80,130`; `models/specification.py:166-181,257-282` | 4 (pkt 5.9) |
| F33 | Kryterium zgodności norm w B: stosunek norm w przedziale [0,98; 1,00], reguła diagnostyczna. Zapisane 16.11 w `ad5ff91`, po wyborze konfiguracji, przed startem A/B. | `scripts/analyze_study_b.py:159`; `docs/tabarena-evaluation.md:120` | 4 (pkt 5.5b) |
| F34 | Przestrzenie strojenia z załącznika zgadzają się z kodem. Sprawdzono ponad 10 wartości (MLP, CatBoost, XGBoost, TabM, ModernNCA, KNN, RealMLP). Definicje przestrzeni sześciu metod niezmienionych w kampanii są identyczne między wersjami kodu. MLP, FT i TabNet zmieniły się (mnożnik partii), ale w eksporcie występują tylko w wersjach po zmianie. | `configs/model/*.yaml`; `SP/tabarena/models/*/hpo.py`; `git diff --stat fa57358 79299f5 -- configs/model` | bez zmian |

### 3.2. Niezgodności tekstu z kodem, obowiązkowo do poprawy

| # | Miejsce | Tekst | Stan w kodzie |
| --- | --- | --- | --- |
| N1 | `04:64` | „Stratyfikację grupową zastosowano na obu poziomach” | Tylko na poziomie zewnętrznym. Wewnątrz grupowe foldy bez stratyfikacji (F30). |
| N2 | `04:56` | „Uczenie kończy się po dziesięciu epokach bez poprawy” bez zawężenia | Dotyczy MLP, FT-Transformera i TabNet. Pozostałe metody mają inne reguły (F4). |
| N3 | `04:81` | „W sześciu uczonych metodach neuronowych budżet jest dodatkowym kryterium zakończenia” | Prawda co do działania, ale znacznik rejestrują tylko trzy (F3). Uzupełnić. |
| N4 | `04:159` | „TabM pominięto, gdyż jego użyta implementacja nie obsługuje wag straty” | Integracja natywna nie ma ścieżki ważonej straty, a jej dodanie zmieniłoby ocenianą procedurę (F32). Przeformułować. |
| N5 | `04:184` | „na zbiorach badania głównego rozłącznych z B” | Faktycznie osiem zbiorów, bez Covertype (F25). Patrz pkt 5.9b. |
| N6 | `A:182` | ModernNCA `n_epochs` 200 „stała” | Liczba epok jest stała, ale działa zatrzymanie po ponad 20 epokach bez poprawy (F4). Dopisać. |
| N7 | `04:45`, `A:239` | „Zachowano… stałe kolumny” | W danych tak. Przed modelem AutoGluon usuwa kolumny stałe w obrębie foldu (F29). Doprecyzować. |
| N8 | `05:150` / `A:250` | Pozorna sprzeczność `zero_division=0` z „precyzja nieokreślona” | Dwie zamierzone konwencje (F16). Nazwać obie. |
| N9 | r. 7, `sec:mechanizmy-kontrole` | „Covertype pominięto z powodu niekompletnych lub obciętych przebiegów” | Przebiegi były kompletne, ale obcięte budżetem (F25). Patrz pkt 6.3. |

---

## 4. Rozdział 5: nowa architektura i poprawki

### 4.0. Układ

Etykiety zachować: `chap:srodowisko`, `sec:architektura-platformy`, `sec:izolacja-platformy`, `sec:artefakty-wznowienie`, `sec:partie-platformy`, `sec:pomiary-platformy`, `sec:kwalifikacja`, `sec:wykonanie-kampanii`, `tab:dobor-partii`, `tab:wersje`, `tab:zakres-pomiarow`, `fig:architektura`, `tab:warstwy-platformy`, `tab:artefakty`. Etykietę `sec:wymagania-platformy` przenieść do wstępu, ale najpierw sprawdzić `grep`, czy ktoś się do niej odwołuje.

| Nowa sekcja | Źródło | Funkcja |
| --- | --- | --- |
| Wstęp | `:5`, `:10`, `:14` | Motywacja (koszt awarii przy 3132 zadaniach i budżecie godziny) i trzy wymagania: identyfikowalność każdej predykcji, kontrola przepływu informacji, wznowienie bez utraty ukończonych wyników |
| Architektura i integracje | `:12`, `:16–48` | Warstwy, integracje lokalne i natywne, wykonanie sekwencyjne i jego powód |
| Identyfikowalność danych i spójność predykcji | `:50–61` | Dane, podziały, mapowanie klas, kontrola macierzy |
| Zapis wyników, awarie i wznowienie | `:63–94` | Co się zapisuje i po co, zapis atomowy, awarie i limit czasu, wznowienie |
| Dobór partii i ograniczenia pamięci | `:96–120` | Bez zmian merytorycznych |
| Pomiar kosztu | `:122–150` | Co zmierzono, czego nie zmierzono, warunki pomiaru |
| Weryfikacja poprawności platformy | `:152–159` | Testy i przebieg syntetyczny, bez wyników kampanii |
| Środowisko wykonania | `:161–194` | Stanowisko, wersje, odtworzenie |

Schemat każdej sekcji: wymaganie metodyczne (z odsyłaczem do r. 4) → rozwiązanie → granica rozwiązania. Wzorce w tekście to `:5` i pierwsze zdanie `:57`.

### 4.1. Wstęp i architektura

1. **`:7–14`:** scalić 5.1 ze wstępem. Zdanie `:14` włączyć do wymagań. „zadania jeszcze nieukończonego” zmienić na „zadania przerwanego lub niepodjętego”.
2. **`:5`:** zostawić. Przy pierwszym użyciu zdefiniować „kampanię”: komplet obliczeń badania głównego.
3. **`:12`:** zamienić kalkę „Ustawienia YAML przechodzą przez centralny moduł konfiguracji” na opis: ustawienia badania są walidowane i scalane w jednym miejscu, a każdy model jest dostępny przez wspólny interfejs zwracający prawdopodobieństwa klas. Dodać powód wykonania sekwencyjnego (F11): na każde zadanie przypada jedno GPU i cztery wątki CPU, a integracja ModernNCA zakłada sekwencyjne dopasowania.
4. **`tab:warstwy-platformy`:** usunąć kolumnę „Główne moduły” albo zastąpić ją pojęciami (D4). Dodać `@{}` na brzegach.
5. **`:40`:** rozdzielić na dwa akapity: (a) integracje lokalne i natywne; (b) cechy przekazywane w oryginalnych typach, wspólne automatyczne przygotowanie cech AutoGluon wyłączone, a przekształcenia należą do integracji. Usunąć stąd zdanie o synchronizacji GPU (trafia do 4.5).
6. **`:42`:** usunąć zdanie o `experiments/cli.py` i „rozwiązywaniu” konfiguracji. Zostaje odsyłacz do rysunku.

### 4.2. Identyfikowalność

7. **`:53`:** usunąć zdanie o Santanderze (OpenML 46859 v2). Brak kolumny `ID` opisuje `04:47`, a identyfikatory są w odnośnikach `tab:rejestr-zadan`. Nazewnictwo ujednolicić: przy pierwszym użyciu „suma kontrolna SHA-256”, potem „suma kontrolna”. Usunąć „wynik funkcji haszującej (ang. hash)” i „skrót”.
8. **`:55`:** usunąć zdanie o zastrzeżonych nazwach kolumn.
9. **`:57`:** „raporter” zmienić na „moduł raportowania”. Zdanie o normalizacji uzupełnić faktem F7: suma wiersza musi zgadzać się z 1 z tolerancją $10^{-5}$, po czym prawdopodobieństwa się renormalizuje. Dwa ostatnie zdania scalić w jedno zdanie granicy kontroli.
10. **`:59`:** usunąć. Brak podziału czasowego jest w `04:266`.
11. **`:61`:** według D3. Zostają dwa zdania: (a) metryki w tabelach pracy przypisuje się według populacji, na której powstała predykcja; (b) w badaniu A średnią precyzję odczytuje się dla kolumny klasy rzadkiej wskazanej przez mapowanie etykiet, także gdy klasa ma kod 0. Usunąć „Te rozbieżności… muszą być uwzględnione w analizie”. Razem z tym usunąć ostatnie zdanie `04:152` („Techniczne nazwy pól raportu…”).

### 4.3. Zapis wyników, awarie i wznowienie

12. **`:66`:** opisać identyfikator badania według F8, bez nazw plików. Usunąć „należy zachować osobno” i zastąpić zdaniem: rewizji repozytorium nie zapisuje się automatycznie, więc wersję kodu identyfikuje suma kontrolna źródeł i pliku blokady zależności. Kontenera nie używano, więc nie wspominać. Zdanie „Zmiana ścieżek może zmienić tożsamość” usunąć albo przepisać jako konsekwencję: identyfikator obejmuje wszystkie ustawienia, w tym ścieżki, więc przeniesienie danych tworzy nowe badanie. Słowo „tożsamość” zamienić na „identyfikator” lub „identyfikowalność”.
13. **`tab:artefakty`:** tabela pojęciowa (D4) z kolumnami „Zapis”, „Zawartość” i „Rola przy odtwarzaniu”. Wiersze:
    - ustawienia i wykaz zadań badania;
    - definicja podziału zewnętrznego;
    - ustawienia konfiguracji;
    - stan i historia prób;
    - metadane wykonania i czasy;
    - predykcje OOF i testowe (TabPFN bez OOF);
    - diagnostyka niepowodzeń;
    - raport D/T/T+E.

    Podpis bez „katalogu jego tożsamości”. `@{}`.
14. **`:88`:** zamiast siedmiu pól JSON napisać po polsku, co zapisuje się dla każdego foldu lokalnych sieci: efektywny rozmiar partii (dla TabNet także partii wirtualnej), znacznik zatrzymania z powodu budżetu, liczbę ukończonych epok, przydzielony czas i czas dopasowania. Dopisać według F2 i F3:
    - budżet 3600 s obejmuje całe zadanie konfiguracji. AutoGluon przydziela foldom czas dynamicznie, według pozostałego budżetu, a gdy prognoza czasu pozostałych foldów go przekracza, przerywa konfigurację jako nieudaną;
    - lokalne sieci zatrzymane przez budżet po co najmniej jednej epoce wracają do najlepszego stanu i pozostają ważne. Znacznik takiego zatrzymania zapisują tylko trzy lokalne sieci. TabM i ModernNCA kończą uczenie według prognozy czasu bez znacznika, a RealMLP przekazuje budżet do własnej implementacji. Brak znacznika nie świadczy o pełnym budżecie uczenia.

    Ten fragment usuwa jednocześnie powtórzenia z `:94` i `:199`.
15. **Dla KNN dopisać jedno zdanie (F9):** zapisuje się liczbę dostępnych i faktycznie użytych wierszy zbioru odniesienia oraz efektywną liczbę sąsiadów. Zbiór odniesienia jest podpróbkowany przy ograniczeniu czasu, jeśli ma ponad 10 000 wierszy. To realizuje odsyłacz z `04:68`.
16. **`:92`:** usunąć „niezerowym kodem zakończenia” i „Oddzielne polecenie raportowania”. Zostaje zasada: awaria konfiguracji nie przerywa niezależnych zadań, a pełny raport wymaga udanej konfiguracji domyślnej i zakończenia wszystkich prób. Dopuszczanie jawnie nieudanych konfiguracji losowych zostawić jako odsyłacz do `sec:warunki-raportowania`.
17. **`:94`:** usunąć trzecie zdanie (powtarza `04:81` i `04:114`). Rozdzielić trzy własności:
    - raport można odtworzyć z zapisanych predykcji;
    - nowe predykcje wymagają ponownego dopasowania, bo modele są usuwane;
    - nie deklarować bitowej powtarzalności ponownego uczenia na GPU.

### 4.4. Partie

18. **`:99`:** zostawić. Mnożnik `{0,5; 1; 2}` pozostaje też w `04:77`, ale tam jako zdanie zasady z odsyłaczem.
19. **`tab:dobor-partii`:** przedziały ze średnikiem i spacjami tysięcy, np. `$[2\,000;\ 8\,000)$`. `@{}`.
20. **`:118`:** zdanie o jawnym rozmiarze partii połączyć z badaniem B (F12/V12: B podaje partię jako liczbę całkowitą, `run_mechanism_studies.py:138`): „Taki tryb stosuje się w badaniu B, w którym partia jest stała dla zbioru.” Usunąć powtórzenie z `:120` („Jeżeli rozmiar zadano bezpośrednio…”). Zamiast „zadanie”/„zadano” w sensie parametru pisać „jawne ustawienie”. Dopisać, że korekta TabNet, która unika jednoelementowej ostatniej partii, może dać rozmiar inny niż potęga dwójki.
21. **`:120`:** zostawić przeliczenie 32/64. Usunąć skrót VRAM (użyty raz). Ostatnie zdanie („należy uwzględniać”) zamienić na: efektywny rozmiar zapisuje się dla każdego foldu.

### 4.5. Pomiar kosztu

22. **`:125`:** zamiast nazw pól opisać miary po polsku według F13:
    - czas dopasowania udanych konfiguracji;
    - czas rzeczywisty wszystkich prób;
    - czas dopasowania i predykcji konfiguracji o dodatniej wadze;
    - czas samego wyboru D/T/T+E z zapisanych predykcji.

    Ostatnie zdanie o sumowaniu D/T/T+E zostaje.
23. **Granice pomiaru zapisać wprost, w trybie oznajmującym** (F18, F22):
    - czas predykcji testowej zmierzono dla wszystkich metod, w tym KNN i TabPFN;
    - pamięć mierzono tylko podczas dopasowania;
    - pamięci inferencji nie mierzono, więc wnioski o koszcie pamięciowym KNN i TabPFN, które przy predykcji przechowują zbiór odniesienia lub kontekst, ograniczają się do czasu.

    Usunąć „wymagałaby osobnego pomiaru” i „jest szczególnie istotny”. Zgodnie z tym poprawić `04:263` (pkt 5.27).
24. **Synchronizacja GPU z `:40`:** przenieść tutaj, jednym zdaniem (F17).
25. **`:127`:** wątki i partia predykcji według F19. Liczbę wątków można przenieść do 4.7.
26. **`tab:zakres-pomiarow`:** wiersz „Dostępność śledzenia” przenieść do tekstu. Przypis RSS z `minipage` zamienić na rozwinięcie w komórce. Dodać wiersz o czasie (dopasowanie i predykcja: zmierzone; wybór D/T/T+E: osobno). Dodać `@{}`. Tabela może wtedy zastąpić część zdań `:125` i `:146`.
27. **`:148`:** zamienić na fakt (F1a): kampanię wykonano na GPU współdzielonym z innymi procesami, w tym z równoległymi uruchomieniami badania, a obciążenia urządzenia nie rejestrowano. Czasy dopasowania i inferencji opisują więc koszt w tych warunkach, a niepowodzenie z braku pamięci może wynikać z zajętości urządzenia przez inne procesy. Obserwacje (liczba procesów, przypadki) trafiają do r. 6.
28. **`:150`:** według N8 i F16. Jedno zdanie o konwencji raportu głównego i jedno o konwencji analizy A i B, z odsyłaczem do załącznika. „należy sprawdzić” zmienić na „przypadki te rozróżnia się na podstawie liczności klas i macierzy pomyłek”.

### 4.6. Weryfikacja

29. **`:155–157`:** według F28. Usunąć „oznaczony w kodzie jako `smoke`”. Opisać:
    - zestaw testów automatycznych obejmujący przygotowanie danych, dobór partii, budżet, integracje sieci, metryki, wykonanie i wznowienie oraz mechanizmy A i B;
    - że dla wersji użytej w kampanii zaliczono 161 testów (bez sumowania różnych wersji);
    - przebieg syntetyczny (4 zadania, 32 dopasowania foldów, 6 wierszy raportu), wykonany także na docelowym GPU przed kampanią.

    Formalnej kwalifikacji GPU nie przeprowadzono, więc nie używać słowa „kwalifikacja”. Tytuł sekcji „Weryfikacja poprawności platformy” zostaje.
30. **`:159`:** usunąć pierwsze zdanie (zawoalowana zapowiedź wersji kodu, F20, trafia do r. 6). Drugie zdanie przenieść do 4.5 albo usunąć.

### 4.7. Środowisko wykonania

31. **Dodać opis stanowiska (F1, D1):**
    - stacja z czterema GPU NVIDIA RTX PRO 6000 Blackwell (95 GiB), z których każde zadanie korzystało z jednego;
    - 4 z 128 wątków CPU na zadanie, około 755 GiB RAM;
    - Linux 7.0, sterownik 615.71.10, CUDA 13.0;
    - wykonanie bezpośrednio w systemie, bez kontenera;
    - charakterystykę sprzętu zapisuje się w identyfikatorze każdego badania.

    Dwa–trzy zdania albo osobne wiersze w `tab:wersje`. Modelu CPU nie podawać, bo nie jest zapisany.
32. **`:164`:** pochodzenie przestrzeni. Zostawić przypis z rewizją. Ścieżki i nazwy `gen_*` usunąć. W tekście zostaje: przestrzenie sześciu metod zdefiniowano w repozytorium badania, cztery pochodzą z TabArena 0.1.0, a o wykonanym wariancie rozstrzyga zapisany efektywny zestaw parametrów.
33. **`:167`:** „na Pythonie 3.11 i Linux x86-64” zmienić na „w systemie Linux x86-64 z Pythonem 3.11”. Usunąć „deklarowane”. Jedno zdanie o AutoGluon (F11): użyto wydania 1.6.3b20260918 z gałęzi 1.6 wymaganej przez TabArena 0.1.0. Nie podawać powodu wyboru wersji przedpremierowej, bo nie jest udokumentowany.
34. **`tab:wersje`:** podpis „Wersje kluczowych zależności”. Format `@{}ll@{}`.
35. **`:192`:** „udostępnienie checkpointu” zmienić na „pobranie wag TabPFN”. Zostawić jedno z dwóch zdań o checkpoincie (`:167` lub `:192`).
36. **`:194`:** usunąć drugie zdanie.
37. **`:197–199`:** przenieść do r. 6 (pkt 6.1). W r. 5 zostaje jedno zdanie zasady: wyniki D, T i T+E danej pary pochodzą z jednego kompletnego uruchomienia.
38. Usunąć podwójne puste linie (`:165–166`, `:195–196`).

### 4.8. Całość rozdziału 5

39. **„Zadanie” ma trzy znaczenia.** Konsekwentnie stosować:
    - „zbiór” lub „zadanie klasyfikacji” dla danych;
    - „zadanie konfiguracji” dla jednostki obliczeń (definicja w `04:239`);
    - „ustawienie” dla parametru.
40. **Wszystkie tabele z `@{}`.** Zachować zasady stylu z r. 1–3 (część 7).

---

## 5. Rozdział 4: poprawki

### Merytoryczne

0. **N1, `:64`:** „Stratyfikację grupową zastosowano na obu poziomach” zmienić na: podział zewnętrzny jest stratyfikowany i grupowy, a foldy wewnętrzne zachowują rozłączność pacjentów bez stratyfikacji (F30).
1. **N2, `:56`:** „Uczenie kończy się po dziesięciu epokach bez poprawy” zawęzić do trzech lokalnych sieci. Dodać zdanie: w integracjach natywnych zatrzymanie i wybór stanu należą do procedur bibliotek (TabM po 16 epokach bez poprawy, ModernNCA po ponad 20, RealMLP tylko w części konfiguracji), CatBoost zatrzymuje się po 50 iteracjach bez poprawy, a XGBoost i regresja logistyczna nie mają zatrzymania walidacyjnego. Szczegóły mogą trafić do załącznika (pkt 5.33). Rozdzielić zdanie z „a choć…”.
2. **`:68`:** odsyłacz do `sec:artefakty-wznowienie` zostaje, bo pkt 4.15 dodaje treść w r. 5.
3. **`:68` / `:222`, F31:** przy kontraście ModernNCA–KNN w 4.9 dopisać zdanie, że kontrast porównuje całe procedury. KNN w zadaniach IID dopasowuje przygotowanie cech i model na całej części rozwojowej i z tego jednego modelu daje predykcję testową, a ModernNCA uśrednia osiem modeli foldów.
4. **N3, `:81`, F2–F3:** dopisać, że budżet obejmuje całą konfigurację i jest dzielony między foldy przez AutoGluon, a konfigurację przerywa się jako nieudaną, gdy prognoza czasu pozostałych foldów przekracza budżet. „W sześciu uczonych metodach neuronowych budżet jest dodatkowym kryterium zakończenia” zostawić, ale pierwsze z kolejnych zdań powiązać z faktem, że nie każda metoda zapisuje znacznik takiego zatrzymania (odsyłacz do `sec:artefakty-wznowienie`).
5. **D2, `:228`:** „Reguły analizy ustala się przed porównaniem wyników testowych metod. Dla A i B zamrożenie reguł poprzedza pierwszy odczyt ich wyników testowych.” zmienić na: „Wybór konfiguracji i wag zespołu korzysta wyłącznie z wyników walidacyjnych, a etykiety testowe służą jedynie ocenie. Reguły analizy badań A i B ustalono przed rozpoczęciem ich uczenia.” Drugie zdanie jest prawdziwe według F26 (16.11 13:29 wobec 15:07). Nie twierdzić niczego o czasie ustalenia reguł badania głównego.
5b. **`:196`, F33:** podać postać kryterium bez liczby: zgodność ocenia się przedziałem dla stosunku norm wariantu z zanikiem do wariantu bez zaniku, wyznaczonym z przewidywanego czynnika. Liczba [0,98; 1,00] zostaje w r. 7. Usunąć powtórzenie „przed uczeniem w B” w tym akapicie.
6. **`:222`:** oznaczenia `AUC_A`, `AUC_B` zmienić na `AUC_{M_1}`, `AUC_{M_2}` (i analogicznie log loss), żeby nie kolidowały z badaniami A i B.
7. **`:222`, uzasadnienie kontrastów:** jedno zdanie, że RealMLP i TabM reprezentują dwa kierunki rozwoju sieci gęstych zestawione z silnym odniesieniem drzewiastym, a ModernNCA to wyuczone sąsiedztwo zestawione z klasycznym. Kontrasty nie występują w kodzie (F27), więc nie twierdzić niczego o ich implementacji.
8. **`:222` / `:230`:** jedno zdanie uzasadnienia braku testów istotności: dwanaście celowo dobranych zadań nie jest próbą losową z populacji problemów tabelarycznych, a przy tej liczbie zadań moc testów rangowych jest niska. Usunąć drugą zapowiedź braku testów.
9. **N4, `:159`, F32:** „TabM pominięto, gdyż jego użyta implementacja nie obsługuje wag straty” zmienić na: „TabM pominięto, ponieważ jego natywna integracja nie ma ścieżki ważonej straty, a jej dodanie zmieniłoby ocenianą procedurę.” Wyboru CatBoost zamiast XGBoost nie uzasadniać, bo w dokumentacji brak powodu. Jeśli autor poda powód, dopisać jedno zdanie, a jeśli nie, pominąć. Dla B (`:182`) dopisać jedno zdanie (F32): German Credit, Ionosphere i Bioresponse to najmniejsze zbiory badania, a Bioresponse ma przy tym najwięcej cech względem liczby przykładów.
9b. **N5, `:184`, F25:** regułę uzupełnić o kryterium kompletności, które faktycznie zastosowano: „Do rankingu włącza się zbiory badania głównego rozłączne z B, w których wszyscy kandydaci zakończyli się powodzeniem przy pełnym budżecie uczenia.” Faktyczną listę ośmiu zbiorów i powód pominięcia Covertype (obcięcie budżetem) podaje r. 7. **Uwaga dla autora:** kryterium dopisano w dokumentacji 16.11 (F26), po kampanii, ale przed wyborem konfiguracji B. Pasuje to do zasady ciągłości A/B.
10. **`:164`:** CatBoost „po 50 iteracjach bez poprawy” to ta sama reguła co w badaniu głównym (F4). Dopisać „jak w badaniu głównym”.
11. **`:110`, F12:** dopisać, że $\mathcal{C}$ obejmuje udane konfiguracje danej metody na danym zbiorze. W `tab:warunki` przy „ziarno 42” można dodać „rozstrzyganie remisów” albo w tekście jedno zdanie: ziarno 42 ustala wyłącznie rozstrzyganie remisów w zachłannym doborze.
12. **N7, `:45`, F29:** „duplikaty cech w siedmiu” zmienić na „powtórzone wektory cech w siedmiu”. Doprecyzować, że stałe kolumny pozostają w danych, ale przed dopasowaniem modelu implementacja usuwa kolumny stałe w obrębie foldu. Zdanie o trafianiu identycznych obserwacji do treningu i testu zostaje.
13. **`:79`, F15:** przepisać akapit ziaren na dwa–trzy zdania przyczynowe:
    - w badaniu głównym ziarno 42 ustala podział zewnętrzny i wyszukiwanie, a model foldu otrzymuje ziarno 42 powiększone o numer foldu;
    - w A i B ziarno uczenia oddzielono od ziarna podziału, żeby powtarzać uczenie bez zmiany danych, i przyjęto trzy wartości: 0, 10 i 20. Odstęp 10 sprawia, że ziarna foldów różnych powtórzeń się nie nakładają;
    - trzy ziarna to kompromis kosztu i opisują zmienność uczenia przy ustalonym podziale.

    Zachować ziarno inferencji TabPFN 0.
14. **`:175` / `:164`:** jednym zdaniem nazwać różnicę: wagi liczy się z treningu foldu, a przesunięcie komparatora z liczności całej części rozwojowej.
15. **`:52`:** usunąć pustą etykietę `sec:przygotowanie-procedura`, a w `03:50` zamienić odsyłacz na `sec:podzialy`. **To jedyna dozwolona zmiana w r. 1–3.** Po zmianie sprawdzić `grep -rn przygotowanie-procedura chapters/`.
16. **`tab:warunki`:** dodać `\ref` w akapicie `:86`.

### Językowo-stylistyczne

17. **`:114`:** „Przy jednakowej ocenie walidacyjnej kandydatów T wybiera się niższy indeks konfiguracji” zmienić na „Remis ocen walidacyjnych rozstrzyga w T niższy indeks konfiguracji, a konfiguracja domyślna ma indeks 0” (F12).
18. **`:168`:**
    - „po czym przechodzi na średnią…” zmienić na „i stosuje się go do średniej…”;
    - na początku akapitu zdanie celu: trzy punkty pracy rozdzielają skutek skali od skutku uporządkowania;
    - akapit można podzielić na dwa: uporządkowanie i punkty pracy.
19. **`:175`:** hipotezę CatBoost–MLP przenieść na koniec pierwszego akapitu 4.7 (po `:157`). „Oznaczenie zachowuje sens także wtedy, gdy klasa rzadka ma kod 0” zmienić na „Oznaczenia odnoszą się do znaczenia klas, a nie do ich kodów, co ma znaczenie w danych Amazon Employee Access.”
20. **`:177`:** dwa razy „164… w danych transakcji kartowych”. Scalić w jedno zdanie.
21. **`:182`:** dwa razy „przy wspólnych pozostałych…”. Jedno skreślić.
22. **`:184`:** „wybierana jest najmniejsza średnia ranga OOF” zmienić na „wybiera się konfigurację o najmniejszej średniej randze OOF”. „drugi próg” zmienić na „próg zaniku”.
23. **`:186`:** rozdzielić odsyłacz do rysunku od reguły „bez osobnego strojenia każdej komórki”.
24. **`:194`:** „Mniejsze podzbiory przechodzi się więcej razy” zmienić na „Dla mniejszych podzbiorów wykonuje się więcej epok”.
25. **`:148`:** wpleść „Wartość dotyczy prawdopodobieństwa…” w „gdzie $p_{i,y_i}$…”. Zdanie o kolejności kolumn usunąć, bo powtarza `05:57`.
26. **`:152`:** „W badaniu rzadkich klas” zmienić na „W badaniu A”. „odpowiadają semantycznie wskazanej klasie rzadkiej” zmienić na „dotyczą klasy rzadkiej określonej przez etykietę zdarzenia”. Ostatnie zdanie usunąć (pkt 4.11).
27. **`:263`:** „w tym odrębność pomiaru inferencji” zmienić tak, żeby zgadzało się z r. 5: „Granice pomiarów czasu i pamięci, w tym brak pomiaru pamięci podczas predykcji, opisano w sekcji…”.
28. **`:17`:** „relacje szerokości tabeli do liczby przykładów” zmienić na „stosunek liczby cech do liczby obserwacji”. Kolumnę „Próbki” w `tab:rejestr-zadan` zmienić na „Obserwacje”, po sprawdzeniu, czy r. 1–2 nie cytują nagłówka.
29. **`:203`:** „Główny panel zestawia” zmienić na „Główne zestawienie obejmuje”. Usunąć „Każdy wynik należy do określonego zadania, metryki i warunku.”
30. **4.10, tytuł:** „Koszt obliczeń i odtwarzalność” zmienić na „Koszt obliczeń i skala badania”. Etykieta zostaje.
31. **Tabele:**
    - `@{}` w `tab:pytania-analiza` i `tab:skala-badania`;
    - w `tab:poziomy-zespolow` `\textwidth` zmienić na `\linewidth`, `\small` przenieść przed `\caption`, usunąć kropki w komórkach;
    - tyldy przy „i” w podpisach rysunków `:60` i `:136`.
32. **`:79` i `:114`** to najmniej „ludzkie” akapity, zob. pkt 13 i 17. Po poprawkach przeczytać je jeszcze raz pod kątem ciągu zdań-reguł.
33. **Załącznik:**
    - N6: w tabeli ModernNCA przy `n_epochs` dopisać „zatrzymanie po ponad 20 epokach bez poprawy”;
    - N8: przy `A:250` jedno zdanie, że konwencja dotyczy analizy A i B, a raport badania głównego stosuje zero przy zerowym mianowniku;
    - N7: przy `A:239` doprecyzować usuwanie stałych kolumn w obrębie foldu.

---

## 6. Rozdziały 6 i 7: przeniesienia i korekty

Rozdziały 6–7 nie wchodzą do `main.tex`. Zmieniać tylko wskazane miejsca, bez redakcji całości.

1. **R. 6, `sec:wyniki-kompletnosc`:** przenieść regułę scalania z `05:197–199` i scalić z istniejącym `06:43` według F20. Treść:
   - najnowsze uruchomienie według pierwszej próby, bez selekcji według metryk i bez powrotu do starszego;
   - trzy wersje kodu: 70 par z pierwszej wersji (tylko metody, których nie dotyczyły późniejsze zmiany), 12 par z wersji z automatycznym doborem partii i 50 z wersji końcowej;
   - 30 zastąpionych komórek.

   Nie dublować `06:39`.
2. **R. 6:** dodać jedno zdanie o warunkach wykonania (F1a): sześć równoległych procesów roboczych od 9.11, GPU współdzielone, brak zapisu obciążenia, przypadek braku pamięci przy 12 innych procesach.
3. **R. 7, N9:** w `sec:mechanizmy-kontrole` zmienić „niekompletnych lub obciętych przebiegów” na: w danych o pokryciu terenu wszyscy kandydaci MLP, FT-Transformera i TabNet zakończyli się powodzeniem, ale część z nich zatrzymał budżet (12, 26 i 8 z 26 konfiguracji). Zbiór nie spełniał więc kryterium pełnego budżetu uczenia. Uzgodnić z pkt 5.9b. Zdanie o „odstępstwie od ogólnej reguły” usunąć, jeśli r. 4 zawiera już kryterium.
4. **R. 7:** zdanie o kryterium norm uzupełnić o to, że zapisano je po wyborze konfiguracji i przed rozpoczęciem uczenia w B (F26, F33). Dotychczasowe pole „Do uzupełnienia: identyfikowalny zapis chronologii” można zastąpić tym faktem.
5. **Pole `06:10` (chronologia reguł badania głównego):** nie wypełniać. Wpisze je autor (D2). W raporcie przytoczyć F26 jako materiał.

---

## 7. Zasady stylu (z redakcji r. 1–3)

- Forma wyłącznie bezosobowa, bez „ja” i „my”. Przeplatać trzy formy:
  - „-no/-to” przy decyzjach („przyjęto”, „wybrano”);
  - „się” przy procedurach;
  - konkretny podmiot rzeczowy przy faktach („Każdy fold otrzymuje…”).
- Unikać:
  - zdań-zastrzeżeń („nie oznacza to…”), zwłaszcza na końcu akapitu;
  - średników, których ma być 0;
  - skupisk otwarć od imiesłowu i od „Przy…”;
  - zbędnych „zatem”, „więc”, „dlatego”;
  - zdań od „Sam/Sama/Samo”;
  - wyrównywania długości zdań i akapitów.
- Zdania długie, 25–45 słów, tylko w trzech sytuacjach: procedura krok po kroku, definicja z objaśnieniem symboli, decyzja z powodem. Krótkie zdania zostają jako przejścia i proste fakty. Usuwać ciągi zdań-reguł.
- Nie zastępować jednego wzorca drugim. Przy wielu wystąpieniach stosować różne rozwiązania: skreślenie, zmianę szyku, synonim. Skreślenie zbędnego zdania jest lepsze niż przeformułowanie.
- Terminologia:
  - „precyzja–czułość”;
  - „zero-jedynkowe”, a nie „one-hot”;
  - „suma kontrolna”, a nie „hash”;
  - rozwinięcia po „ang.” kursywą;
  - „część rozwojowa”, „test zewnętrzny”, „fold”, „OOF”, „warunek D/T/T+E”.
- Nazwy zbiorów bez odmiany jak nazwy własne: „w danych Santander Customer Satisfaction”, a nie „w Santanderze”. Nazwy klas i kolumn w `\texttt{}`.
- Fragmenty chronione, których brzmienia nie zmieniać i których nie dublować:
  - przykład precyzji przy 0,17% w r. 2;
  - akapit o odległości 2 w KNN, r. 3;
  - liczba parametrów TabM, r. 3;
  - uwaga o `boosting_type`, r. 3;
  - zdanie „Stwierdzono zgodność nazw zbiorów…”, r. 3.

  Opis `log_loss_val` w r. 5 przestaje być chroniony według D3.

---

## 8. Kontrola po redakcji

1. **Spójność faktów:** każda liczba i każda reguła z części 3 użyta w tekście zgadza się z tabelą. Liczby wspólne r. 4 i 5 (3132, 14 976, 3600 s, 4 wątki, 4096, 26 kandydatów, 8 foldów, ziarna) występują bez sprzeczności.
2. **Ślady procesu:** w r. 4 i 5 pusty wynik dla
   ```bash
   grep -n -i ""TODO\|do uzupełnienia\|należy\|jeszcze\|przekazan\|materiał\|plan wykonawcz\|2026\|\.py\b\|\.json\|\.yaml\|configs/\|smoke\|raporter\|przypięci"" chapters/04-metodyka.tex chapters/05-srodowisko.tex
   ```
   Dopuszczalne wyjątki opisz w raporcie: przypis z rewizją w r. 5 i ewentualne jedno „należy”.
3. **Etykiety i odsyłacze:** każda etykieta występuje raz, każdy `\ref`/`\eqref` w r. 1–5 i w załączniku ma cel, a `sec:przygotowanie-procedura` nie występuje nigdzie.
4. **Pomiary** (cele z części 1): słowa, „się” na 1000 słów, zdania poniżej 8 słów, liczba `\texttt`/`\path`, średniki. Pomiar przed i po. Pomiar jest kontrolą kierunku, a nie celem.
5. **Test nowego wzorca:** wprowadzone zamienniki („ponieważ”, „aby”, „przyjęto”, „opisuje się”) nie powtarzają się w kilku kolejnych akapitach.
6. **Kompilacja:** `bash regen-pdf.sh`. Log bez `undefined` i `Overfull`. Obejrzeć strony z tabelami r. 5. `git diff --check`.
7. **Repozytorium eksperymentów nietknięte:** `git -C /home/k.bugala/ws/ablation-experiments --no-optional-locks status --short` daje pusty wynik, a HEAD to `e09cf5f`.

---

## 9. Raport

Utwórz `plans/raport-redakcja-rozdzialy-4-5.md` z:
1. listą zmian według punktów tego zlecenia, z miejscem docelowym;
2. listą przeniesień do r. 6 i 7;
3. faktami, których nie wpisano, z powodem;
4. pytaniami do autora:
   - D2 i pole `06:10`;
   - powód wyboru CatBoost zamiast XGBoost w A;
   - powód wersji przedpremierowej AutoGluon;
   - D6, czyli wykonanie bootstrapu badania głównego po zakończeniu A/B;
5. tabelą pomiarów przed i po;
6. wynikiem kontroli z części 8.

Nie commituj.
"