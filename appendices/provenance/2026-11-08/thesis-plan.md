# Szczegółowy plan pracy magisterskiej

**Temat:** Głębokie sieci neuronowe w zastosowaniu do klasyfikacji danych tabelarycznych.

**Opracowanie:** 2026-11-06. **Aktualizacja:** 2026-11-08. **Status:** plan struktury i argumentacji; w sąsiednim repozytorium istnieją wersje robocze rozdziałów 1–5 i szkielety 6–7, a rozdział 8 pozostaje pusty. Zachowuje zaakceptowany zakres. Propozycje analizy wymagają zamrożenia przed końcową oceną; nie opisują wykonanych eksperymentów ani zmian konfiguracji programu.

## 1. Dokumenty nadrzędne i ocena dotychczasowego planu

[Oryginalny temat](thesis-topic.md) określa zakres naukowy. [Dobór metod](study-model-selection.md), [dobór zbiorów](dataset-selection.md) i [protokół eksperymentów](tabarena-evaluation.md) pozostają źródłami decyzji o badaniu. [Stan implementacji](implementation-status.md), [przekazanie sesji](session-handoff.md) i [plan wykonawczy](../plan.md) określają gotowość środowiska. Ten dokument odpowiada za strukturę rozprawy, pytania i mapowanie dowodów na rozdziały. [Przegląd literatury](literature-review.md) zawiera źródła, zakres lektury i uzasadnienie planu. Oznaczenia L01–L19 odnoszą się do tamtego rejestru; nie są kluczami BibLaTeX.

Plan i dokumentacja badań pozostają tutaj. Manuskrypt i modularny szkielet LaTeX istnieją w oddzielnym repozytorium `../mgr-thesis/`; artefakty kompilacji nie należą do repozytorium eksperymentów. Podczas pierwotnego opracowania planu repozytorium manuskryptu jeszcze nie istniało. Ten plan, rejestr literatury, przekazanie sesji i migawki weryfikacji są lokalnymi plikami ignorowanymi przez Git. Ich datowana, nieedytowana kopia archiwalna z sumami SHA-256 jest przechowywana w `../mgr-thesis/appendices/provenance/2026-11-08/`. Archiwum zachowuje podstawę redakcji, nie ustanawia drugiego źródła decyzji naukowych ani nie zastępuje aktualnego protokołu.

### 1.1. Elementy zachowane

- Siedem metod neuronowych i cztery konwencjonalne, dobrane do odmiennych ról badawczych.
- Dwanaście zadań, obejmujących małe zbiory, wysoką wymiarowość, niezrównoważenie i wieloklasowość.
- Wspólny podział zewnętrzny, oddzielenie wyboru modelu od testu, jawne wyjątki KNN i TabPFN.
- Obowiązkowe badania ważenia klas oraz regularyzacji MLP przy zmienianej liczności treningu.
- Koszt, odtwarzalność i ograniczenia jako część oceny naukowej.

### 1.2. Zmiany struktury i ich uzasadnienie

| Poprzedni element | Proponowana zmiana | Uzasadnienie |
| --- | --- | --- |
| Osobne wyniki metod konwencjonalnych i neuronowych, potem ponowne porównanie | Jeden rozdział porównawczy | Bezpośrednia odpowiedź na pytania, bez powielania tych samych tabel. |
| Metodyka połączona z architekturą środowiska | Oddzielne rozdziały metodyki i platformy | Poprawność wnioskowania i poprawność wykonania wymagają różnych dowodów. |
| Ogólne pytanie o wpływ nieistotnych cech, braków i reprezentacji | Tło literaturowe i eksploracyjny opis właściwości | Przyjęty projekt nie zawiera kontrolowanych interwencji dla każdej z tych cech. |
| Osobny rozdział obiecujący ulepszenia lub selektor algorytmów | Rekomendacje w dyskusji | Nie wymuszać nowej metody ani projektowania reguły na podstawie testu. |
| Ranking jako główna historia | Porównanie procedur, następnie dwa badania mechanizmów | Różnica kompletnych potoków nie izoluje jednego mechanizmu. |
| Pytanie o koszt końcowego dopasowania | Opis rzeczywistego treningu foldów i predykcji | Główny protokół nie przewiduje dodatkowego końcowego dopasowania. |

**Oś argumentacji:** trudności danych i ograniczenia wcześniejszych porównań; wybór metod; kontrolowany protokół; porównanie jakości i kosztu; badania dwóch mechanizmów; wnioski ograniczone do zbadanych warunków. Nie zakłada się przewagi którejkolwiek rodziny ani poprawy jakości wraz z datą publikacji.

## 2. Cel, wkład i pytania badawcze

### 2.1. Cel i wkład własny

Celem jest ocena przydatności wybranych metod głębokiego uczenia do klasyfikacji heterogenicznych danych tabelarycznych, ze szczególnym uwzględnieniem rzadkich klas i generalizacji przy ograniczonej liczbie przykładów treningowych.

Planowany wkład obejmuje krytyczną syntezę literatury, uzasadniony dobór przypadków, projekt i integrację odtwarzalnego środowiska, porównanie kompletnych procedur przy zadeklarowanym budżecie, dwa badania kontrolowane oraz analizę jakości, kosztu i ograniczeń. Nowa architektura nie jest wymagana. Wkład techniczny należy oddzielić od wyników empirycznych i przypisać autorstwo użytym bibliotekom.

### 2.2. Pytania i wymagane dowody

| ID | Pytanie | Porównanie i dowód | Granica interpretacji |
| --- | --- | --- | --- |
| PB1 | Jak wybrane procedury neuronowe wypadają na tle metod konwencjonalnych w dwunastu zadaniach? | Wspólne populacje testowe; panel T dla dziesięciu metod strojonych; oznaczony osobno stały TabPFN; wyniki zadań i różnice uprzednio wybranych par | Porównanie potoków przy ustalonym protokole, nie czystych architektur. |
| PB2 | Jak strojenie i łączenie konfiguracji zmieniają jakość oraz koszt? | Sparowane D–T i T–T+E z zapisanych predykcji, liczba udanych konfiguracji, koszt wyszukiwania | D i T są już zespołami foldów dla zwykłych metod; T+E dodaje łączenie konfiguracji. |
| PB3 | Jak ważenie klas wpływa na rozpoznawanie rzadkiej klasy? | Credit Fraud, Santander, Amazon; MLP, TabM, CatBoost; bez wag i z wagami; trzy sparowane ziarna; AP oraz precyzja i czułość przy progach z walidacji | Efekt warunkowy względem ustalonych hiperparametrów, bez ponownego strojenia każdej interwencji. |
| PB4 | Jak dropout i zanik wag wpływają na generalizację MLP przy różnej liczności treningu? | German Credit, Ionosphere, Bioresponse; stała receptura i dwie ablacje; 25%, 50%, 100%; trzy sparowane ziarna; jakość i luki generalizacji | Wpływ usunięcia jednego składnika przy pozostałych ustalonych, bez pełnej analizy interakcji. |
| PB5 | Jaki kompromis jakości, czasu i pamięci uzyskują procedury na zadeklarowanym sprzęcie? | Pomiary wyszukiwania, wybranej procedury i predykcji; RAM/VRAM; wykonalność; wykresy Pareto w obrębie zadania | Lokalny koszt nie obejmuje historycznego pretrenowania ani metastrojenia ustawień domyślnych. |

