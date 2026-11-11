# Przegląd języka i zgodności opisu z implementacją — 2026-11-08

## Zakres i ocena

Przeczytano rozdziały 1–7, plik główny oraz dokumenty określające temat, dobór metod, dane, protokół i stan implementacji w `../mgr-repo/docs/`. Rozdział 8 jest pusty. Jako próbkę stylu autora wykorzystano wstęp i fragment rozdziału implementacyjnego poprzedniej pracy inżynierskiej. Nie przenoszono jej treści ani metadanych. Zachowano zmiany obecne w indeksie Git przed rozpoczęciem przeglądu.

Tekst odpowiada tematycznie pracy magisterskiej z ML, ale przed korektą miał miejscami charakter instrukcji kontrolnej. Powtarzał ograniczenia wnioskowania po niemal każdym opisie metody. Sformułowania takie jak „kompetentna receptura”, „otwarte bramki kwalifikacji”, „surowe role cech” i „stosowalne wiersze” utrudniały lekturę. Opisy własnej implementacji bywały bardziej ogólne niż objaśnienia tego, czego nie należy z niej wnioskować. To cechy stylu, a nie wiarygodny dowód autorstwa lub użycia LLM.

W próbce poprzedniej pracy autor częściej wychodzi od konkretnego komponentu, opisuje jego działanie i uzasadnia decyzję projektową. Korekta wykorzystuje tę kolejność bez kopiowania potoczności ani usterek językowych próbki. Usunięto część powtarzanych zastrzeżeń, zastąpiono kalki językowe i doprecyzowano ustawienia własnego MLP. Zachowano istotne ograniczenia walidacji, porównywania pełnych procedur i niewykonanych eksperymentów. Rozdziały 6–7 nadal są instrukcjami do uzupełnienia wyników; nie powinny być oceniane jako gotowa narracja wynikowa.

## Korekty wymagające dowodów

### 1. Zbyt mocna deklaracja niezależności etykiet OOF

**Miejsce:** `chapters/04-metodyka.tex`, sekcja „Podziały i przepływ informacji”.

**Poprzednie zdanie:** „Predykcja […] jest przypisana do obserwacji deweloperskiej przez model, który nie użył jej etykiety do uczenia”.

**Ocena:** nieprecyzyjne, jeżeli „uczenie” obejmuje wybór stanu sieci. Etykieta jest wyłączona z aktualizacji gradientowych, ale uczestniczy w wyborze epoki.

**Dowody:**

- `../mgr-repo/src/tabular_thesis/experiments/tabarena_models.py:57–64`: adapter przekazuje `X_val` i `y_val` do lokalnego modelu.
- `../mgr-repo/src/tabular_thesis/models/dl/torch_classifier.py:89–115`: strata na walidacji wyznacza `best_state`, licznik `patience` i przywracany stan sieci. Ten cykl obsługuje MLP i FT-Transformer.
- Zainstalowany `autogluon/core/models/ensemble/fold_fitting_strategy.py:395–434` przekazuje walidacyjne wiersze foldu do `fit` jako `X_val` i `y_val`.

**Zmiana:** tekst rozróżnia brak aktualizacji gradientowych na walidacji od wykorzystania jej etykiet do wyboru epoki. OOF służy selekcji; niezależna ocena końcowa przypada zbiorowi zewnętrznemu. Nie stwierdzono tu wykorzystania etykiet testowych do wyboru epoki.

### 2. Nieprawdziwe uogólnienie o brakujących metrykach

**Miejsce:** `chapters/04-metodyka.tex`, sekcja „Metryki i reguły decyzji”.

**Poprzednie zdanie:** „Wyniki nieokreślone pozostają brakami z podaną przyczyną. Nie wolno zastępować ich zerem”.

**Ocena:** sprzeczne z zachowaniem obecnego modułu metryk, jeżeli odczytać je jako opis raportu.

**Dowody:** `../mgr-repo/src/tabular_thesis/evaluation/metrics.py:70–71,94–95` ustawia `zero_division=0` dla F1 oraz ocen poszczególnych klas. Linie 83–87 zapisują nieokreślone AUC jako `None`, bez osobnego pola przyczyny. Przykładowo brak predykcji danej klasy daje zerowy mianownik precyzji, lecz raport zapisze wartość 0.

