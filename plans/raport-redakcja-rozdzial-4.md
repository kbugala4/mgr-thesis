# Raport redakcji rozdziału 4

Data: 2026-11-16. Podstawa: `plans/zlecenie-redakcja-rozdzial-4.md`, zastana wersja rozdziału i aktualne źródła sąsiedniego `mgr-repo`. Zastosowano `scientific-writing` oraz instrukcje repozytorium. Nie zmieniano projektu badań ani implementacji eksperymentów.

## Zakres i rezultat

Rozdział 4 opisuje projekt, uzasadnienie wyborów i reguły analizy. Wyniki wyboru konfiguracji oraz przewidywanie dla wybranej konfiguracji B przeniesiono do rozdziału 7. Szczegółowe reguły i przestrzenie strojenia znajdują się w nowym załączniku `chapters/A-reguly-szczegolowe.tex`. Tekst główny zawiera trzy zbiorcze odsyłacze do tego załącznika. Nie zawiera pól do uzupełnienia, identyfikatorów rewizji, ścieżek ani wartości wybranych na podstawie przebiegów.

Rozdział 5 otrzymał wyłącznie trzy zamówione zmiany: akapit o pochodzeniu przestrzeni i kolejności nadpisywania parametrów, poprawkę identyfikacji danych przez Parquet oraz poprawkę składni zdania o wagach. Rozdziały 1–3, bibliografia i szablon pozostały bez zmian. Zachowano zastane usunięcia i nieśledzone dokumenty użytkownika. Nie wykonano commita.

Tekst metodyki nadaje się do przeglądu redakcyjnego i merytorycznego. Załącznik audytu oraz empiryczne części 6–7 nadal wymagają dowodów i uzupełnień wskazanych poniżej. Przeniesienie treści nie oznacza potwierdzenia wyników treningów.

## Przeniesienia i zachowanie treści

Miejsca źródłowe odnoszą się do rozdziału 4 sprzed redakcji. Zachowano 27 jego etykiet, każdą dokładnie raz w całym manuskrypcie.

| Źródło | Treść | Miejsce docelowe |
| --- | --- | --- |
| 4.2, końcowy akapit i TODO audytu | Tożsamość danych, zakres pomiarów, duplikaty, braki, grupy, decyzje | Załącznik, „Audyt danych przed uczeniem”; identyfikacja Parquet także w istniejącym opisie 5 |
| 4.4, dwa pierwsze akapity | Rewizja, pliki konfiguracji, cztery generatory, zależności, kolejność nadpisań i efektywne parametry | 5, `sec:wykonanie-kampanii`, jeden akapit z przypisem |
| 4.4, definicje przestrzeni | Wartości domyślne, zakresy, rozkłady i parametry stałe | Załącznik, „Przestrzenie strojenia”, dziesięć metod; RealMLP w dwóch tabelach |
| 4.7, kontrola kryterium wyboru | 12/24, różnica stanów, pierwsze minima, ostatni zapis, kompletność | Załącznik, „Kontrola wyboru stanu i niestabilność w badaniu A” |
| 4.7, limit czasu A/B | Techniczny limit 10^6 s i wymóg braku obcięcia | Załącznik, „Podzbiory, budżet i plateau w badaniu B”; zasada pełnego wykonania pozostaje w 4 |
| 4.7, `tab:konfiguracje-a` | Indeksy MLP i CatBoost, parametry CatBoost, dwa brakujące wybory | 7, `sec:mechanizmy-kontrole`, z zachowaną etykietą i oznaczeniem braków |
| 4.7, diagnostyka niestabilności | Połowa mediany, więcej niż 12/24, trzykrotny rozstęp AP, przypadki zerowe | Załącznik, kontrola A |
| 4.7, progi | Środki, końce rodziny, reprezentowalne wartości, remisy, FPR i brak alarmów | Załącznik, „Progi decyzji i miary uporządkowania” |
| 4.7, zgodność uporządkowania | Rangi średnie, stałe predykcje, punktacja par 1/0,5/0 | Załącznik, progi i uporządkowanie |
| 4.7, komparator | Postać numeryczna, końce 0/1, zaokrąglenia, przekształcenie progu, logity brzegowe | Załącznik, progi i uporządkowanie; równanie i interpretacja pozostają w 4 |
| 4.8, konfiguracja i ranking | Konfiguracja 21, parametry, trzej kandydaci, 11/26, 12,75, słaby zanik liderów, osiem źródeł i wyłączenie Covertype | 7, `sec:mechanizmy-kontrole`, jako informacje wymagające potwierdzenia źródłowego |
| 4.8, podzbiory i epoki | Zaokrąglenie liczności, permutacja, kolejność wierszy, wzór liczby epok | Załącznik, budżet B; udziały, partie, kroki i zasady izolacji pozostają w 4 |
| 4.8, przewidywanie | Iloczyn alfa i lambda, `tab:zanik-przewidywany`, hipoteza małego efektu, przedział norm [0,98; 1] | 7, `sec:mechanizmy-kontrole`, z kolejnością: wybór, przewidywanie przed B, pomiar |
| 4.8, plateau | 90% kroków, 1% zmiany, zero, brak zapisu, brak określonej diagnozy | Załącznik, budżet B |
| 4.9, TODO zatwierdzenia | Chronologia reguł analizy głównej i wcześniejszego dostępu do testu | 6, `sec:wyniki-kompletnosc`, zgodnie z odpowiedzią autora pozostawiono do uzupełnienia |
| 4.9, bootstrap | Brak ziarna, nieokreślona replika i pomijanie przedziału | Załącznik, „Braki i nieokreślone repliki bootstrapu” |

