# Oddzielenie metodyki od stanu realizacji — 2026-11-11

Na polecenie autora usunięto ze składanego tekstu uwagi o etapie przygotowania eksperymentów. Opis metodyki używa czasu teraźniejszego i określa procedurę, nie potwierdza jej wykonania. Nie zmieniono dokumentów autorytatywnych w repozytorium eksperymentów ani nie dopisano wyników.

Rozdziały `chapters/06-wyniki.tex` i `chapters/07-mechanizmy.tex` zachowano jako materiały redakcyjne poza składem `main.tex`. Ich ponowne włączenie wymaga uzupełnienia rzeczywistymi wynikami. Streszczenia obejmują cel, zakres i metodykę; część wynikowa streszczeń wymaga odrębnego uzupełnienia na podstawie analizy.

Nie zamrożono przez redakcję propozycji statystycznych: trzech konkretnych kontrastów, testu znaków z korektą Holma i poziomem 0,05, tolerancji remisów 1e-12, 2000 replik bootstrapu i poziomu 95%, ani maksymalizacji F1 z najwyższym progiem przy remisie. W tekście pozostawiono zasady interpretacji kontrastów i niepewności, a wartości robocze nie są przedstawiane jako wykonana analiza. Nadal obowiązują otwarte kwestie źródłowego protokołu: ziarna A/B, receptura MLP, reguły podzbiorów, progowanie, audyt danych, zasoby i kwalifikacja implementacji.

Poniższe fragmenty przeniesiono z manuskryptu jako zapis wcześniejszego stanu redakcyjnego. Nie są niezależnie utrzymywanym protokołem; aktualny stan wyznacza `../mgr-repo/docs/implementation-status.md` i pozostałe dokumenty wskazane w AGENTS.md.

## chapters/01-wstep.tex

```tex
Planowany wkład empiryczny obejmuje porównanie jakości i~kosztu oraz oba badania mechanizmów. Na etapie przygotowania tego tekstu końcowa kampania nie została wykonana. Dostępne sprawdzenia infrastruktury nie są przedstawiane jako wyniki naukowego porównania. Wnioski dotyczące skuteczności zostaną sformułowane dopiero na podstawie zidentyfikowanych artefaktów eksperymentów.
```

## chapters/04-metodyka.tex

```tex
\textbf{Do uzupełnienia po audycie:} tabela liczby obserwacji, predyktorów według typu, braków, liczności każdej klasy, grup oraz części treningowych i~testowych, wraz z~sumami kontrolnymi danych. Obecny rejestr nie zastępuje tej tabeli. Zapis przygotowanego pliku i~jego manifestu jest warunkiem identyfikowalności, lecz nie dowodzi poprawności naukowej wyboru populacji.
```

## chapters/04-metodyka.tex

```tex
\textbf{Do zamrożenia przed wykonaniem:} wartości trzech ziaren, surowe etykiety rzadkie, obsługa wag przez każdą integrację, dokładna reguła i~zbiór kandydatów progu oraz zachowanie przy braku przewidzianych alarmów. Moduł wykonujący to badanie, w~tym wybór progów, wymaga jeszcze implementacji i~sprawdzenia.
```

## chapters/04-metodyka.tex

```tex
\textbf{Do zamrożenia przed wykonaniem:} źródło i~pełne parametry procedury, trzy ziarna, reguły zaokrągleń i~minimalnych liczności klas, zatrzymanie, wybór epoki oraz sposób zapisu krzywych. Mechanizm tych kontroli wymaga implementacji i~kwalifikacji.
```

## chapters/04-metodyka.tex

```tex
Warunkami rozpoczęcia końcowej kampanii są audyt i~zamrożenie danych, rzeczywisty pilotaż GPU i~TabPFN, kwalifikacja obu badań mechanizmów, rozstrzygnięcie wskazanych ustawień analizy oraz zapis tożsamości źródeł, zależności i~sprzętu. Szczegóły egzekwowania tych warunków przedstawia rozdział~\ref{chap:srodowisko}.
```

## chapters/05-srodowisko.tex

