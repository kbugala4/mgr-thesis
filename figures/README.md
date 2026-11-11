# Rysunki i wykresy: co przygotować i gdzie wstawić

Rozdziały 1–5 są napisane jako tekst z tabelami LaTeX. Pozostawiono sześć miejsc na autorskie schematy objaśniające, które można przygotować przed eksperymentami. Rozdziały 6–7 są szkieletami z sześcioma miejscami na przyszłe wykresy wyników. Wykresów tych nie wolno tworzyć bez rzeczywistych artefaktów kampanii. Same teksty i ramki można składać bez plików graficznych.

## 1. Rejestr ilustracji

Ścieżki są względne wobec katalogu zawierającego `main.tex`. Nazwy i etykiety powinny pozostać zgodne z wywołaniami `\plannedfigure`.

| Miejsce | Oczekiwany plik wynikowy | Etykieta LaTeX | Co należy pokazać | Edytowalne źródło do zachowania |
| --- | --- | --- | --- | --- |
| Rozdział 2, sekcja „Rozwój podejść neuronowych” | `figures/ch02/mapa-podejsc.pdf` | `fig:mapa-podejsc` | Role metod: MLP; TabNet i FT-Transformer; RealMLP; ModernNCA; TabM; TabPFN-3.5. Obok cztery odniesienia: regresja logistyczna, KNN, XGBoost, CatBoost. Role mogą się nakładać. Bez rankingów i osi sugerującej poprawę wraz z datą. | Np. `figures/source/mapa-podejsc.svg` albo `.drawio`. |
| Rozdział 3, po opisie FT-Transformer | `figures/ch03/przeplyw-reprezentacji.pdf` | `fig:reprezentacje` | Trzy równoległe ścieżki dla tej samej przykładowej obserwacji: MLP z wektorem wejściowym; TabNet z kolejnymi maskami; FT-Transformer z tokenami poszczególnych kolumn. Każda kończy się prawdopodobieństwami klas. | Np. `figures/source/przeplyw-reprezentacji.svg`. |
| Rozdział 3, sekcja „TabM i poziomy łączenia predykcji” | `figures/ch03/poziomy-zespolow.pdf` | `fig:zespoly` | Trzy osobne panele: wewnętrzne podmodele TabM; osiem modeli foldów jednej konfiguracji; łączenie konfiguracji z wagami wybranymi na OOF. Wskazać nakładanie się poziomów i wyjątki KNN/TabPFN. | Np. `figures/source/poziomy-zespolow.svg`. |

Trzy ilustracje wymienione powyżej są schematami pojęciowymi, a nie wynikami. Liczby lub wymiary użyte jako przykład trzeba podpisać jako przykładowe. Nie przypisywać im wartości zmierzonych w kampanii. Diagram MLP/TabNet/FT-Transformer nie musi odwzorowywać każdej warstwy implementacji; jego zadaniem jest porównanie sposobu traktowania cech.

## 2. Wymagania treściowe

### Mapa podejść

- Użyć polskich nazw ról oraz oryginalnych nazw metod.
- Zachować dokładnie zaakceptowaną pulę 7+4; nie dodawać algorytmów jako nowych uczestników badania.
- Nie przedstawiać kategorii jako rozłącznych: TabM jest oparty na MLP, a RealMLP obejmuje również przygotowanie danych.
- Nie umieszczać strzałek oznaczających przewagę jakości. Dopuszczalne są powiązania opisane jako „wykorzystuje”, „rozwija” lub „pełni rolę”.
- Podstawą są opisy i cytowania w rozdziale 3; schemat ma być opracowaniem własnym.

### Przepływ reprezentacji