Z rozdziału 4 usunięto komentarze procesu, powtórzenia i odwołania do dokumentów roboczych. Nie przenoszono ich do tekstu naukowego. Zachowano jednostki analizy, wszystkie zbiory i wyłączenia, wyjątki KNN/TabPFN, warunki D/T/T+E, metryki, kontrasty, nominalne koszty i ograniczenia. Definicję AP zastąpiono odwołaniem do istniejącego równania w rozdziale 2. Brak zmiany definicji miary.

## Weryfikacja implementacji i rozbieżności

Sprawdzono dokumenty zakresu i protokołu w `../mgr-repo/docs/`, lokalne konfiguracje, implementację oraz zainstalowane źródła TabArena 0.1.0. HEAD repozytorium eksperymentów wynosi `79299f573975b45052803d8f26c350f10446e332`; repozytorium ma także późniejsze lokalne zmiany, dlatego sam SHA nie identyfikuje całego aktualnego wykonania. W manuskrypcie SHA opisuje pochodzenie przestrzeni, nie certyfikuje gotowości kampanii.

| Zagadnienie | Dowód | Rozstrzygnięcie |
| --- | --- | --- |
| Wagi i normalizacja | `src/tabular_thesis/models/dl/torch_classifier.py`: strata ważona, `_evaluation_loss`, mianownik będący sumą wag; protokół A | Zachowano wagi N/(K n_c), wyłącznie z treningu, oraz ważony wybór stanu |
| Kontrola 12/24 | `scripts/analyze_study_a.py:56–77`, `control_rule` | **Co najmniej 12** z 24. Brak historii nie zmniejsza mianownika |
| Niestabilność 12/24 | Ten sam skrypt, `diagnostics`, szczególnie warunek `growing > 12` | **Więcej niż 12** z 24. Różnica jest zamierzona: dwa odrębne kryteria. Nie ujednolicono ich kosztem zmiany protokołu |
| Numeracja | `selected_epoch`, `best_iteration + 1`, `argmin + 1` w analizie A | Numeracja od 1, pierwsze minimum, ostatnie minimum jako rozbieżność również po pełnym limicie |
| Wybór T | `experiments/reporting.py`: sortowanie po indeksie, następnie `argmax`; `scripts/select_mechanism_sources.py` | Remis rozstrzyga niższy indeks |
| T+E | `reporting.py` i zainstalowany `autogluon/core/models/greedy_ensemble/ensemble_selection.py`, `first_index_of_best` | Do 100 kroków, ziarno 42, najkrótszy prefiks najlepszego wyniku |
| Interpretacja F1 | `docs/tabarena-evaluation.md`, reguły A; `scripts/mechanism_analysis.py` | Nie przyjęto sugestii z 5.7 zlecenia, że F1 po doborze progu izoluje uporządkowanie. Zachowano wpływ przenoszenia progu z OOF na średnią foldów |
| Reguła kompletności źródeł B | `scripts/select_mechanism_sources.py`, `docs/mechanism-studies.md:47–49` | Nie wpisano sugerowanej w zleceniu reguły „wszystkie aktualne, zakończone i bez obcięcia” jako faktu historycznego. Aktualny audyt wymaga 26 udanych kandydatów, dokładnej zgodności parametrów i ośmiu wskazanych zbiorów, ale sam nie egzekwuje braku obcięcia. Historyczny selektor przypisywał nieukończonym kandydatom dolne rangi i pomijał `batch_size` przy porównaniu parametrów. Rozbieżność ujawniono w 7 |
| Budżety i podzbiory B | `experiments/mechanisms.py`, `configs/studies/study-b.yaml`, `scripts/analyze_study_b.py` | Zachowano zagnieżdżenie, zaokrąglenie, stałe partie, pełny budżet i odrębność stanu końcowego od wybranego |
| Norma parametrów | `torch_classifier.py:151–153`, suma po wszystkich parametrach sieci | Norma obejmuje także wyrazy wolne |
| Plateau | `scripts/analyze_study_b.py:28–44`, wraz z kontrolą historii | Zachowano ostatni zapis do 90% aktualizacji, zmianę poniżej 1% i przypadki zerowe. W załączniku dopisano wymóg co najmniej dwóch zapisów |
| Suma danych UCI | `data/tasks.py:100–114`, zapis Parquet przed SHA-256; około 218, `testzip()` | Poprawiono błąd rozdziału 5. Suma dotyczy przygotowanego Parquet, nie pobranego archiwum ZIP |
| Przestrzenie | `configs/model/*.yaml`, `experiments/catalog.py`, zainstalowane `tabarena/models/{knn,realmlp,modernnca,tabm}/hpo.py`, implementacje modeli i domyślne ustawienia pytabkit | Rozkłady mieszane opisano jawnie. ModernNCA: P(0 bloków)=2/3. TabM: masy punktowe przy zerze. RealMLP: zależny wariant rozszerzony. KNN: próg kategorii nadpisany na 10^6, wyłączony z losowania |

