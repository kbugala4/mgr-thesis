# WUT-Thesis w tym projekcie

Źródło: lokalne repozytorium `../WUT-Thesis`, odpowiadające [ArturB/WUT-Thesis](https://github.com/ArturB/WUT-Thesis), commit `7391c2874e4d668a59c053267f85e1ecf4dfb882`. Adaptacja: 2026-11-11. Odczytano README, pełną klasę, główny przykład, przykładowy rozdział, konfigurację kompilacji, CI i szablon testów. Sumy SHA-256 oryginalnych plików zawiera `provenance.json`. Licencję GPL-3.0 zachowano w `LICENSE` wraz z informacją o autorach w klasie.

Skopiowano klasę oraz dwa używane zasoby graficzne: nagłówek EiTI i napis „Praca dyplomowa magisterska”. W klasie zmieniono ścieżkę w `ProvidesClass`, prefiksy ścieżek grafik, rozmiar bazowy z 12 na dokładnie 11 pt (z korektą standardowego przybliżenia 10,95 pt) i margines zewnętrzny z 25 na 20 mm oraz dodano komentarz identyfikujący adaptację. Nie skopiowano treści przykładowej pracy, jej danych osobowych, oświadczeń ani zbędnych zasobów innych wariantów. Pozostałe makra klasy są zachowane, lecz nieużywane warianty wydziałowe i językowe wymagałyby dodania odpowiednich grafik ze źródła.

## Ustawienia i zakres migracji

- Klasa bazowa `mwart`, tekst główny dokładnie 11 pt, A4, druk dwustronny, bezszeryfowy tekst główny TeX Gyre Heros (`tgheros`), interlinia 1,15, wcięcie 5 mm. Fourier zachowano dla matematyki; streszczenia mają jawnie ustawione 12 pt.
- Marginesy: wewnętrzny 30 mm (25 + 5 mm na oprawę), zewnętrzny 20 mm, górny i dolny 25 mm.
- Wydział EiTI, praca magisterska, język polski; dane w `../metadata.tex`.
- Bibliografia BibLaTeX/Biber w stylu IEEE dostarczanym przez klasę. Klucze i zawartość pliku `.bib` pozostawiono bez zmian; numery cytowań mogą się zmienić.
- Hierarchię `chapter/section/subsection` przeniesiono na `section/subsection/subsubsection`. Każdy rozdział rozpoczyna `clearpage`. Pliki rozdziałów, etykiety i odwołania zachowano.
- Poszerzono pole numeru podrozdziału w spisie treści dla numerów 4.10 i 4.11. Skrócono wyłącznie nagłówek bieżący rozdziału 7. Dodano miejsca łamania dwóch długich fragmentów, bez zmiany ich brzmienia.
- Dodano miejsca na streszczenia polskie i angielskie oraz spisy rysunków i tabel. Ramki ilustracji i tabele wynikowe nadal są robocze.

Użytkownik potwierdził wydział, kierunek Informatyka, specjalność Sztuczna Inteligencja i promotora dr. Pawła Cichosza. Instytut, autor i numer albumu pozostają jawnie nieuzupełnione. Angielski tytuł jest propozycją tłumaczenia do zatwierdzenia. Rok strony tytułowej jest ustawiony jawnie na 2026.

To adaptacja wskazanego szablonu, nie potwierdzenie kompletności pracy do złożenia. [Instytut Informatyki PW wskazuje WUT-Thesis](https://ii.pw.edu.pl/Dla-studentow/Poradnik-dyplomanta/1.-Przygotowanie-pracy-dyplomowej), a [strona wydziałowa](https://www.elka.pw.edu.pl/Studenci/Prace-dyplomowe2/Procedura-dyplomowania) odsyła do zarządzenia 4/2022. Sprawdzono również jego załącznik edytorski. Po migracji, na polecenie użytkownika, dostosowano tekst główny i marginesy do zaleceń załącznika. Pozostałe elementy, w tym szczegółowe formatowanie podpisów i strony tytułowej, nadal wymagają odrębnej kontroli. Nie zastąpiono brakujących wyników, streszczeń ani danych osobowych wymyśloną treścią. Ostateczne wymagania jednostki i kompletność dokumentów należy sprawdzić przed złożeniem pracy.

## Zależności

Standardowa instalacja TeX Live wymaga m.in. `mwart` (pakiet `mwcls`), `fourier`, `babel-polish`, polskich wzorców dzielenia, BibLaTeX z `biblatex-ieee`, Biber, `booktabs`, `tabularx`, `xurl` i `tgheros` oraz zależności klasy. Zwykła kompletna instalacja TeX Live lub Overleaf może korzystać z poleceń podanych w głównym README bez lokalnego drzewa pakietów.

Na bieżącej maszynie TeX Live 2019 brakowało `mwcls`, `fourier`, `babel-polish` i `hyphen-polish`. Za zgodą użytkownika zainstalowano je wraz z zależnością `hyph-utf8` w ignorowanym katalogu `build/texmf`. Nie zmieniano pakietów systemowych. Archiwum zgodne z lokalną wersją: `https://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2019/tlnet-final`. Historyczny `tlmgr` wymagał `--verify-repo=none` (brak działającej weryfikacji GPG); pobieranie odbyło się przez HTTPS. Instalacja plików zakończyła się, lecz automatyczne odświeżanie konfiguracji próbowało pisać do katalogu systemowego i nie powiodło się. Dokończono je lokalnie przez `updmap-user` oraz `fmtutil-user --byfmt pdflatex`.

Do lokalnej kopii systemowego `language.dat` w `build/texmf/tex/generic/config/` dodano `polish loadhyph-pl.tex`. Działa polskie dzielenie wyrazów. Konfigurację fontów i format pdfLaTeX zapisano odpowiednio w `build/texmf-config` i `build/texmf-var`. Usunięcie `build/` usuwa również te lokalne zależności; wówczas potrzebna jest ich ponowna instalacja albo kompletna systemowa dystrybucja TeX Live. Nie kopiowano SCons ani jego zależności Python: nie są potrzebne do złożenia tego dokumentu.

## Weryfikacja pierwotnej adaptacji (przed zmianą fontu i marginesów)

Pełny przebieg pdfLaTeX/Biber/pdfLaTeX/pdfLaTeX oraz kolejne przebiegi po korektach składu utworzyły 52-stronicowy `build/wut/main.pdf`. Końcowy log nie zawiera ostrzeżeń, przepełnień ani nierozwiązanych cytowań i odwołań. Sprawdzono 98 unikalnych etykiet, 40 odwołań, 24 cytowane pozycje, 7 włączonych rozdziałów, 20 tabel i 12 miejsc na ilustracje. Porównanie z kopią sprzed migracji potwierdziło zachowanie treści wszystkich plików rozdziałów po pominięciu zmian nagłówków i poleceń łamania tekstu. `git diff --check` zakończył się poprawnie.

Obejrzano render strony tytułowej, spisu treści, tabeli zbiorów danych, strony rozdziału 7 z tabelami i skróconym nagłówkiem oraz bibliografii. Usunięto podwójny wpis bibliografii wynikający z połączenia `bibintoc` z automatycznym wpisem klasy `mwart`; spisy rysunków i tabel mają osobne kotwice hiperłączy. Nie wykonywano pełnej kontroli wizualnej każdej strony ani ponownego audytu naukowego treści. Walidacja dotyczy pdfLaTeX; LuaLaTeX nie był kwalifikowany w tej migracji.

## Korekta tekstu głównego i marginesów — 2026-11-11

Na polecenie użytkownika włączono bezszeryfowy TeX Gyre Heros i dokładny rozmiar 11 pt. Zmieniono zewnętrzny margines na 20 mm, zachowując wewnętrzny 30 mm oraz górny i dolny 25 mm. Interlinia nadal wynosi 1,15. Streszczenia zachowują jawnie ustawione 12 pt. Dostosowano szerokości numerów w spisie treści i wysokość nagłówka; wysokość uwzględnia `geometry`, aby nie przesunąć górnego marginesu. Nie zmieniono treści rozdziałów.

Kontrola parametrów TeX potwierdziła rodzinę `qhv`, rozmiar 11 pt oraz marginesy 85,35825 / 56,9055 / 71,13188 / 71,13188 pt, czyli odpowiednio 30 / 20 / 25 / 25 mm. Odstęp między liniami wynosi 15,63992 pt (bazowe 13,6 pt pomnożone przez 1,15). Pełna kompilacja z Biber oraz przebiegi po korektach składu utworzyły 47-stronicowy PDF bez ostrzeżeń, przepełnień i nierozwiązanych odwołań. Obejrzano wyrenderowaną stronę tekstu głównego. Nie wykonano pełnego audytu pozostałych wymagań edytorskich. Nie instalowano nowych zależności; `tgheros` był dostępny.

## Korekta rozmiarów nagłówków — 2026-11-11

Ustawiono jawnie rozmiary nagłówków trzech poziomów na 14, 13 i 12 pt zgodnie z zaleceniami PW. Zachowano pogrubienie, krój bezszeryfowy i dotychczasowe odstępy przed nagłówkami oraz po nich. Kontrola parametrów podczas składu potwierdziła rozmiary 14/13/12 pt, rodzinę `qhv` i serię `b`. Dwa przebiegi pdfLaTeX utworzyły 47-stronicowy PDF bez przepełnień i nierozwiązanych odwołań. Po zmianie występują ostrzeżenia `Underfull` dotyczące luźnego składu wierszy i stron; ich korektę pozostawiono do końcowego dopracowania składu. Nie zmieniano pozostałych elementów formatowania ani treści rozdziałów.