- Narysować jeden wiersz z np. dwiema cechami numerycznymi i jedną nominalną; przykład powinien być syntetyczny i wyraźnie oznaczony.
- Dla MLP pokazać przygotowanie wektora oraz warstwy gęste, bez sugerowania braku przetwarzania kategorii.
- Dla TabNet pokazać co najmniej dwa kroki z odmiennymi maskami. Maski nie oznaczają potwierdzonego związku przyczynowego.
- Dla FT-Transformer zachować tożsamość kolumn w tokenach, a nie tylko wspólną projekcję każdej liczby. Pokazać uwagę nad cechami jednej obserwacji i reprezentację agregującą.
- Nie używać kolorów ani ikon sugerujących, że jeden model wygrał. Źródła mechanizmów są już wskazane w podpisie.

### Poziomy zespołów

- W pierwszym panelu pokazać wspólne parametry i odrębne części podmodeli TabM; nie rysować ich jako całkowicie niezależnych sieci.
- W drugim panelu pokazać jedną konfigurację, osiem dopasowań na różnych treningach i średnią prawdopodobieństw testowych.
- W trzecim pokazać różne konfiguracje, predykcje OOF do wyboru wag i zastosowanie tych wag do zapisanych predykcji testowych. Etykiety testowe nie wchodzą do wyboru.
- Dopisać, że zwykłe D i T już korzystają z uśredniania foldów. T+E dodaje łączenie konfiguracji.
- Nie oznaczać stałego TabPFN jako modelu z ośmioma foldami. Jego osiem estymatorów to inne ustawienie. IID KNN korzysta z natywnego LOO; grupowy KNN ma właściwe foldy.

## 3. Format plików

Preferowany jest wektorowy PDF z osadzonymi fontami i przyciętym pustym marginesem. Wystarczy narzędzie do grafiki wektorowej lub diagramów; nie jest wymagany konkretny program. Zachować edytowalne źródło, nie tylko eksport.

- Tekst w ilustracji po polsku; nazwy metod i identyfikatory techniczne w oryginale.
- Przy docelowej szerokości około 150 mm napisy mają pozostać czytelne; zalecany jest rozmiar odpowiadający co najmniej około 9 pt.
- Diagram powinien być zrozumiały również w skali szarości. Oprócz koloru stosować opisy, różne obrysy lub rozmieszczenie.
- Nie umieszczać numeru rysunku ani pełnego podpisu wewnątrz pliku. Wygeneruje je LaTeX.
- Nie dostarczać zrzutu ekranu strony artykułu. Preferowane są autorskie schematy oparte na opisanych mechanizmach.
- Przy wykorzystaniu cudzego rysunku sprawdzić licencję lub warunki reprodukcji i uzupełnić podpis. Samo cytowanie publikacji nie zastępuje sprawdzenia prawa do ponownego użycia.

Jeżeli potrzebny będzie obraz rastrowy, można użyć PNG o odpowiedniej rozdzielczości, lecz trzeba zmienić rozszerzenie w pierwszym argumencie `\plannedfigure`. SVG jest dobrym formatem źródłowym, ale bieżący dokument nie wykonuje jego automatycznej konwersji. Nie dodano zależności od Inkscape, Mermaid ani zewnętrznych konwerterów.

## 4. Wstawianie istniejącego pliku

1. Utworzyć katalog docelowy, jeśli jeszcze nie istnieje, np. `figures/ch03/`.
2. Umieścić PDF pod dokładną nazwą z rejestru.
3. Zachować źródło w `figures/source/`; przy rysunku zewnętrznym zapisać także pochodzenie i warunki użycia.
4. Skompilować dokument z katalogu głównego zgodnie z instrukcją w [README](../README.md).
5. Sprawdzić podpis, polskie znaki, proporcje, czytelność oraz odwołanie w tekście.

Makro w [template/figure-input.tex](../template/figure-input.tex) używa `\IfFileExists`. Brak pliku powoduje wyświetlenie ramki z oczekiwaną ścieżką i opisem. Dostarczenie pliku automatycznie zastępuje ramkę grafiką, zachowując podpis i etykietę. Nie trzeba zmieniać rozdziału, jeżeli nazwa pozostaje taka sama.

Przykład istniejącego wywołania:

```tex
\plannedfigure
    {figures/ch03/poziomy-zespolow.pdf}
    {Podpis rysunku ze wskazaniem źródła.}
    {fig:zespoly}
    {Opis oczekiwanej zawartości, widoczny tylko przy braku pliku.}
```

Jeżeli ilustracja okaże się zbędna, należy usunąć zarówno jej wywołanie, jak i odwołanie w tekście. Ramki są świadomymi znacznikami wersji roboczej; nie mogą pozostać w wersji składanej do oceny.

## 5. Tabele i przyszłe wykresy wyników

Obecne tabele znajdują się bezpośrednio w plikach rozdziałów. Nie wymagają zewnętrznych obrazów ani zrzutów arkusza. Dane i opisy można edytować w LaTeX, zachowując `\caption` i `\label`.

W przyszłych rozdziałach wykresy wyników należy generować z zapisanych artefaktów, a nie ręcznie odczytywać z ekranu. Docelowo zapisać dla każdego wykresu: plik danych lub identyfikator badania, skrypt generujący, wersję analizy, warunek D/T/T+E, metrykę i kierunek jej poprawy, jednostkę agregacji oraz definicję niepewności. Stosować osobne skale dla AUC, log loss i AP. Krzywa ilustracyjna nie może udawać pomiaru.

Na obecnym etapie nie przygotowuje się wykresów wynikowych: kampania naukowa nie została wykonana. Ścieżki ustalone w sekcji 6 wskazują miejsca przyszłego wstawienia. Ramki pozostają do czasu uzyskania i sprawdzenia danych.


## 6. Rozdziały 4–7: rejestr nowych materiałów

Wszystkie ścieżki mają już wywołania w odpowiednich plikach rozdziałów. „Schemat” oznacza materiał możliwy do przygotowania teraz. „Wyniki” oznaczają materiał wymagający rzeczywistych pomiarów, zamrożonej analizy i identyfikowalnych danych. Podpisy wynikowe pozostają robocze do czasu zastąpienia ich opisami wykonanych eksperymentów.

| Rozdział i rodzaj | Plik wynikowy | Etykieta | Wymagana treść i dane |
| --- | --- | --- | --- |
| 4, schemat | `figures/ch04/podzial-i-selekcja.pdf` | `fig:podzial-selekcja` | Jedyny zewnętrzny podział, około 2/3 deweloperskie i 1/3 testowe; osiem foldów; OOF do wyboru T i wag T+E; prawdopodobieństwa testowe do końcowej oceny. |
| 4, schemat | `figures/ch04/zagniezdzone-podzbiory.pdf` | `fig:podzbiory` | Jeden wewnętrzny fold: zagnieżdżone 25/50/100% tylko w treningu. Stała walidacja i test, te same indeksy dla receptur i sparowanych ziaren. |
| 5, schemat | `figures/ch05/architektura.pdf` | `fig:architektura` | CLI i typowany YAML, dane i podziały, katalog i przestrzenie, lokalny backend i trzy rodzaje integracji, manifesty/predykcje, niezależne raportowanie. |
| 6, wyniki | `figures/ch06/kontrasty.pdf` | `fig:wyniki-kontrasty` | Trzy kontrasty na wspólnym teście; różnice i ewentualne zamrożone przedziały. Osobne skale AUC i straty logarytmicznej. |
| 6, wyniki | `figures/ch06/strojenie-i-zespoly.pdf` | `fig:wyniki-strojenie` | Sparowane D–T oraz T–T+E, skuteczne konfiguracje, kompletność i wyjątki. |
| 6, wyniki | `figures/ch06/jakosc-koszt.pdf` | `fig:wyniki-koszt` | Kompromis jakości i jawnie zdefiniowanego kosztu w obrębie zadania; sprzęt, warunek i jednostki. |
| 7, wyniki | `figures/ch07/precision-recall.pdf` | `fig:mechanizmy-pr` | Badanie A: krzywe z prawdopodobieństw właściwej klasy rzadkiej dla obu warunków i trzech ziaren, częstość tej klasy. |
| 7, wyniki | `figures/ch07/jakosc-a-licznosc.pdf` | `fig:mechanizmy-licznosc` | Badanie B: trzy receptury, trzy udziały i trzy ziarna, osobne panele dla trzech zadań; rzeczywiste liczności w źródłowej tabeli. |
| 7, wyniki | `figures/ch07/krzywe-i-luki.pdf` | `fig:mechanizmy-luki` | Zapisane historie treningu i walidacji tej samej sieci, nieważona strata w trybie ewaluacji, epoka i wybrany checkpoint. |