Rozdział 4 zachowuje ogólną regułę wyboru B z zadań rozłącznych z B. Faktyczny skład ośmiu źródeł, wyłączenie Covertype i spór o traktowanie niekompletnych kandydatów pozostają w 7. Nie przedstawiono późniejszej kontroli źródeł jako dowodu, że regułę tak ustalono przed treningami.

Godzinny budżet jest zgodny z lokalnymi definicjami ocen TabArena. Liczbę 25 kandydatów opisano jako kompromis zakresu wyszukiwania i kosztu, bez przypisywania jej optymalności. W badaniach A/B pozostaje techniczny limit 10^6 s; nie zapisano nieprawdziwego braku jakiegokolwiek ograniczenia czasu.

## Brakujące dowody i decyzje autora

1. **Audyt 12 zbiorów:** nie znaleziono aktualnego kompletnego profilu ani przygotowanych plików pozwalających odtworzyć go lokalnie. Nie wpisano przykładowych liczb Adult (57/52/5) ani Amazon (7518), których nie można było powiązać z aktualnymi danymi. Załącznik zawiera tabelę do uzupełnienia. Braków nie zastąpiono zerami. Nie pobierano danych.
2. **Wybór konfiguracji A/B:** konfiguracje pochodzą z dokumentacji i ustawień badania. Brakuje oryginalnych wyników OOF pozwalających odtworzyć ranking i potwierdzić wszystkie wybory. Tak oznaczono przeniesiony fragment w 7. Nadal brak dwóch konfiguracji CatBoost.
3. **Chronologia analizy głównej:** autor polecił pozostawić ją do uzupełnienia w 6. Pozostaje pytanie: kiedy zatwierdzono reguły i jakie częściowe raporty testowe oglądano wcześniej? Nie zadeklarowano zatwierdzenia przed automatycznym obliczeniem metryk.
4. **Chronologia B:** do potwierdzenia pozostaje zapis wyboru konfiguracji, sformułowania przewidywania i pierwszego treningu B. Przewidywanie analityczne wyraźnie oddzielono od wyników uczenia.
5. **Analiza główna:** redakcja nie wdraża skryptu bootstrapu i kontrastów w repozytorium eksperymentów. Zgodność wykonania z nowym opisem należy potwierdzić przed analizą wyników.