W PB1 można opisać związki różnic jakości z licznością treningu, wymiarowością, typami cech, brakami i niezrównoważeniem. Przy dwunastu celowo dobranych zbiorach jest to analiza eksploracyjna. Nie będzie podstawą nowego selektora ani dowodem przyczynowym o wpływie poszczególnych właściwości.

### 2.3. Hipotezy robocze

Oczekuje się zależności względnej jakości od zadania, zróżnicowanego zysku ze strojenia i łączenia predykcji oraz zależności skutków regularyzacji od liczności treningu. Są to oczekiwania do sprawdzenia, nie założone wnioski. Ważenie może zmienić kompromis precyzji i czułości bez poprawy AP. Usunięcie regularyzatora może pomóc, zaszkodzić lub nie dać rozstrzygającej różnicy.

Brak przewagi, efekt przeciwny oczekiwaniom i ograniczenie wykonalności są dopuszczalnymi rezultatami. Brak istotności nie oznacza równoważności. Nie formułować tezy o powszechnej przewadze lub słabości DL przed analizą dowodów.

## 3. Zakres i status dowodów

### 3.1. Zakres zaakceptowany

| Blok | Zakres |
| --- | --- |
| Metody neuronowe | MLP, TabNet, FT-Transformer, RealMLP, ModernNCA, TabM, stały lokalny TabPFN-3.5. |
| Odniesienia konwencjonalne | Regresja logistyczna, KNN, XGBoost, CatBoost. |
| Dane | Adult, Covertype, Credit Fraud, HIGGS subset, Amazon Employee Access, Santander Customer Satisfaction, Online Shoppers, Diabetes 130-US, Helena, German Credit, Ionosphere, Bioresponse. |
| Badanie główne | Jeden podział zewnętrzny; osiem foldów wewnętrznych; konfiguracja domyślna i 25 losowych; D, T, T+E. |
| Wyjątki | IID KNN: natywne LOO; Diabetes KNN: foldy grupowe; TabPFN: stała inferencja bez HPO i zespołu foldów. |
| Badania wymagane | Ważenie klas oraz ablacje regularyzacji MLP przy zmiennej liczności treningu. |
| Rozszerzenia opcjonalne | Aktywne uczenie, dodawanie szumu, rotacje, ablacje reprezentacji, kalibracja po uczeniu. Nie są zaległymi obowiązkowymi eksperymentami. |

Nominalnie badanie główne obejmuje 3132 zadania wykonawcze konfiguracji, 132 pary zbiór–metoda oraz 372 właściwe wiersze raportowe. Wiersze ponownie wykorzystują predykcje; nie stanowią 372 niezależnych eksperymentów. Sześć trenowanych metod neuronowych wymaga nominalnie 14 976 dopasowań foldów. Badania mechanizmów dodają 936 neuronowych i 144 procesorowe dopasowania foldów. Źródłem definicji i rachunku pozostaje [protokół](tabarena-evaluation.md).

### 3.2. Implementacja a wyniki naukowe

Wdrożono główną ścieżkę eksperymentów i istnieją datowane dowody częściowej weryfikacji CPU. Nie wykonano końcowej kampanii. Nie zakwalifikowano pełnych audytów danych, treningu GPU, rzeczywistej inferencji TabPFN, kontenera, badań mechanizmów ani końcowej analizy statystycznej. Test jednostkowy lub skrócony pilotaż nie zastępuje tej kwalifikacji.

Każdy wynik rozprawy musi mieć identyfikator badania, tożsamość danych, identyfikatory podziałów, efektywną konfigurację, wersję implementacji, warunek raportowy, status oraz zgodne etykiety i predykcje. Rozróżniać metodę publikacji, zachowanie zaimplementowane, obserwację konkretnego wykonania i interpretację autora.

## 4. Docelowy spis treści i karty rozdziałów

Proponuje się osiem rozdziałów. Orientacyjna objętość zasadniczej treści wynosi 74–98 stron, bez bibliografii i załączników. To budżet redakcyjny, nie wymóg PW ani cel sam w sobie. Nie zwiększać objętości przez powtarzanie wyników lub ogólny podręcznik ML.

| Rozdział | Strony orientacyjnie | Funkcja |
| --- | ---: | --- |
| 1. Wstęp | 4–5 | Problem, cel, pytania, zakres i wkład. |
| 2. Specyfika danych tabelarycznych i stan badań | 12–15 | Synteza trudności i krytyczna ocena benchmarków. |
| 3. Wybrane metody klasyfikacji | 12–16 | Mechanizmy i uzasadnienie wyboru metod. |
| 4. Metodyka badań | 12–16 | Projekt porównania, kontroli i analizy. |
| 5. Środowisko eksperymentalne i odtwarzalność | 6–8 | Wkład techniczny i dowody poprawności wykonania. |
| 6. Wyniki badania porównawczego | 12–16 | Odpowiedzi PB1, PB2 i PB5. |
| 7. Badania mechanizmów uwrażliwiania na rzadkie klasy i ograniczania nadmiernego dopasowania | 10–14 | Odpowiedzi PB3 i PB4. |
| 8. Dyskusja wyników i podsumowanie | 6–8 | Synteza, ograniczenia, rekomendacje i dalsze prace. |

### Rozdział 1. Wstęp

**Pytanie rozdziału:** jaki problem rozwiązujemy i jaki rodzaj odpowiedzi zapewni praca?

- **1.1. Motywacja i znaczenie problemu.** Klasyfikacja tabel jako odrębny obszar zastosowań; dlaczego sukces modeli obrazowych i językowych nie rozstrzyga jakości na tabelach. Oprzeć motywację na L01, bez nieudokumentowanych szacunków znaczenia gospodarczego.
- **1.2. Cel i zakres pracy.** Związek z tematem; klasyfikacja binarna i wieloklasowa; pełne potoki; wymagane badania rzadkich klas i generalizacji; opcjonalność aktywnego uczenia.
- **1.3. Pytania badawcze.** PB1–PB5, populacje i kryteria odpowiedzi; formalne szczegóły w rozdziale 4.
- **1.4. Wkład własny.** Synteza, projekt, integracja, weryfikacja i wyniki; rozdzielić autorstwo kodu i bibliotek. Nie zapowiadać osiągnięć niewykonanej kampanii jako dokonanych.
- **1.5. Organizacja pracy.** Związek rozdziałów z pytaniami, bez streszczania całej rozprawy.