Dla każdego materiału zachować edytowalne źródło o tej samej nazwie bazowej w `figures/source/`, np. `figures/source/architektura.svg`. Dla wykresów źródłem jest skrypt i tabela danych, nie ręcznie edytowany kształt krzywej. Nie trzeba zakładać pustych katalogów ani tworzyć sztucznych plików PDF, aby makro pokazało ramkę.

### Schemat podziału i wyboru

- Pokazać etykiety testowe dopiero przy bloku obliczania metryk; nie prowadzić od nich strzałki do konfiguracji, zatrzymania lub wag.
- OOF i testowe średnie foldów to różne macierze. D i T już wykorzystują średnie foldów; T+E dodaje wagi konfiguracji.
- Dodać osobną adnotację: IID KNN stosuje natywne LOO z przygotowaniem na całej deweloperskiej populacji cech; Diabetes KNN stosuje osiem foldów grupowych.
- TabPFN narysować jako osobną ścieżkę pełnego kontekstu deweloperskiego, bez OOF, HPO i zespołu foldów. Nie utożsamiać ośmiu estymatorów z foldami.
- Dla Diabetes oznaczyć rozłączność pacjentów na obu poziomach. Nie sugerować przeprowadzenia trzech zewnętrznych powtórzeń.

### Schemat podzbiorów

- Zagnieżdżenie 25% wewnątrz 50% wewnątrz 100% dotyczy treningu jednego wewnętrznego foldu.
- Przygotowanie cech jest dopasowywane ponownie tylko na właściwym podzbiorze.
- Pokazać pełną recepturę, brak dropoutu i brak zaniku wag, z zachowaniem pozostałych parametrów.
- Nie wpisywać liczebności osób lub klas, zanim indeksy podzbiorów nie zostaną zapisane. To schemat projektu, nie wynik losowania.

### Schemat architektury

- Oddzielić sześć lokalnych integracji, cztery natywne ścieżki i stały TabPFN. Lokalny `models/registry.py` nie jest pełnym katalogiem badania.
- Pokazać zapis wyników i późniejsze raportowanie z predykcji bez ponownego uczenia.
- Badania A i B oznaczyć jako wymagające implementacji; nie przedstawiać ich jako działających elementów.
- Nie dodawać zdalnego serwera parametrów, klastra ani usługi TabArena. Platforma wykonuje własne badanie lokalnie.

## 7. Przygotowanie przyszłych wykresów i tabel wynikowych

### Dane wejściowe i ich pochodzenie

Źródłem badania głównego będą `manifest.json`, `index.json`, statusy i historia prób, `records/result.json`, `predictions/result.npz` oraz pochodne `report.json`/`report.csv` w repozytorium eksperymentów. Wykres precision–recall i bootstrap wymagają predykcji, nie samych zagregowanych metryk. Krzywe uczenia i tabele badań A/B wymagają nowych artefaktów tych runnerów; obecne raporty główne ich nie zastępują.

Dla każdego wykresu zachować niewielką tabelę danych, skrypt i opis pochodzenia, np. `figures/source/kontrasty.csv`, `kontrasty.py` i `kontrasty.md`. Opis powinien zawierać:

1. Katalog i tożsamość badania, wersję źródeł/analizy, hashe użytych plików oraz datę eksportu.
2. Zbiory, modele, warunki, kolejność klas, surową etykietę rzadką i liczbę poprawnych obserwacji.
3. Definicję metryki, kierunek korzyści, jednostkę agregacji i kryteria braków/wyłączeń.
4. Definicję przedziałów lub zakresów, resampling, jego jednostkę, ziarno i liczbę poprawnych replik.
5. Dla kosztu: urządzenie, jednostki i granice pomiaru. Dla krzywych: fold, ziarno, podzbiór, epoki i sposób wyboru checkpointu.

Nie kopiować dużych danych surowych i całych wyników do repozytorium manuskryptu. Wystarczą tabele do odtworzenia ilustracji oraz odwołania do zachowanych artefaktów. Skrypt powinien odczytywać dane i eksportować PDF; nie należy dodawać nowego frameworka wykresów przed wyborem rzeczywistej analizy.

### Reguły poszczególnych wykresów

- **Kontrasty:** dodatnia różnica oznacza korzyść pierwszej metody. Dla AUC odejmować wynik drugiej od pierwszej; dla straty odwrotnie. Podać braki i mianowniki. Przedziały, jeśli zostaną przyjęte, są warunkowe względem modeli i podziału; nie obejmują ponownego uczenia.
- **Strojenie:** oddzielić zysk D–T od T–T+E; nie wybierać warunku na teście. Nie rysować fikcyjnych T/T+E dla TabPFN ani nazywać każdego zysku efektem samego ensemble.
- **Jakość–koszt:** użyć paneli według zadań. Obecny blok `memory_usage` w rekordzie konfiguracji dotyczy wyłącznie fit: RSS CPU i pamięci przydzielonej/rezerwowanej przez PyTorch. Nie oznacza szczytu całej próby ani pamięci inferencji; te pomiary wymagają osobnych artefaktów. Pola pamięci nie są kolumnami raportu CSV. Oś kosztu musi wskazywać wyszukiwanie, wybrane dopasowania albo zarejestrowane predykcje. Ostatnia miara nie jest nowym pomiarem latencji całego zespołu. Nie mieszać CPU/GPU bez oznaczeń ani czasu z pamięcią. Skala logarytmiczna wymaga dodatnich wartości i opisu jednostek. Ewentualna granica Pareto dotyczy wyłącznie pokazanych warunków.
- **Precision–recall:** poprawnie wskazać klasę rzadką, również gdy nie ma kodu 1. AP liczyć zgodnie z definicją, nie trapezowym całkowaniem. Nie uśredniać krzywych przez połączenie wierszy z różnych ziaren. Punkty progowe pokazać tylko dla progów wybranych na OOF.
- **Jakość–liczność:** pokazać trzy ziarna lub ich średnią z jawnym zakresem. Zakres trzech ziaren nie jest przedziałem ufności. Udział dotyczy treningu wewnętrznego, a nie całego budżetu etykiet. Nie przedstawiać średniej liczności foldów jako dokładnej liczby każdego treningu.
- **Krzywe i luki:** porównywać nieważoną stratę tej samej sieci w trybie ewaluacji. Nie tworzyć luki z treningu jednej sieci i testu zespołu. Pokazać zasadę wyboru paneli i udostępnić pozostałe przebiegi; nie wybierać wyłącznie najbardziej korzystnego ziarna.

### Uzupełnianie tabel

Tabele metodologiczne i wynikowe pozostają tekstem LaTeX. Nie wstawiać tabel jako obrazów. Puste formularze w rozdziałach 6–7 należy rozwinąć na podstawie danych, zachowując podpisy, etykiety i osobne skale metryk. Braki oznaczać jawnie z przyczyną; nie wstawiać zer. Większe zestawienia można przenieść do `tables/` i włączyć przez `\input`, pozostawiając krótsze tabele główne w rozdziałach.

Przed publikacją trzeba zastąpić robocze podpisy opisem rzeczywistych warunków i pochodzenia wyników, usunąć instrukcje redakcyjne i sprawdzić zgodność każdej liczby z artefaktami. Wstawienie PDF pod poprawną ścieżką nie jest samo w sobie kontrolą naukową.