## Pomiary stylu

Wykorzystano funkcje ze skryptu osadzonego w części III.4 `appendices/badania-ab-materialy-2026-11-15.md`. Skrypt usuwał tekst po każdym `%`, także po LaTeX-owym `\%`, tracąc dalszą część zdań. W pomiarze poniżej poprawiono wyłącznie rozpoznawanie komentarza na `(?<!\\)%.*`. Dlatego wartość wyjściowa różni się od około 4300 słów ze zlecenia. Oryginalny algorytm dawał 4306 słów przed zmianą i około 3100 po niej.

Miary są przybliżone: parser nie jest analizatorem polszczyzny ani pełnym parserem LaTeX. Dla form -no/-to wyłączono oczywiste fałszywe trafienia, takie jak „ziarno”, „jedno”, „warto”, „zarówno” i „osobno”. Pozostałe rozpoznane formy sprawdzono ręcznie.

| Miara | Przed | Po |
| --- | ---: | ---: |
| Liczba słów prozy | 4713 | 3253 |
| Liczba zdań według skryptu | 325 | 233 |
| Średnia długość zdania | 14,5 | 14,0 |
| Zdania krótsze niż 8 słów | 13,8% | 8,2% |
| „się” / 1000 słów | 28,2 | 11,4 |
| Formy -no/-to / 1000 słów | 6,6 | 13,2 |
| „ponieważ/aby/żeby/gdyż” / 1000 słów | 3,0 | 4,3 |
| Zdania wykryte jako zastrzeżenia | 2,2% | 2,1% |
| Wystąpienia „nieokreśl-” w oczyszczonej prozie | 8 | 0 |
| Średniki w prozie | 0 | 0 |

Kontrola nowego wzorca: „ponieważ”, „aby”, „przyjęto” oraz „w danych” nie występują w kilku kolejnych akapitach. Zachowano zróżnicowane długości akapitów, zamiast wymuszać identyczny rytm. Miary nie zastępują oceny naukowej.

## Kontrole końcowe