**Materiały:** temat, rejestr pytań, końcowy wykaz wkładu. **Warunek ukończenia:** każde zapowiedziane osiągnięcie ma dowód w dalszej części; bez obietnicy nowej architektury lub pełnej reprezentatywności dziedziny.

### Rozdział 2. Specyfika danych tabelarycznych i stan badań

**Pytanie rozdziału:** jakie trudności wskazuje literatura, jakie są dowody i które zbada ta praca?

- **2.1. Definicja zadania i właściwości danych.** Obserwacje, cechy numeryczne, nominalne i porządkowe, etykiety, rozkład i liczba klas, wymiarowość względem treningu. Tabela jako format nie oznacza niezależności obserwacji.
- **2.2. Reprezentacja i założenia indukcyjne.** Heterogeniczność, skale, kategorie, brak naturalnej lokalności, nierówna informacyjność cech, nieregularne funkcje. L01 i L03 uzasadniają mapę problemów. Eksperymenty perturbacyjne L03 dotyczą jego warunków, nie wszystkich sieci.
- **2.3. Trudne reżimy klasyfikacji.** Mało przykładów, wysoki stosunek liczby cech do treningu, braki, wiele klas, rzadkie zdarzenia, koszt błędów i próg. Rozdzielić jakość uporządkowania, decyzje progowe i jakość prawdopodobieństw.
- **2.4. Rozwój podejść neuronowych.** MLP, specjalizowane reprezentacje i architektury, ulepszone receptury, uczone sąsiedztwo, zespoły i pretrenowanie. Mapa rodzin zamiast katalogu wszystkich modeli; szczegóły wybranych metod w rozdziale 3.
- **2.5. Badania porównawcze.** Zestawić L02–L08: zadania, dobór danych, podziały, metryki, strojenie, zespoły, koszt i ograniczenia. Wyeksponować wyłączenie małych, niezrównoważonych i wysokowymiarowych przypadków z głównego reżimu L03. W L06 rozdzielić klasyfikację i regresję; w L07 pełny benchmark i własną adaptację.
- **2.6. Zgodności i rozbieżności.** Znaczenie mocnych odniesień, kompetentnego MLP, budżetu i walidacji. Wyjaśnić, dlaczego odmienne protokoły mogą prowadzić do różnych rankingów. Nie łączyć niezgodnych liczb w pozornie wspólny test.
- **2.7. Uzasadnienie własnego badania.** Ograniczone, odtwarzalne porównanie plus dwie kontrolowane interwencje. Praca nie konkuruje liczbą zadań z TabZilla, TALENT lub TabArena. To uzasadnienie zakresu, nie twierdzenie o nieistnieniu wcześniejszych badań mechanizmów.

**Materiały:** T1 – benchmarki; T2 – problem–mechanizm–dowód; R1 – rodziny. **Warunek ukończenia:** istotne twierdzenia mają źródła i zakres; końcowy wywód uzasadnia projekt bez deklaracji niezweryfikowanej nowości.

### Rozdział 3. Wybrane metody klasyfikacji

**Pytanie rozdziału:** jakie mechanizmy reprezentuje pula i dlaczego odpowiada pytaniom pracy?

- **3.1. Dobór i notacja.** Dobór celowy, wykonalność, odmienne role, mocne odniesienia. Zdefiniować potok, parametry, hiperparametry i konfigurację domyślną. Wyłączenia zgodne z dokumentem doboru metod.
- **3.2. Metody konwencjonalne.** Regresja logistyczna jako odniesienie liniowe; KNN jako odniesienie sąsiedztwa; XGBoost i CatBoost jako mocne procedury drzewiaste. Opisać predykcję, przygotowanie cech, regularyzację i koszt, z pierwotnymi źródłami z dokumentu doboru metod.
- **3.3. MLP i kompetentna receptura.** Warstwy, aktywacja, strata, optymalizacja, dropout, zanik wag i zatrzymanie. L02, L05 i L09 uzasadniają znaczenie receptury. Lokalny MLP i osobny MLP badania regularyzacji muszą mieć jednoznaczne oznaczenia.
- **3.4. TabNet i FT-Transformer.** Sekwencyjna selekcja cech a tokenizacja i uwaga; L13 i L02. Rola identyfikacji kolumn i kategorii. Nie utożsamiać uwagi z potwierdzoną interpretowalnością przyczynową; osobne badanie wyjaśnień nie jest planowane.
- **3.5. RealMLP.** Receptura przygotowania danych i uczenia; L05. Oddzielić metastrojone ustawienia domyślne od strojenia zadaniowego. MLP–RealMLP jest porównaniem kompletnych rozwiązań.
- **3.6. ModernNCA.** Reprezentacja i probabilistyczna predykcja sąsiedztwa; L14. Bank odniesienia wyłącznie treningowy. KNN jest bezpośrednim odniesieniem, ale różnica potoków nie izoluje wpływu reprezentacji.
- **3.7. TabM.** Współdzielenie parametrów i wiele predykcji; L15. Odróżnić wewnętrzny zespół od uśredniania foldów i łączenia konfiguracji.
- **3.8. TabPFN-3.5.** Pretrenowanie na zadaniach, oznakowany kontekst i stała inferencja; L17. L16 dotyczy wcześniejszej wersji i wymaga uzupełnienia dostępu przed szerszym wykorzystaniem. Oddzielić lokalny checkpoint bazowy od Plus, Fast i Thinking.
- **3.9. Zestawienie ról i granic.** Jedna tabela rodzin, mechanizmów, cech, implementacji i wiedzy zewnętrznej. Pominięte rodziny omówić syntetycznie; nie rozszerzać macierzy.

**Materiały:** T3 – karty metod; R2 – trzy poziomy zespołów. **Warunek ukończenia:** oryginalna publikacja i wykonany wariant są wskazane osobno; opis mechanizmu nie jest dokumentacją API.

### Rozdział 4. Metodyka badań

**Pytanie rozdziału:** jak uzyskamy porównywalne obserwacje i jakie wnioski będą dopuszczalne?

