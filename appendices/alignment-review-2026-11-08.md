# Ponowna weryfikacja zgodności: 2026-11-08

Zakres: pięć ustaleń z przeglądu dokumentacji i manuskryptu. Sprawdzono rzeczywiste instrukcje lokalnego kodu oraz kod zainstalowanych, przypiętych AutoGluon i TabArena. Nie zakładano, że poprzedni opis usterek był w całości poprawny. Nie odświeżano literatury ani nie zmieniano projektu badań.

## 1. Limit partii predykcji — potwierdzona zbyt szeroka deklaracja

**Dowód:** [backend.py](../../mgr-repo/src/tabular_thesis/experiments/backend.py) przekazuje `_prediction_batch_size` tylko pod warunkiem `not spec.upstream and spec.evaluation != "fixed"`. [tabarena_models.py](../../mgr-repo/src/tabular_thesis/experiments/tabarena_models.py) przekłada go na kontekst lokalnego adaptera. Wartość wykorzystują [torch_classifier.py](../../mgr-repo/src/tabular_thesis/models/dl/torch_classifier.py) i [tabnet_model.py](../../mgr-repo/src/tabular_thesis/models/dl/tabnet_model.py). Pierwszy stosuje minimum limitu i partii uczenia. Natywne KNN/RealMLP/ModernNCA/TabM oraz stały TabPFN nie otrzymują tego ustawienia.

**Korekta:** rozdział 4 określa konsumentów limitu 4096 i wyłączenia. Nie wprowadzono globalnego ograniczenia do kodu.

## 2. Pamięć — potwierdzona luka definicji, nie fałszywy wynik

Poprzedni tekst już zaznaczał brak kwalifikacji pomiaru. Nie twierdził, że uzyskano kompletne pomiary inferencji. Ustalenie wymagało więc doprecyzowania granic, a nie odrzucenia istniejących wyników.

**Dowód:** w zainstalowanym `tabarena==0.1.0`, `tabarena/benchmark/exec_models/base.py`, metoda `AbstractExecModel.fit_custom` otacza `self.fit(X, y)` przez `CpuMemoryTracker` i `GpuMemoryTracker`. Wywołanie `predict_proba(X_test)` następuje po zakończeniu tych kontekstów. `_collect_memory_usage` zapisuje m.in. `peak_mem_cpu`, `peak_mem_gpu`, `peak_mem_gpu_reserved` i `gpu_tracking_enabled`. `tabarena/utils/memory_utils.py` definiuje RSS procesu i przydzieloną/rezerwowaną pamięć PyTorch; nie jest to pomiar całej pamięci VRAM procesu. [Runner](../../mgr-repo/src/tabular_thesis/experiments/runner.py) zapisuje `out["memory_usage"]` w rekordzie konfiguracji. [Reporter](../../mgr-repo/src/tabular_thesis/experiments/reporting.py) nie przenosi tego bloku do kolumn raportu.

**Korekta:** rozdziały 4 i 6, plan oraz instrukcja ilustracji rozdzielają pamięć fit, inferencji i całej próby. Osobna kwalifikacja pomiaru inferencji pozostaje wymagana.

## 3. Kontrola kolejności klas — potwierdzone błędne przypisanie reporterowi

**Dowód:** pętla w [reporting.py](../../mgr-repo/src/tabular_thesis/experiments/reporting.py) porównuje wyłącznie `oof_y`, `oof_indices`, `test_y` i `test_indices`. Nie porównuje list `classes` rekordów. Mapowanie pochodzi z `TaskSpec`; [runner.py](../../mgr-repo/src/tabular_thesis/experiments/runner.py) zapisuje je w tożsamości zadania, sprawdza etykiety względem wierszy i waliduje macierz prawdopodobieństw. Kontrola zakresu i liczby kolumn nie potwierdza ich semantycznej kolejności.

**Korekta:** rozdział 5 opisuje właściwego właściciela mapowania, rzeczywiste kontrole runnera i reportera oraz granicę walidacji. Nie ma podstaw do zmiany zachowania reportera wyłącznie w celu dopasowania go do błędnego zdania w rozprawie.