```tex
\subsection{Weryfikacja i kwalifikacja platformy}
\label{sec:kwalifikacja}

Zapis sprawdzeń z~6~listopada 2026~r. dokumentuje 71 przechodzących testów, kontrole Ruff i~formatowania oraz sprawdzenie samodzielnego pakietu i~konfiguracji. Odnotowano skrócony pilotaż Ionosphere dla regresji logistycznej i~MLP: cztery konfiguracje, 32 dopasowania foldów i~sześć wierszy raportu. Sprawdzenie wznowienia potwierdziło zachowanie ukończonych rekordów. Nie jest to wynik głównego porównania: MLP był skrócony, a~pula metod i~budżet nie odpowiadały kampanii.

Ta sama migawka zawiera pobranie i~przygotowanie czterech zbiorów UCI i~kontrolę grupowego podziału Diabetes. Dla tego źródła odnotowano 67\,844 wiersze części rozwojowej, 33\,922 testowe, brak wspólnych pacjentów i~osiem poprawnie rozłącznych walidacji grupowych. Są to datowane dowody infrastruktury dla określonych danych i~źródła. Nie dowodzą późniejszych rewizji, poprawności innej maszyny ani wykonania pełnego audytu dwunastu zadań.

\begin{table}[tbp]
\centering\small
\caption{Wykonane sprawdzenia i~pozostałe wymagania według stanu opisanego 6~listopada 2026~r.}
\label{tab:kwalifikacja}
\begin{tabularx}{\linewidth}{P{0.24\linewidth}YY}
\toprule
Wymaganie & Dostępny dowód & Ograniczenie lub brak \\
\midrule
Kontrakty i~integralność & Testy kodu i~kontrole pakietu & Nie kwalifikują wszystkich par danych i~modeli \\
Uruchomienie i~wznowienie & Skrócony pilotaż CPU & Brak pełnej macierzy i~docelowych budżetów \\
Izolacja pacjentów & Rzeczywisty podział Diabetes & Nie zastępuje audytu pozostałych źródeł \\
Identyfikacja danych & Przygotowane cztery zbiory UCI & Pełny audyt i~zamrożenie dwunastu źródeł otwarte \\
Obliczenia GPU i~TabPFN & Ścieżki zaimplementowane & Brak kwalifikacji rzeczywistego wykonania \\
Kontener & Przygotowana konfiguracja & Brak potwierdzonego uruchomienia \\
Badania mechanizmów & Przyjęty projekt & Moduły wykonawcze i~kontrole wymagają implementacji \\
Analiza końcowa & Plan z~sekcji~\ref{sec:analiza-plan} & Brak zamrożenia i~wykonania procedur \\
\bottomrule
\end{tabularx}
\end{table}

Test syntetyczny \texttt{smoke} sprawdza mały, niezależny od sieci przebieg z~regresją logistyczną i~dwuepokowym MLP. Umożliwia wykrycie problemów interfejsów, zapisu i~raportowania. Nie jest testem jakości modeli na rzeczywistych zadaniach. Analogicznie poprawny import pakietu lub diagnostyka urządzenia nie kwalifikują każdego modelu, limitu pamięci ani długości kontekstu TabPFN.

Przed kampanią wymagane są rzeczywiste pilotaże GPU, dostęp do przypiętych wag, szerokie i~wieloklasowe przypadki, pomiary zasobów oraz sprawdzenie modułów obu badań uzupełniających. Weryfikacja powinna identyfikować użyte źródła i~datę. Po zmianie istotnego składnika nie należy bez nowego sprawdzenia przypisywać aktualnej wersji dowodów pochodzących ze starszej migawki.
```

## chapters/05-srodowisko.tex

```tex
\textbf{Do uzupełnienia po kwalifikacji węzła:} CPU, GPU, sterownik, pamięć RAM i~VRAM, system, rzeczywiste wersje pakietów, identyfikator źródeł i~obrazu, checkpoint, hashe danych, ostateczne limity oraz identyfikatory badań. Nie podaje się tych danych jako wykonanej konfiguracji eksperymentów, dopóki nie istnieją odpowiednie artefakty. Dalsze wyniki zostaną przedstawiaone w~rozdziałach~\ref{chap:wyniki} i~\ref{chap:mechanizmy}.
```