- **4.1. Projekt i jednostki analizy.** Porównanie potoków oraz dwa badania kontrolowane. Rozdzielić obserwację, fold, konfigurację, ziarno i zbiór jako jednostkę porównań między zadaniami.
- **4.2. Dobór i audyt danych.** Źródła, wersje, etykiety, liczności, cechy i motywacja; T4 po audycie. Duplikaty, identyfikatory, sentinele, dostępność cech przy predykcji, grupy i czas. Jawnie opisać anonimowość Heleny, wersję HIGGS i rolę `Time` w fraud. Nie uznawać trudności za zmierzoną na podstawie nazwy.
- **4.3. Podziały.** Pierwszy podział stratyfikowanej procedury trójfoldowej: około 2/3 części deweloperskiej i 1/3 testowej; osiem foldów wewnętrznych. Diabetes: rozłączność pacjentów na obu poziomach. Podać rzeczywiste liczności i tożsamości. Brak podziału czasowego ogranicza twierdzenia o dryfie.
- **4.4. Przygotowanie danych.** Dopasowanie przekształceń na odpowiednim treningu; braki, kategorie, wartości nieznane; uzasadnione różnice potoków. IID KNN wyłącza etykietę obserwacji z LOO, lecz preprocessing widzi całą populację cech części deweloperskiej; nie jest to dokładne ponowne dopasowanie przekształceń dla każdego pominiętego wiersza.
- **4.5. Strojenie i zatrzymanie.** Konfiguracja domyślna i 25 losowych; źródła przestrzeni, ziarna, wybór i limity. Jednakowa liczba prób nie oznacza równego czasu ani równoważnych przestrzeni. Ujawnić efektywne banki KNN; TabPFN bez HPO.
- **4.6. D, T i T+E.** Uśrednianie foldów, wybór konfiguracji na OOF, dodatkowe zachłanne łączenie konfiguracji. Brak dodatkowego końcowego dopasowania; test wyłącznie do oceny. Jawne wyjątki KNN i TabPFN.
- **4.7. Metryki i decyzje.** ROC AUC dla dziewięciu zadań binarnych; log loss dla trzech wieloklasowych. Metryki uzupełniające, AP rzadkiej klasy, progi w A. Kierunki metryk, uśrednianie i przypadki nieokreślone. AP nie utożsamiać z trapezowym polem pod krzywą precision–recall.
- **4.8. Projekt A: ważenie klas.** Populacje, wagi z treningowego foldu, stałe hiperparametry z wyboru wewnętrznego, sparowane ziarna, progi i budżet; karta w sekcji 6.
- **4.9. Projekt B: regularyzacja i liczność.** Niezależnie wybrana receptura, oba regularyzatory niezerowe, pojedyncze ablacje, zagnieżdżone treningi i stałe holdouty; karta w sekcji 6.
- **4.10. Analiza i niepewność.** Kontrasty, rozdzielone skale AUC/log loss, pomocnicze rangi, braki, wielokrotność porównań i zakres niepewności; zamrozić sekcję 7 przed finalnym testem.
- **4.11. Koszt i odtwarzalność.** Sprzęt, wątki, wyszukiwanie, wybrana procedura, predykcja, RAM/VRAM i granice rejestracji. Obecne pomiary pamięci obejmują tylko dopasowanie: RSS CPU oraz pamięć przydzieloną/rezerwowaną przez PyTorch; pamięć inferencji wymaga osobnego pomiaru. Limit partii 4096 dotyczy lokalnych MLP/FT/TabNet, nie modeli natywnych ani TabPFN. Koszt wybranej procedury nie jest kosztem jej znalezienia.

**Materiały:** T4–T6; R3 – przepływ informacji; R4 – projekt podzbiorów. **Warunek ukończenia:** niezależny czytelnik odtworzy decyzje bez domyślania się roli testu, klasy rzadkiej lub jednostki wnioskowania.

### Rozdział 5. Środowisko eksperymentalne i odtwarzalność

**Pytanie rozdziału:** jak platforma egzekwuje protokół i co potwierdza poprawność jej wykonania?

- **5.1. Wymagania.** Lokalny runner, wspólny interfejs, typowany YAML, powtarzalne podziały, budżety, wznowienia; każde wymaganie powiązać z metodyką.
- **5.2. Architektura i integracje.** Konfiguracja, repozytorium danych, katalog modeli i przestrzeni, backend TabArena/AutoGluon, adaptery OOP, zapis predykcji i raporty. Własne badanie z przypiętymi bibliotekami, bez zdalnej usługi i bez deklaracji oficjalnego benchmarku 51 zadań.
- **5.3. Izolacja i identyfikowalność.** Preprocessing, grupy, kolejność klas, bank sąsiadów i rzeczywiste indeksy walidacji. Metadane mają potwierdzić własności z rozdziału 4.
- **5.4. Artefakty i przerwania.** Manifesty, hashe, atomowy zapis, blokady, próby i zgodność wznowienia. Modele foldów są usuwane; raport odtwarza się z predykcji, niedokończoną konfigurację trenuje ponownie.
- **5.5. Weryfikacja i kwalifikacja.** Testy kodu, pilotaże, audyt danych i rzeczywiste GPU/TabPFN jako odrębne dowody. Podać daty i tożsamość źródła; stara migawka nie poświadcza późniejszych zmian.
- **5.6. Wykonanie.** Wersje, checkpoint, sprzęt, ostateczne budżety i procedura. Pełne YAML, zależności i komendy przenieść do załącznika.

**Materiały:** R5 – architektura; T7 – wymaganie, kontrola, dowód, ograniczenie. **Warunek ukończenia:** wykazany wkład techniczny bez utożsamiania zgodnego interfejsu z reprodukcją wyników publikacji.

### Rozdział 6. Wyniki badania porównawczego

**Pytanie rozdziału:** jaką jakość i koszt zaobserwowano oraz na ile wyniki są kompletne?

- **6.1. Kompletność.** Planowane i wykonane konfiguracje, skuteczne próby, awarie i odstępstwa. Przed rankingiem podać liczbę ocenionych zadań i warunków każdej metody.
- **6.2. Wyniki zadań.** Tabele dziewięciu zadań binarnych z AUC i trzech wieloklasowych z log loss; T oraz oznaczony stały TabPFN. Pozostałe metryki i pełne D/T/T+E w załączniku. Bez wyboru warunku według testu.
- **6.3. Uprzednio ustalone pary.** Proponowane: RealMLP–CatBoost, TabM–CatBoost, ModernNCA–KNN. MLP, TabNet i FT-Transformer pozostają widoczne w całym porównaniu i dyskusji rozwoju metod. Nie tworzyć najlepszego przedstawiciela DL przez wybór na teście każdego zadania.
- **6.4. Strojenie i łączenie.** D–T i T–T+E, liczba skutecznych kandydatów oraz koszt. Zysk walidacyjny nie musi oznaczać zysku testowego.
- **6.5. Zróżnicowanie między zadaniami.** Zadania małe, szerokie, kategoryczne, niezrównoważone i wieloklasowe. Właściwości nakładają się; nie są niezależnymi grupami kontrolnymi. Nie dopasowywać wielocechowego modelu wyjaśniającego do dwunastu punktów.
- **6.6. Koszt i wykonalność.** Wyszukiwanie, wybrane procedury, predykcja, pamięć i awarie. Kompromisy wewnątrz zadań i przy zadeklarowanych CPU/GPU; różnica sprzętu nie jest efektem samej architektury.
- **6.7. Odpowiedzi PB1, PB2 i PB5.** Krótkie odpowiedzi z konkretnym odwołaniem do dowodu; szersza interpretacja w rozdziale 8.