## 4. Sto kroków zespołu — potwierdzone ustawienie, wymagana kwalifikacja interpretacji

`ensemble_size=100` w [reporting.py](../../mgr-repo/src/tabular_thesis/experiments/reporting.py) jest poprawnym opisem skonfigurowanego budżetu. Nie jest dowodem 100 składników końcowych.

**Dowód:** zainstalowany AutoGluon `1.6.3b20260918`, `autogluon/core/models/greedy_ensemble/ensemble_selection.py`, ustawia `use_best=True`, wyznacza `first_index_of_best = trajectory.index(min_score)` i zachowuje prefiks `order[:first_index_of_best + 1]`. Możliwe jest wielokrotne wybranie tej samej konfiguracji. Kontrola na dwóch identycznych wektorach `[0.1, 0.8, 0.2, 0.9]` i etykietach `[0, 1, 0, 1]`, przy ROC AUC i ziarnie 42, dała budżet 100, zachowany prefiks długości 1 i jedną konfigurację o dodatniej wadze. Kontrola nie trenuje modeli.

**Korekta:** tabela rozdziału 4 mówi o budżecie do 100 kroków; tekst wyjaśnia najlepszy prefiks i różnicę względem liczby unikalnych konfiguracji. Algorytm pozostał bez zmian.

## 5. Stan planu i dostępność materiałów — luka organizacyjna, nie zmiana zakresu

**Dowód:** manuskrypt i `main.tex` istnieją w `mgr-thesis`, podczas gdy sekcja organizacyjna planu nadal mówiła o przyszłym repozytorium. `git check-ignore` potwierdził ignorowanie `docs/thesis-plan.md`, `docs/literature-review.md`, `docs/session-handoff.md` i `docs/verification-2026-11-06.json`. Ich lokalne odnośniki działały, ale clone nie zawiera tych plików.

**Korekta:** uaktualniono stan lokalnego planu i utworzono [datowane archiwum](provenance/2026-11-08/README.md) czterech plików z manifestem SHA-256. AGENTS i README manuskryptu odróżniają dokumenty zakresu, aktywne lokalne notatki i nieedytowane archiwum. Źródło naukowego zakresu pozostało w repozytorium eksperymentów. Archiwum jest przygotowane do kontroli wersji; nie wykonano commitu ani publikacji, więc nie twierdzi się, że zdalny clone już je zawiera.

## Granice wykonanej kontroli

Nie zmieniono kodu eksperymentów, parametrów, checkpointu, surowego tematu ani zależności. Nie uruchamiano kampanii, treningu GPU ani inferencji TabPFN. Historyczne 71 testów nadal dotyczą datowanych dowodów; ta korekta dokumentacji ich nie zastępuje. Kopia archiwalna nie gwarantuje istnienia historycznych artefaktów `/tmp`. Końcowa analiza i oba badania mechanizmów nadal wymagają implementacji lub kwalifikacji zgodnie z protokołem.


## Sprawdzenia po korekcie

Sprawdzono 24 cytowane pozycje, 98 unikalnych etykiet, 36 odwołań, 12 ścieżek ilustracji, 20 tabel, aktywne odnośniki oraz bilans środowisk i klamer LaTeX. Sumy 85 chronionych plików kodu, konfiguracji, testów, zależności i zakresu nie zmieniły się. Potwierdzono cztery sumy kopii archiwalnych i zachowanie pozostałych plików manuskryptu.

Pełna kompilacja LuaLaTeX/Biber z następującymi po Biber dwoma przebiegami LuaLaTeX utworzyła 47-stronicowy dokument bez nierozwiązanych cytowań i odwołań. Biber i fonty są obecnie dostępne. Pozostają brak polskich wzorców dzielenia wyrazów, osiem ostrzeżeń o przepełnionych wierszach oraz zalecenie csquotes; nie deklaruje się poprawności końcowej typografii. Nie instalowano zależności. Artefakty kontroli zapisano w katalogu tymczasowym, poza repozytorium eksperymentów.
