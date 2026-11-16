# Aktualizacja rozdziałów 4–7 po zakończeniu badania głównego

Podstawa: końcowy eksport `../mgr-repo/results/final/`, profil danych w `plans/`, dokumentacja protokołu i implementacji oraz plan uruchomienia A/B. Zastosowano scientific-writing. Nie zmieniono projektu badań, repozytorium eksperymentów ani jego plików wynikowych.

## Gotowość rozdziału 4

Rozdział 4 jest kompletnym opisem metodyki do przekazania promotorowi: nie zawiera TODO ani pól do uzupełnienia. Zachowuje rozdzielenie reguł projektowych od wyników wyboru konfiguracji i faktów wykonania. Jawnie dopisano rozstrzyganie remisów T niższym indeksem. Dane z audytu i decyzja o zachowaniu duplikatów oraz stałych kolumn pozostają aktualne. Konfiguracje wybrane na podstawie wyników pozostają w 7, a kompletność, wersje i fakty wykonania w 6.

Zakończenie treningów nie oznacza zakończenia analiz niepewności ani zatwierdzenia historycznej chronologii. Te kwestie nie zostały zamaskowane deklaracją gotowości całej pracy. W 6 pozostawiono pole chronologii zgodnie z wcześniejszą decyzją autora.

## Wykonane aktualizacje

- **5:** opis faktycznej reguły agregacji: najnowsze uruchomienie per zbiór–metoda, według pierwszej próby; wymagane zakończone statusy i udany default, bez powrotu do starszego źródła. Dodano zakres dowodowy CSV oraz ograniczenie zliczania jawnych flag skrócenia czasu.
- **6:** zastąpiono nieaktualny status pustego szkieletu opisem dostępnych wyników. Wpisano 372 wyniki, 132 pary, 3097 udanych i 35 nieudanych konfiguracji. Dodano tabelę kompletności według metod, przyczyny awarii, zakres oznaczonego skrócenia i zgodność danych oraz podziałów. Wstawiono trzy tabele testowych wyników punktowych wszystkich 11 metod na 12 zadaniach, z T dla metod strojonych i D dla TabPFN. Poprawiono instrukcję dotyczącą testów istotności, aby odpowiadała analizie opisowej.
- **7:** uzupełniono CatBoost: Credit Card Fraud indeks 17, Santander indeks 2, wraz z parametrami. Wszystkie sześć ustawień A zgadza się dokładnie z eksportem i planem A. Konfiguracja 21 zgadza się z planem B. Usunięto nieaktualne oznaczenia brakujących konfiguracji. Niezależne odtworzenie wyborów OOF i historycznego rankingu B nadal wymaga pierwotnych artefaktów.

Rozdziały 6–7 pozostają poza głównym `main.tex`, zgodnie z zastanym układem. Są dostępne w dodatkowo skompilowanym `build/review4/review-all.pdf`. Główny PDF do przeglądu metodyki to `build/wut/main.pdf`.

## Sprawdzenia eksportu

- 372 unikalne klucze (zbiór, metoda, warunek): D=132, T=120, T+E=120.
- 12 zbiorów, 11 metod, 132 unikalne źródła par.
- 3132 zadania: 3097 udanych + 35 nieudanych. 34 awarie TimeLimitExceeded i jedna OutOfMemoryError. Liczby dotyczą końcowo wybranych uruchomień, nie wszystkich historycznych prób.
- 80 konfiguracji i 436 foldów z jawnym znacznikiem skrócenia: FT-Transformer=53, TabNet=15, MLP=12 konfiguracji. Zera innych metod nie potwierdzają ich pełnego uczenia.
- Wszystkie 132 sumy danych są zgodne z odpowiadającymi im 12 rekordami profilu. Potwierdzono jedną tożsamość podziału na zbiór wspólną dla 11 metod. Jest to zgodność identyfikatorów eksportu, nie ponowne odtworzenie indeksów pacjentów czy OOF.
- Parametry sześciu konfiguracji A porównano dokładnie, bez zaokrąglania, z JSON eksportu i YAML planu; indeksy wynikają z wag T. Parametry B porównano analogicznie.
- W tabelach wyników zastosowano cztery miejsca po przecinku i prawidłowe kierunki metryk. `log_loss_val` odczytano jako stratę zewnętrznego testu, zgodnie z dokumentacją.

## Wersje i pochodzenie

Trzy identyfikatory źródeł wykonawczych w wybranych parach:

- `41833b21ad1a22e6bafb916f7f96ef65cc678ed3673009757402c560cf88a778`: 50 par.
- `dcb8ea91ff9cf2b7933f08c023c9d1a896c16eec52bb94ce3e5d2e5e71121863`: 70 par.
- `10130e51ecc3476d8135f2656aa97db60f7e36f3d48d7ec16e749904a25c67b8`: 12 par.

Pliki stanowiące podstawę aktualizacji (SHA-256):

- `README.txt`: `6c92c6b701b8786b128509a65860a8fe4f26373be761cb36b84acd60269aeb54`.
- `final_configurations.csv`: `4247caeb76ea72b6d25a45e9b7748ce9ae8f269c242e53656e3e0684d147d4c3`.
- `final_confusion.csv`: `c8b03ea01e11560e54be6de2865cbdd6c64161a2968f496440186eca9a42920b`.
- `final_failures.csv`: `a8727c281b171fe586371c4c7cca4c8dcc27b16792132ae30ed70a823548f94f`.
- `final_per_class.csv`: `4b111bc13d0dd15101ae579c5458513494dbe485fcb5c4c5a9f9e4bc347fa041`.
- `final_sources.csv`: `c5681fa9cbba83445385a76c80d70df32fe8b5044b9e4148e87b5a3183c6813d`.
- `final_summary.csv`: `81797f29ee33bae270468320fe3c92b073d82a4d66da1038c565f8024272ca17`.
- `final_superseded.csv`: `3918e6d1f9700a6d847060d2bc2368309dd650802e1f17ac6ee4e7eb4740f6a3`.

## Granice gotowości

Rozdział 6 wymaga jeszcze analizy kontrastów, przedziałów bootstrapowych, wykresów i kosztów oraz interpretacji i odpowiedzi na pytania. Wyniki punktowe są wpisane, ale nie przedstawiono ich jako gotowej analizy niepewności. Brak pierwotnych predykcji uniemożliwia odtworzenie bootstrapu. Trzy wersje kodu wymagają ustalenia różnic zachowania; eksport nie zawiera pełnych źródeł tych wersji. Nie przepisano historycznej propozycji zmian jako dowodu ich wykonania. Nie wyprowadzono sprzętu ani dat zakończenia z samych czasów pierwszej próby.

Rozdział 7 nadal wymaga wyników A/B, diagnostyk, odtworzenia rankingu B i potwierdzenia chronologii. Dostarczenie eksportu głównego zamyka brak ustawień A, lecz nie zamyka tych badań.

## Weryfikacja dokumentu

`bash regen-pdf.sh` przeszło: główny PDF 58 stron. Dodatkowa kompilacja z 6–7 przeszła: 66 stron. Brak niezdefiniowanych odwołań, błędów LaTeX i przepełnień Overfull w obu końcowych logach. Sprawdzono unikalność etykiet, istnienie kluczy cytowań i brak markerów roboczych w 4. `git diff --check` bez błędów. Pozostały wcześniejsze ostrzeżenia pdfTeX dotyczące kotwic przypisów i importowanej okładki. Nie uruchamiano treningów, instalacji ani niezaplanowanych testów.