**Materiały:** T8–T10 i R6–R8. **Warunek ukończenia:** odtwarzalne wyniki, jawne braki, prezentacja również obserwacji przeciwnych oczekiwaniom.

### Rozdział 7. Badania mechanizmów uwrażliwiania na rzadkie klasy i ograniczania nadmiernego dopasowania

**Pytanie rozdziału:** co zmienia kontrolowana interwencja przy zachowaniu pozostałych ustawień?

- **7.1. Wykonane warunki.** Potwierdzić wagi, hiperparametry, podzbiory, ziarna i kompletność. Projekt z rozdziału 4 uzupełnić rzeczywistymi licznościami i odstępstwami.
- **7.2. Ważenie i uporządkowanie.** AP rzadkiej klasy i różnica względem kontroli, osobno dla zadań, modeli i ziaren. Podać częstość oraz liczbę testowych zdarzeń rzadkich.
- **7.3. Ważenie i progi.** Precyzja, czułość, FP/FN i odsetek alarmów przy progach z OOF. Oddzielić zmianę punktu pracy od jakości uporządkowania i prawdopodobieństw.
- **7.4. Liczność i ablacje MLP.** Trzy warunki i trzy wielkości; rzeczywiste liczności klas, różnice sparowane i zmienność ziaren. Zmiana luki generalizacji nie zastępuje zmiany jakości.
- **7.5. Dynamika i luki.** Ta sama nieważona metryka w trybie ewaluacji, bez aktywnego dropoutu. Trening i walidacja tej samej sieci foldu; nie tworzyć luki z treningu pojedynczej sieci i testu ośmiu sieci.
- **7.6. Odpowiedzi PB3 i PB4.** Warunki efektu, wielkość i niejednoznaczności. Trzy zadania każdego bloku nie uzasadniają reguły dla wszystkich tabel.

**Materiały:** T11–T12 i R9–R11. **Warunek ukończenia:** dowody zgodności kontroli, podzbiorów i etykiet; interpretowalny wynik również wtedy, gdy interwencja nie pomoże.

### Rozdział 8. Dyskusja wyników i podsumowanie

**Pytanie rozdziału:** co wynika z badań, na jakich warunkach i czego nadal nie wiemy?

- **8.1. Odpowiedzi PB1–PB5.** W kolejności, z wielkością efektu i zakresem danych; bez zastępowania odpowiedzi streszczeniem rozdziałów.
- **8.2. Odniesienie do literatury.** Zgodności i rozbieżności z L02–L09 przy różnicach danych, metryk, budżetów, implementacji i wiedzy zewnętrznej. Nie porównywać niezgodnych liczb jako jednego testu.
- **8.3. Znaczenie praktyczne.** Warunkowe rekomendacje uwzględniające jakość i koszt; wskazać scenariusze bez dowodów. Rekomendacja powstała po badaniu nie jest niezależnie zweryfikowanym selektorem.
- **8.4. Zagrożenia trafności.** Celowy dobór zbiorów, jeden podział, trzy ziarna badań mechanizmów, zależności, wyjątek KNN, pretrenowanie/metastrojenie, możliwe pokrycie zadań rozwoju metod, różnice implementacji i zasobów, awarie, brak oceny czasowej.
- **8.5. Realizacja celu i wkład.** Co wykonano, co wykazano, co nie zostało zakwalifikowane; oddzielnie osiągnięcia techniczne i naukowe, z prawidłowym przypisaniem autorstwa.
- **8.6. Dalsze prace.** Replikacje, kolejne podziały, niezależne dane, perturbacje, reprezentacje, aktywne uczenie, dodatkowe modele fundamentowe. Nie są warunkami ukończenia bieżącego zakresu.

**Warunek ukończenia:** każda konkluzja ma źródło w wynikach lub literaturze; brak nowych eksperymentów i nowego rankingu w zakończeniu.

### Materiały wstępne i załączniki

Strona tytułowa, streszczenia polskie i angielskie ze słowami kluczowymi, spis treści, bibliografia, wykazy i załączniki muszą odpowiadać potwierdzonym wymaganiom wydziału. Streszczenia napisać po otrzymaniu wyników.

- **A. Dane:** źródła, wersje, kohorty, role cech, hashe i audyty.
- **B. Metody:** efektywne ustawienia, przestrzenie losowania, warianty implementacji i checkpoint.
- **C. Wyniki główne:** pełne D/T/T+E, metryki klasowe, statusy i przyczyny wyłączeń.
- **D. Mechanizmy:** liczności podzbiorów, regularyzacja, progi, ziarna i pełne wyniki.
- **E. Odtwarzalność:** kod i obraz, format artefaktów oraz minimalne odtworzenie raportów.

Nie dołączać danych objętych ograniczeniami dostępu ani całych bibliotek; wskazać źródła i instrukcje pozyskania.

## 5. Mapa problemów, mechanizmów i dowodów

| Problem | Literatura | Własny dowód i jego granica |
| --- | --- | --- |
| Heterogeniczne cechy i kategorie | L01, L02, L13 | Porównanie potoków na danych mieszanych i kategorycznych; bez izolacji jednej reprezentacji. |
| Cechy nieistotne, orientacja osi, nieregularność | L03 | Synteza literatury; własny projekt nie odtwarza tych perturbacji. |
| Strojenie i zmienność porównań | L04, L05, L07, L11 | D/T/T+E i jawne budżety; efekt konkretnej procedury wyszukiwania. |
| Rzadkie klasy | L10 | A: ważenie, AP i progi; efekt w trzech zadaniach przy ustalonych hiperparametrach. |
| Nadmierne dopasowanie i mało danych | L02, L05, L09 | B: ablacje i podzbiory; wpływ składników wybranej receptury. |
| Wysoka wymiarowość | L03 jako ograniczony reżim, L06 jako szerszy kontekst | Bioresponse w macierzy i B, Santander w macierzy; bez izolacji samej liczby cech. |
| Sąsiedztwo | L14 | KNN–ModernNCA: porównanie procedur z jawnym wyjątkiem LOO i kosztami banku. |
| Łączenie predykcji | L07, L15 | Trzy poziomy: wewnętrzny, foldy, konfiguracje; nie przypisywać całej różnicy jednemu. |
| Dryf i realizm | L08 | Audyt i grupy pacjentów; brak dowodu odporności na dryf. |
| Wiedza przed zadaniem | L05, L17 | Jawne metastrojenie i pretrenowanie; brak założenia pełnej niezależności danych rozwoju metod. |

## 6. Karty obowiązkowych badań mechanizmów

### 6.1. Badanie A: ważenie klas