**Zmiana:** opisano konwencję implementacji i potrzebę rozpoznawania takich przypadków z macierzy pomyłek i liczności. Nie zmieniano kodu ani nie ustalano za użytkownika reguły progowania w niewdrożonym badaniu A.

### 3. Błędny opis opróżniania pliku

**Miejsce:** `chapters/05-srodowisko.tex`, sekcja „Artefakty, awarie i wznowienie”.

**Poprzednie sformułowanie:** „plik tymczasowy zostaje opróżniony”.

**Dowód:** `../mgr-repo/src/tabular_thesis/experiments/artifacts.py:49–58` wykonuje zapis, `stream.flush()`, `os.fsync()` i `os.replace()`. Opróżniany jest bufor zapisu, a nie zawartość pliku. Analogiczny zapis predykcji znajduje się w liniach 163–168.

**Zmiana:** wskazano opróżnienie buforów, synchronizację i atomowe zastąpienie pliku docelowego.

### 4. Konkretne ustawienia MLP zamiast ogólnego opisu

**Miejsce:** `chapters/03-metody.tex`, sekcja „MLP i znaczenie receptury uczenia”.

**Dowody:** `../mgr-repo/configs/model/mlp.yaml` określa warstwy 256 i 128, dropout 0,1, tempo uczenia 0,001, zanik wag 0,0001 i 100 epok. `models/dl/torch_classifier.py:35–40` określa limit kodowania kategorii 256, a linie 89–115 wybór stanu sieci według straty walidacyjnej. `models/preprocessing.py` implementuje imputację i skalowanie dopasowywane do treningu.

**Zmiana:** dodano te wartości jako konfigurację domyślną. Nie przypisano im statusu wyników eksperymentu ani reprodukcji opublikowanej procedury.

## Granice przeglądu

Kontrola implementacji opierała się głównie na lekturze kodu: obejmowała ścieżkę wykonania, adaptery, podziały, metryki, raportowanie i zapis artefaktów. Nie uruchamiano eksperymentów ML ani ponownej kwalifikacji GPU lub TabPFN. Nie wykonywano ponownego pełnego audytu publikacji; zachowano bibliografię i zasadniczą treść twierdzeń literaturowych. Ocena naturalności jest oceną redakcyjną, nie wynikiem detektora ani gwarancją odbioru przez recenzenta.

Dodatkowo wykonano małe sprawdzenie `compute_metrics` w istniejącym środowisku repozytorium eksperymentów: dla etykiet `[0, 1]`, decyzji `[0, 0]` i prawdopodobieństw `[[0.9, 0.1], [0.8, 0.2]]` precyzja klasy 1 wynosiła 0, a macierz pomyłek `[[1, 0], [1, 0]]`. Potwierdza to opisaną konwencję zerowego mianownika; nie jest to eksperyment oceniający model.

## Weryfikacja dokumentu

Sprawdzono 24 używane klucze bibliografii, unikalność 98 etykiet i rozwiązanie 40 odwołań oraz zgodność par środowisk LaTeX. `git diff --check` zakończył się bez uwag. Kompilacja LuaLaTeX/Biber/LuaLaTeX/LuaLaTeX, a następnie dwa przebiegi po korekcie łamania tekstu, utworzyły `build/main.pdf` (47 stron), bez nierozwiązanych cytowań i odwołań.

Pierwsza próba LuaLaTeX zatrzymała się podczas inicjalizacji fontów bez utworzenia nowego PDF, mimo kodu wyjścia 0. Skuteczna kompilacja wymagała wskazania zapisywalnej pamięci podręcznej: `TEXMFVAR="$PWD/build/texmf-var" TEXMFCACHE="$PWD/build/texmf-var"`. Wynik sprawdzono w logu, a nie wyłącznie na podstawie kodu zakończenia.

Pozostają trzy ostrzeżenia `Overfull \\hbox`: około 0,32 pt przy PB1, 12,57 pt w omówieniu benchmarków i 33,96 pt w adresie bibliograficznym. Środowisko nie ma aktywnych polskich wzorców dzielenia wyrazów; BibLaTeX zaleca również pakiet `csquotes`. Nie instalowano zależności ani nie zmieniano szablonu. Nie wykonano pełnego przeglądu wizualnego wszystkich stron PDF.