- Oba skany z części 8 zlecenia: **pusty wynik**.
- Wszystkie 27 etykiet starego rozdziału 4: zachowane dokładnie raz. Tabele `tab:konfiguracje-a` i `tab:zanik-przewidywany` istnieją wyłącznie w 7.
- Klucze cytowań rozdziałów: obecne w bibliografii. Zachowano dotychczasowe źródła; nie prowadzono nowego przeglądu literatury i nie dodano publikacji.
- Zachowano 12 zbiorów, 26 konfiguracji, osiem foldów, ziarna 42 oraz 0/10/20, 3132 zadań, 14 976 dopasowań, 36 i 108 ocen, 1008 i 144 dopasowania badań uzupełniających. Budżety 1000/400/1800 oraz 1002 po zaokrągleniu, liczności testów i rzadkich przykładów oraz 2000 replik bootstrapu pozostają w opisie. Zachowano także skalę wariantu kontrolnego.
- `git diff --check`: bez błędów dla zmian redakcyjnych.
- `bash regen-pdf.sh`: zakończone powodzeniem, PDF `build/wut/main.pdf`, 63 strony. Brak niezdefiniowanych cytowań i odwołań, powtórzonych etykiet oraz przepełnień `Overfull` w końcowej kompilacji.
- Dodatkowa kompilacja z rozdziałami 6–7: `build/review4/review-all.pdf`. Potwierdza przeniesione tabele i odwołania. Rozdziały 6–7 nadal nie są dołączone do głównego dokumentu.
- Kolejność załącznika potwierdzono w lokalnym oryginale WUT-Thesis, commit `7391c2874e4d668a59c053267f85e1ecf4dfb882`: spisy rysunków, tabel, załączników, następnie załączniki. Użyto `\appendix{...}`. Załącznik ma wpis w osobnym spisie, a jego wewnętrzne nagłówki nie zaśmiecają głównego spisu treści. Tabele załącznika nie trafiają do głównego spisu tabel, zgodnie z przykładem szablonu.
- Obejrzano raster stron z rozbudowaną tabelą TabM i tabelą audytu; układ czytelny, tekst mieści się na stronie. Pozostałe strony sprawdzono przez log i tekst PDF, bez pełnego przeglądu każdej strony.
- Pozostały ostrzeżenia pdfTeX o kotwicach przypisów i grupie strony importowanej okładki. Kontrolna kompilacja wersji sprzed edycji (`build/review4/baseline.pdf`) potwierdza ten sam typ problemu i sześć brakujących kotwic; numer ostatniej zmienił się po przeniesieniu przypisu. To nie są niezdefiniowane cytowania ani odwołania do tabel. Nie zmieniano szablonu poza zakresem zadania.

Słowne odwołanie do rozdziałów wynikowych w 4 jest zamierzone. Po włączeniu 6–7 do `main.tex` można zastąpić je odwołaniami `\ref`.

## Uwagi poza zakresem

- Rozdział 5, `sec:pomiary-platformy`: opis `zero_division=0` dotyczy raportera głównego. Analiza A stosuje inną konwencję brakującej precyzji. W przyszłej redakcji trzeba wyraźnie rozdzielić te ścieżki, aby pozorna sprzeczność z załącznikiem nie dezorientowała czytelnika.
- Rozdział 5, `sec:wykonanie-kampanii`: nadal ma charakter technicznej procedury z odwołaniami do kodu. Zgodnie ze zleceniem nie przeprowadzono pełnej redakcji.
- **Do rozdziału 6 z przyszłej redakcji 5:** konkretna konfiguracja faktycznie użytej maszyny, daty kampanii, obserwowane zużycie zasobów i wyniki kwalifikacji. W obecnym 5 sekcja kwalifikacji opisuje głównie procedurę, a nie potwierdzone pomiary; same kryteria kontroli mogą w nim zostać. Nie dopisano fikcyjnych wyników sprzętowych.
- Przestrzeń RealMLP ustawia wewnętrzny zespół ośmiu modeli dla losowych kandydatów, przy domyślnym jednym. Zapisano to w załączniku. Warto sprawdzić w przyszłym całościowym przeglądzie, czy opis zespołów w pozostałych rozdziałach nie sugeruje wyłączności TabM. Nie zmieniano zatwierdzonych rozdziałów 1–3.
- Szkielet 6 nadal zawiera warunkową instrukcję o testach istotności, a dalsza część 7 bezwarunkowo mówi o identycznym AP komparatora. Przy ich późniejszej redakcji należy uzgodnić pierwsze zdanie z analizą opisową oraz ograniczyć drugie do dokładnej arytmetyki. W tym zadaniu zmiany 6–7 ograniczono do wskazanych miejsc przeniesienia.

Nie uruchamiano treningów, nie oceniano testowych predykcji, nie kwalifikowano GPU ani nie instalowano zależności.