**Zaakceptowane:** 3 zadania × 3 metody × 2 warunki × 3 ziarna × 8 foldów = 432 dopasowania. Wagi treningowe wynoszą \(w_c=N/(K n_c)\) z liczności bieżącego treningowego foldu. Walidacja i test pozostają nieważone i bez zmiany populacji. Hiperparametry inne niż interwencja pochodzą z wewnętrznego wyboru badania głównego, bez korzystania z jego testu.

**Proponowana analiza:** pierwszoplanowy efekt to różnica AP rzadkiej klasy osobno dla zadania i modelu. Pokazać wszystkie trzy ziarna, średnią sparowaną różnicę i zakres różnic. Nie traktować 3 × 8 foldów jako 24 niezależnych replikacji. ROC AUC i log loss uzupełniają ocenę. Diagnostyka prawdopodobieństw nie oznacza dodania osobnego strojenia kalibratora.

**Proponowana reguła progowa do zamrożenia:** dla każdego zadania, modelu, warunku i ziarna wybrać próg maksymalizujący F1 rzadkiej klasy na połączonych predykcjach OOF; przy remisie najwyższy próg. Decyzja dodatnia oznacza \(p(y=r\mid x)\geq t\), gdzie r jest zadeklarowanym rzadkim wynikiem. Zastosować próg do odpowiadających predykcji testowych bez ponownego doboru. Wspólna reguła nie wymaga identycznych progów. To umowny punkt pracy, nie optimum biznesowe: koszty FP/FN nie są znane. Inny próg aplikacyjny wymaga uzasadnienia przed testem.

**Kontrole do wdrożenia:** surowa etykieta rzadkiej klasy i właściwa kolumna; liczności przed wagami; rzeczywiste zastosowanie wag do straty; identyczne hiperparametry, foldy i ziarna; brak testu przy wyborze; zapis progu i FP/FN. Potwierdzić sposób normalizacji ważonej straty w każdym adapterze.

OOF wykorzystane do wyboru hiperparametrów i progu nie są niezależną oceną ich jakości. Ostateczna ocena pochodzi z testu. OOF dla obserwacji pochodzi z pojedynczego foldu, a test z uśrednienia foldów; może to ograniczać przenoszenie progu. Nie korygować tego przez dopasowanie na teście.

### 6.2. Badanie B: regularyzacja i liczność treningu

**Zaakceptowane:** 3 zadania × 3 warunki × 3 wielkości × 3 ziarna × 8 foldów = 648 dopasowań. Warunki: pełna receptura; brak dropoutu; brak zaniku wag. Nie dodawać warunku wyłączającego oba ani pełnej siatki interakcji.

**Receptura do zamrożenia:** opublikowana rodzina MLP i ustalone architektura, aktywacja, optymalizator, harmonogram, dropout, zanik wag, batch size, epoki i zatrzymanie. L02 daje prosty punkt odniesienia; L05 i L09 uzasadniają ostrożność wobec słabych ustawień. Nie wynika z nich jedna uniwersalna receptura. Oba regularyzatory muszą być dodatnie. Jeśli konfiguracja publikacji tego nie zapewnia, jawnie uzasadnić niezależne odstępstwo; nie nazywać zmienionej receptury dokładną reprodukcją. Nie wybierać jej według pełnozbiorowego strojenia tych trzech zadań.

**Podzbiory:** wewnątrz każdego ustalonego treningowego foldu wyznaczyć zagnieżdżone, stratyfikowane 25%, 50%, 100%. Przed wykonaniem ustalić zaokrąglenia i minimalne liczności klas. Identyczne podzbiory między warunkami i jawne powiązanie trzech ziaren; preprocessing dopasować od nowa tylko na odpowiednim podzbiorze. Walidacja i test pozostają stałe. Jest to wrażliwość na liczność treningu, nie efektywność względem całkowitej liczby anotacji: pełna walidacja nadal dostarcza etykiet.

**Ocena:** wszystkie trzy zadania są binarne, więc metryką zadaniową jest AUC. Dodatkowo wspólny nieważony log loss na treningu i walidacji tej samej sieci foldu w trybie ewaluacji. Zapisywać krzywe epok i epokę wyboru. Test zespołu foldów analizować odrębnie. Mniejsza luka nie dowodzi lepszej generalizacji, jeśli model niedopasowuje oba zbiory.

**Prezentacja:** trzy ziarna, rzeczywiste liczności, średnie sparowane różnice i zakres względem pełnej receptury, krzywe jakości i stosunek liczby cech do treningu. Bez globalnego testu traktującego rozmiary lub foldy jako niezależne dane.

**Kontrole do wdrożenia:** niezależna receptura, niezmienne holdouty, zagnieżdżenie, liczności klas, preprocessing podzbioru i wyłączenie jednego składnika. Ziarna treningu muszą być oddzielone od podziałów; obecne sprzężenie ziarna modelu i podziału w głównym runnerze jeszcze tego nie realizuje.

## 7. Proponowana analiza do zamrożenia przed końcową oceną

To projekt analizy, nie zaimplementowana procedura. Po kwalifikacji wykonalności należy zapisać reguły i tożsamość źródeł przed końcowym wglądem w test. Pilotaż nie może służyć dobieraniu korzystnych kontrastów.

### 7.1. Warunki i efekty

1. PB1: T dla dziesięciu metod strojonych, stały TabPFN osobno oznaczony. D i T+E to osobne panele PB2, bez wyboru najlepszego według testu.
2. Różnica na zadaniu d: \(\Delta_d=\mathrm{AUC}_A-\mathrm{AUC}_B\) dla binarnego; \(\Delta_d=\mathrm{LL}_B-\mathrm{LL}_A\) dla wieloklasowego. Dodatni znak oznacza korzyść A. Skal tych różnic nie uśredniać razem.
3. Efekty na oryginalnej skali każdego zadania; rangi i wygrane tylko uzupełniają wynik i nie wyrażają praktycznej wielkości poprawy.
4. Trzy główne pary: RealMLP–CatBoost, TabM–CatBoost, ModernNCA–KNN. Uzasadnienie: mocny MLP, efektywny zespół i uczone sąsiedztwo. Pozostałe porównania są wynikami opisowymi, bez tworzenia po fakcie nowej rodziny głównych testów.

### 7.2. Agregacja, testy i niepewność

- **Jednostka:** zbiór danych. Nie mnożyć liczebności przez foldy, próby, rozmiary, ziarna lub D/T/T+E. Audyt odrębności źródeł poprzedza wnioskowanie.
- **Opis główny:** wyniki zadań, różnice par, wygrane/remisy/przegrane. Rangi liczyć przy wspólnym zbiorze kompletnych zadań i identycznej puli metod; pokrycie i awarie podać osobno.
- **Propozycja testowa:** dwustronny dokładny test znaków dla trzech par, poprawka Holma w jednej rodzinie, \(\alpha=0{,}05\). Znaki nie łączą skali AUC i log loss. Remis numeryczny: \(|\Delta_d|\leq10^{-12}\) na wynikach niezaokrąglonych; wyłączyć z liczby prób i podać osobno. To nie granica równoważności praktycznej. Tolerancję jawnie uwzględnić także przy prezentacji rang.
- **Założenia i moc:** niezależność zadań i model losowy dla znaków nie wynikają automatycznie z doboru celowego. Wartości p są pomocnicze, nie dowodzą uniwersalnej przewagi. Dwanaście zadań i remisy ograniczają moc. Przy nieuzasadnionych założeniach pozostać przy opisie i wyjaśnić rezygnację z testów. Nie zwiększać liczebności pozornymi replikacjami.
- **Nie wykonywać domyślnie:** wszystkich 55 testów par na każdej metryce i warunku; Wilcoxona na zmieszanych surowych różnicach AUC i log loss; testu t na foldach; automatycznego Elo. L12 uzasadnia dobór jednostki, skali i kontroli wielokrotności, nie jedną procedurę dla każdego projektu.
- **Niepewność zadaniowa:** dla trzech głównych kontrastów proponuje się 95% przedziały z 2000 sparowanych replik bootstrapu zapisanych predykcji testowych, z ustalonym ziarnem analizy. Dla uzasadnionego IID losować wiersze warstwowo po klasie; dla Diabetes losować pacjentów z całymi ich obserwacjami. Te same repliki dla obu modeli. Repliki bez potrzebnej klasy oznaczać jako nieokreślone, policzyć i nie zastępować zerem. Przedział jest warunkowy względem wytrenowanych modeli i podziału; nie mierzy ponownego uczenia ani innych podziałów. Przy nieobsłużonych zależnościach najpierw uzasadnić jednostkę resamplingu.
- **A i B:** pokazać wszystkie trzy sparowane ziarna, wartości różnic i zakres. Zakres nie jest przedziałem ufności. Nie wyprowadzać przewagi populacyjnej z trzech celowo wybranych zadań i nie dodawać testów do głównej rodziny po analizie.

### 7.3. Braki i praktyczna istotność

Raportować nominalną i rzeczywistą liczbę konfiguracji. Awarie nie otrzymują zera, średniej ani arbitralnego najgorszego wyniku. Nieudana konfiguracja domyślna i niepełne wykonanie wymagają rozstrzygnięcia zgodnego z runnerem. Każda analiza kompletnych par ma jawny mianownik; utrata trudnych zadań może ją obciążać. Pokrycie i przyczyny braków są konieczne także dla rankingu na podzbiorze.

Nie ustalać jednej granicy użyteczności dla AUC, log loss i AP. Bez kosztów aplikacyjnych podawać rzeczywiste różnice i kompromisy, bez deklaracji przydatności wdrożeniowej. Testy, przedziały i rangi nie zastępują oceny wielkości efektu.

## 8. Plan tabel, rysunków i pochodzenia wyników

T1–T12 i R1–R11 to identyfikatory robocze. LaTeX wygeneruje numerację przez podpisy, `\label` i `\ref`. Podpisy i objaśnienia po polsku.

| ID | Treść | Rozdział | Źródło / warunek gotowości |
| --- | --- | --- | --- |
| T1 | Benchmarki: dane, podziały, metryki, budżety, zespoły, ograniczenia | 2 | L02–L08, sprawdzone wersje i sekcje. |
| T2 | Problem, mechanizm, rodzaj dowodu | 2 | Literatura i rozróżnienie interwencji od tła. |
| T3 | Jedenaście metod i wiedza zewnętrzna | 3 | Dobór metod, źródła, efektywne warianty. |
| T4 | Statystyki dwunastu audytowanych zadań | 4 | Manifesty, role cech, liczności, braki, grupy. |
| T5 | Protokół i wyjątki | 4 | Zamrożony protokół oraz źródło i konfiguracja. |
| T6 | Pytania, kontrasty, metryki, jednostki i niepewność | 4 | Ostateczna analiza. |
| T7 | Wymagania platformy i dowody kontroli | 5 | Datowane sprawdzenia; GPU/TabPFN tylko po kwalifikacji. |
| T8a/T8b | Jakość binarna / wieloklasowa | 6 | Predykcje, `report.json` i `report.csv`; `log_loss_val` oznacza tutaj test. |
| T9 | Pokrycie, awarie i liczba konfiguracji | 6 | Indeksy zadań, statusy i próby. |
| T10 | Wyszukiwanie, wybrane procedury i predykcja | 6 | Czasy, pamięć, sprzęt i granice pomiarów. |
| T11 | Ważenie: AP, progi, precyzja, czułość, różnice | 7 | Przyszłe artefakty A, surowa etykieta rzadka. |
| T12 | Ablacje: liczności, jakość i luki | 7 | Przyszłe artefakty B i historia uczenia. |
| R1 | Mapa rodzin i problemów | 2 | Schemat autorski ze źródłami, bez sugerowania monotonicznego postępu. |
| R2 | Zespół TabM, średnia foldów i zespół konfiguracji | 3 | L15 i rzeczywisty protokół. |
| R3 | Podział, preprocessing, OOF, selekcja i test | 4 | Granice informacji i wyjątki. |
| R4 | Zagnieżdżone treningi i stałe holdouty | 4 | Projekt B. |
| R5 | Architektura i artefakty | 5 | Aktualne źródło, bez hipotetycznej infrastruktury. |
| R6 | Różnice głównych par | 6 | Test i warunkowe przedziały; osobne skale AUC/log loss. |
| R7 | Zmiana D–T i T–T+E | 6 | Wspólny cache, właściwe oznaczenia nie dotyczy. |
| R8 | Jakość–koszt i Pareto | 6 | Sprzęt i warunek; zadania wybrane przed testem. |
| R9 | Precision–recall bez wag i z wagami | 7 | A; częstość klasy i progi z OOF. |
| R10 | Jakość względem rzeczywistej liczności treningu | 7 | B; wszystkie ziarna, spójne osie. |
| R11 | Krzywe uczenia i luka trening–walidacja | 7 | Wspólna metryka i tryb ewaluacji; jawny wybór ilustracyjnych foldów/ziaren. |

Pełne wyniki pozostają w artefaktach i załącznikach. Przykłady wybierać według uprzedniej reguły pokrycia, nie atrakcyjności wyniku. Dla R8 proponuje się German Credit, Amazon i Bioresponse jako mały, kategoryczny i szeroki przypadek, po kwalifikacji. Nie usuwać wybranego przykładu z powodu słabej jakości.

## 9. Organizacja repozytorium rozprawy

Repozytorium `../mgr-thesis/` ma poniższą organizację, wzorowaną na poprzedniej pracy bez przenoszenia jej treści naukowej i metadanych. Klasa `report` pozostaje układem roboczym:

```text
mgr-thesis/
  AGENTS.md
  main.tex
  chapters/
    01-wstep.tex
    02-stan-badan.tex
    03-metody.tex
    04-metodyka.tex
    05-srodowisko.tex
    06-wyniki.tex
    07-mechanizmy.tex
    08-dyskusja.tex
  sections/                   # w razie potrzeby fragmenty dłuższych rozdziałów
  appendices/
  bibliography/references.bib
  figures/
  tables/                     # wygenerowane zestawienia z tożsamością danych
  template/                   # po sprawdzeniu wymagań
```

`main.tex` składa dokument przez `\input`. Bibliografię prowadzić przez BibLaTeX/Biber zgodnie z szablonem. Proponowany jest spójny styl numeracyjny; dokładny wariant potwierdzić z wymaganiami wydziału i promotorem. Klucze tworzyć po weryfikacji metadanych, bez mechanicznego przepisania L01–L19. Używać `\cite`, `\label`, `\ref`, bez ręcznej numeracji.

Istniejący `AGENTS.md` zawiera reguły języka polskiego, modularności i identyfikowalności oraz odnośniki do nadrzędnych dokumentów tego repozytorium. Datowane kopie materiałów lokalnych w manuskrypcie są wyłącznie nieedytowanym archiwum z manifestem pochodzenia. Nie tworzyć drugiej niezależnie edytowanej wersji decyzji naukowych.

**Wymagania formalne:** 2026-11-06 odczytano opublikowane przez PW [zarządzenie 4/2022](https://www.bip.pw.edu.pl/index.php/Wewnetrzne-akty-prawne/Dokumenty-Rektora-PW/Zarzadzenia-Rektora/2022/Zarzadzenie-nr-4-2022-Rektora-Politechniki-Warszawskiej-z-dnia-27-stycznia-2022-r) i [załącznik nr 1](https://www.bip.pw.edu.pl/index.php/content/download/52900/504782/file/4_2022_za%C5%82%201_%20Zarz_wymogi%20edytorskie_.pdf), zwłaszcza układ pracy i zasady redagowania. Przewidują polskie i angielskie streszczenie pracy polskojęzycznej oraz dopuszczają styl numeracyjny lub harwardzki. Nie potwierdzono wszystkich późniejszych zmian ani kompletu aktualnych wymagań konkretnego wydziału. Poprzednia praca wskazuje WEiTI, ale nie ustala obecnej afiliacji. Przed wyborem klasy LaTeX potwierdzić wydział, szablon, metadane i wymagania lokalne. Sama stara klasa `wut-thesis.cls` nie poświadcza zgodności.

## 10. Kolejność pracy i bramki gotowości

| Etap | Rezultat | Warunek przejścia |
| --- | --- | --- |
| P0. Plan i literatura | Ten plan, rejestr źródeł, mapa pytań i dowodów | Spójność z tematem i zakresem; jawne decyzje otwarte. |
| P1. Dane | Dwanaście kart audytu i zamrożone tożsamości | Rozstrzygnięte przecieki, role cech i populacje. |
| P2. Wykonanie | GPU, TabPFN, trudne ścieżki i pomiary | Dowody wykonalności i budżetu, bez zastępowania modeli według testu. |
| P3. Mechanizmy | Dwa runnery i kompletne karty A/B | Faktycznie wspierane wagi, podzbiory, receptura, ziarna, progi i krzywe. |
| P4. Analiza | Kontrasty, metryki, niepewność, wyłączenia i budżet | Zapisane przed końcową oceną; zachowane źródła i checkpoint. |
| P5. Repozytorium rozprawy | Szkielet, bibliografia, instrukcje i szablon | Oddzielna lokalizacja i potwierdzone wymagania formalne. |
| P6. Kampania | Badanie główne oraz A/B, pokrycie i koszt | Kompletność albo wyjaśnione braki, bez cichej zmiany populacji. |
| P7. Redagowanie | Rozdziały z dowodami | Twierdzenia empiryczne mają artefakty, literaturowe sprawdzone źródła. |
| P8. Weryfikacja rozprawy | Spójny PDF i materiały odtworzeniowe | Pytania zgodne z odpowiedziami, liczby i etykiety poprawne, brak nierozwiązanych znaczników. |

Struktura jest gotowa do przeglądu przed P1–P4, co nie oznacza gotowości do opisu wyników. Po zamrożeniu planu można przygotowywać tło i metody, natomiast opis wykonanej metodyki musi odpowiadać ostatecznej kwalifikacji. Zalecana kolejność redakcji: metodyka i środowisko; tło i metody; wyniki; dyskusja; dopracowanie wstępu i streszczeń na końcu.

### 10.1. Rejestr decyzji otwartych

| Decyzja | Propozycja lub wymagany dowód | Termin graniczny |
| --- | --- | --- |
| Populacje i role cech | Audyt grup, czasu, duplikatów i przecieku; ewentualna jawna rewizja protokołu | Przed zamrożeniem wejść. |
| Pokrycie zadań rozwoju metod | Publikacje, listy meta-train/meta-test, dokumentacja pretrenowania; brak jawnej listy oznaczyć jako niezweryfikowany | Przed twierdzeniem o niezależności zadań. |
| Receptura B | Opublikowana podstawa i niezależne, jawne wartości; oba regularyzatory niezerowe | Przed B. |
| Ziarna A/B | Trzy ustalone ziarna treningu, oddzielone od podziałów i sparowane między warunkami | Przed A/B. |
| Progi A | Propozycja: maksimum OOF F1 rzadkiej klasy, najwyższy próg przy remisie | Przed testem A. |
| Analiza główna | Trzy pary w T, efekty zadaniowe, ewentualny test znaków/Holm i warunkowy bootstrap | Przed końcowym testem. |
| TabPFN i skrajne zadania | Pilotaże checkpointu, 100 klas, kontekstów i szerokich danych | Przed kampanią. |
| Koszt i pamięć | Zmierzone budżety i granice rejestracji na docelowym sprzęcie | Przed rezerwacją wykonania. |
| Wymagania PW | Potwierdzenie wydziału, szablonu, metadanych i stylu bibliografii; repozytorium już istnieje | Przed przyjęciem docelowego szablonu i złożeniem pracy. |

### 10.2. Warunek kompletności

Rozprawa powinna odpowiedzieć na PB1–PB5 na podstawie zidentyfikowanych źródeł i artefaktów, zrealizować oba wymagane badania mechanizmów, przedstawić niekorzystne wyniki i awarie oraz ograniczyć konkluzje do zbadanych warunków. Udokumentowana niewykonalność jest ograniczeniem realizacji, a nie automatycznym spełnieniem wymogu badania. Nie są wymagane aktywne uczenie, nowa architektura, dodatkowe modele, sieciowy serwis parametrów ani rozszerzenie macierzy.
