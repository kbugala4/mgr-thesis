# Raport redakcji stylu rozdziałów 1–5

Podstawa: `zlecenie-redakcja.md` i `porownanie-stylow.md`. Stan porównawczy: commit `721ded18c2251615588fb8581714b10cea064c21`. Redakcję przeprowadzono w kolejności 4, 5, 2, 3, 1; zmiany pozostają w drzewie roboczym.

Usunięto powtarzane zastrzeżenia, zastąpiono część metakomentarzy opisem decyzji i czynności, uproszczono podpisy oraz połączono wybrane zdania i akapity. Zachowano bezosobową narrację, nagłówki i zakres naukowy. Podpisy ilustracji znajdują się w rozdziałach; pliki `figures/source/*.tex` nie zawierają poleceń `\caption` i pozostały bez zmian. Raport jest jedynym nowym plikiem w `plans/`, zgodnie z końcowym poleceniem zlecenia.

## 1. Pomiary przed i po

W tym klonie nie ma `appendices/stylometry-check.py`, `appendices/corpus-compare.py` ani `appendices/style-analysis-2026-11-13.md`. Nie uruchomiono więc oryginalnych pomiarów ani porównania z korpusem. Poniżej podano **pomiary pomocnicze**, wykonane identyczną metodą przed i po zmianach. Nie należy ich utożsamiać z wynikami skryptów recenzenta ani bezpośrednio porównywać z jego korpusem.

| Rozdział | Zdania ze wzorcem zastrzeżenia [%], przed → po | Średniki / 1000 słów, przed → po | Akapity 3–5 zdań [%], przed → po | Zdania >25 słów [%], przed → po |
| --- | --- | --- | --- | --- |
| 01 | 11.3 → 1.8 | 2.26 → 0.0 | 78.6 → 78.6 | 4.8 → 7.1 |
| 02 | 12.2 → 4.4 | 2.06 → 0.38 | 72.0 → 71.7 | 1.0 → 2.7 |
| 03 | 11.8 → 4.5 | 2.47 → 0.54 | 74.4 → 67.5 | 2.1 → 1.5 |
| 04 | 16.0 → 6.5 | 6.46 → 0.0 | 78.8 → 55.1 | 2.0 → 2.2 |
| 05 | 15.1 → 7.1 | 4.21 → 0.56 | 74.3 → 61.3 | 1.4 → 1.6 |

W pomocniczym pomiarze częstość zastrzeżeń spadła w każdym rozdziale, a liczba średników w prozie zeszła poniżej jednego na tysiąc słów. Pozostałe cele nie zostały osiągnięte równomiernie: udział akapitów 3–5 zdań pozostaje powyżej 60% w rozdziałach 1, 2, 3 i 5, a udział długich zdań spadł w rozdziale 3. Nie łączono osobnych mechanizmów ani omówień publikacji wyłącznie dla poprawienia wskaźnika. Zachowano też zastrzeżenia konieczne dla poprawnego odczytania protokołu, nawet gdy podwyższały ich udział.

Pomiar pomija tabele, rysunki, równania, listy, matematykę wewnątrz tekstu, identyfikatory techniczne i odwołania. Słowem jest ciąg liter, a zdanie rozdziela kropka, wykrzyknik lub pytajnik przed białym znakiem. Zachowuje się zdania z co najmniej trzema słowami i akapity z co najmniej ośmioma. To przybliżenie: skróty i składnia LaTeX mogą zniekształcać segmentację, a wyszukiwanie wzorców nie zastępuje oceny funkcji zdania. Kod pomiaru podano na końcu, aby wynik można było odtworzyć bez plików tymczasowych.

## 2. Zachowane zastrzeżenia obowiązkowe

Numery linii odnoszą się do źródeł po redakcji.

| Nr | Miejsce | Zachowana treść |
| --- | --- | --- |
| 1 | [02-stan-badan.tex](../chapters/02-stan-badan.tex), w. 122 | Wyniki testowe pozostają wyłączone z wyboru konfiguracji, progu, zespołu i zakresu prezentowanych porównań. |
| 2 | [02-stan-badan.tex](../chapters/02-stan-badan.tex), w. 160 | Zachowano bez zmian rozróżnienie AP i pola liczonego metodą trapezów. |
| 3 | [02-stan-badan.tex](../chapters/02-stan-badan.tex), w. 176 | Zachowano idealizację wyprowadzenia: niezależny dobór predykcji, brak ograniczeń architektury, próby i optymalizacji. |
| 4 | [03-metody.tex](../chapters/03-metody.tex), w. 136 | Zachowano Adult i Online Shoppers w kolekcji doboru ustawień RealMLP oraz ograniczenie ustalenia do zgodności nazw. |
| 5 | [03-metody.tex](../chapters/03-metody.tex), w. 178 | Koszt pretrenowania TabPFN pozostaje zewnętrzny; koszt lokalnej inferencji zależy od liczności i szerokości kontekstu. |
| 6 | [04-metodyka.tex](../chapters/04-metodyka.tex), w. 10 | Zachowano porównanie całych potoków i możliwość współudziału kilku składników w obserwowanej różnicy. Usunięto powtórzenia w opisach metod. |
| 7 | [04-metodyka.tex](../chapters/04-metodyka.tex), w. 10 | Foldy, konfiguracje i warunki raportowania pozostają zależnymi elementami jednego zadania. |
| 8 | [04-metodyka.tex](../chapters/04-metodyka.tex), w. 53 | Zachowano udział walidacji w wyborze epoki i niezależność dopiero testu zewnętrznego. |
| 9 | [04-metodyka.tex](../chapters/04-metodyka.tex), w. 67 | Doprecyzowano opis jednego modelu KNN; przygotowanie cech nadal obejmuje całą część rozwojową. |
| 10 | [04-metodyka.tex](../chapters/04-metodyka.tex), w. 169 | Próg pochodzi z OOF i jest przenoszony na średnie predykcje foldów; bez kosztów błędów nie jest optimum wdrożeniowym. |
| 11 | [04-metodyka.tex](../chapters/04-metodyka.tex), w. 187 | Zachowano możliwość niedopasowania i obliczanie luki dla tej samej sieci foldu, z wyłączonym dropoutem. |
| 12 | [04-metodyka.tex](../chapters/04-metodyka.tex), w. 213 | Pozostawiono stwierdzenie, że brak istotności nie potwierdza równoważności. |
| 13 | [04-metodyka.tex](../chapters/04-metodyka.tex), w. 215 | Bootstrap pozostaje warunkowy względem podziału i wytrenowanych modeli, bez zmienności ponownego uczenia. |
| 14 | [04-metodyka.tex](../chapters/04-metodyka.tex), w. 261 | Zachowano wpływ współdzielenia GPU na liczbę aktualizacji i częstość niepowodzeń przy budżecie czasowym. |
| 15 | [05-srodowisko.tex](../chapters/05-srodowisko.tex), w. 57 | Pozostawiono wspólne mapowanie klas oraz brak wykrywania zamiany znaczenia kolumn przez kontrolę numeryczną. |
| 16 | [05-srodowisko.tex](../chapters/05-srodowisko.tex), w. 61 | Cały akapit bez zmian: log_loss_val zawiera stratę testową, a zbiorcze binarne AP dotyczy klasy zakodowanej jako 1. |
| 17 | [05-srodowisko.tex](../chapters/05-srodowisko.tex), w. 88 | Dwa zdania zastąpiono jednym: znacznik określa przyczynę zakończenia, a nie stan zbieżności. |
| 18 | [05-srodowisko.tex](../chapters/05-srodowisko.tex), w. 120 | Pozostawiono ograniczenie heurystyki do jednego tensora oraz brak gwarancji zmieszczenia pełnego przebiegu w VRAM. |
| 19 | [05-srodowisko.tex](../chapters/05-srodowisko.tex), w. 144 | Zachowano zakres dopasowania, wyłączenie pamięci inferencji i zewnętrznego pretrenowania TabPFN z lokalnego kosztu. |

Bez zmian pozostawiono również całe chronione fragmenty: przykład precyzji przy częstości 0,17%, akapit o odległości 2 w KNN, akapit z liczbą parametrów TabM oraz opis `log_loss_val`. Sprawdzono ich dokładną zgodność ze stanem wyjściowym. Średniki w dwóch ostatnich fragmentach zachowano zgodnie z zakazem ich przepisywania.

## 3. Miejsca wymagające ostrożności

Poniżej zapisano rozstrzygnięcia dla fragmentów, w których stylistyczne uproszczenie mogłoby rozszerzyć twierdzenie o implementacji. Cytaty „przed” pochodzą z commita bazowego, a „po” z bieżącej wersji.

### 04-metodyka.tex, w. 83 przed / 81 po

Przed:

```latex
Procedura zatrzymuje uczenie z~zachowaniem stanu modelu dostępnego do predykcji; samo zatrzymanie budżetowe nie oznacza niepowodzenia dopasowania.
```

Po:

```latex
Przy poprawnym zatrzymaniu zachowuje się stan dostępny do predykcji, więc samo osiągnięcie limitu nie powoduje odrzucenia dopasowania.
```

Nie przeniesiono dosłownie przykładu ze zlecenia. Nie dodano gwarancji zachowania „ostatniego najlepszego” stanu dla każdej metody ani udanej próby niezależnie od kompletności zapisu. Zachowano możliwość przekroczenia czasu bez określenia „nieco”.

### 05-srodowisko.tex, w. 59 przed / 57 po

Przed:

```latex
Łączenie predykcji wymaga zgodności zarówno obserwacji, jak i~znaczenia kolumn. Macierze o~tych samych wymiarach mogą bowiem opisywać inne wiersze lub mieć odwróconą kolejność klas.
```

Po:

```latex
Aby połączyć predykcje, trzeba zachować zgodność obserwacji i~znaczenia kolumn, ponieważ macierze o~tych samych wymiarach mogą opisywać inne wiersze lub mieć odwróconą kolejność klas.
```

Forma opisuje wymaganie. Nie stwierdza, że raporter samodzielnie porównuje semantykę kolumn. Wyjaśnienie rzeczywistych kontroli pozostawiono w dalszej części akapitu.

### 03-metody.tex, w. 70 przed / 68 po

Przed:

```latex
Lokalna konfiguracja na CPU pozostawia parametr \texttt{boosting\_type} bibliotece, dlatego opis uporządkowanego wzmacniania wyjaśnia ideę metody, lecz nie identyfikuje trybu każdego uruchomienia.
```

Po:

```latex
W~lokalnej konfiguracji na CPU pozostawiono parametr \texttt{boosting\_type} bibliotece, dlatego tryb konkretnego uruchomienia należy odróżnić od opisanej wyżej idei uporządkowanego wzmacniania.
```

Zachowano ostrożność mimo redukcji innych zastrzeżeń. Opis algorytmu nadal nie przypisuje wszystkim uruchomieniom trybu Ordered.

### 05-srodowisko.tex, w. 131 przed / 125 po

Przed:

```latex
\texttt{selected\_inference\_seconds} sumuje zapisane przebiegi predykcji konfiguracji o~dodatniej wadze. Nie jest nowym pomiarem końcowej latencji całego zespołu i~nie obejmuje automatycznie wszystkich kosztów składania wyników.
```

Po:

```latex
W~polu \texttt{selected\_inference\_seconds} sumuje się czasy zapisanych przebiegów predykcji konfiguracji o~dodatniej wadze. Końcowa latencja całego zespołu, wraz ze wszystkimi kosztami składania wyników, wymagałaby osobnego pomiaru.
```

Zachowano granicę pomiaru. Tryb warunkowy wskazuje, że nowy pomiar końcowej latencji nie został wykonany.

## 4. Rzeczy pozostawione autorowi

- Lista autorów TabPFN-3.5 we wpisie `jaeger2026tabpfn35` wymaga uzupełnienia na podstawie właściwej wersji publikacji. Bibliografii nie zmieniano i nazwisk nie zgadywano.
- Do dokładnego porównania z wynikami recenzenta potrzebne są brakujące skrypty i wskazana analiza. Nie można potwierdzić osiągnięcia progów według ich definicji na podstawie pomiaru pomocniczego.
- Pozostają istniejące komentarze TODO dotyczące receptury MLP, ziaren A/B, reguły progu i kontroli liczby aktualizacji. Zachowano je bez zmian; redakcja stylu nie rozstrzyga tych decyzji badawczych.

## 5. Kontrola treści, odwołań i składu

Po każdym rozdziale sprawdzono odwołania i cytowania oraz porównano chronione elementy ze stanem wyjściowym. Końcowa kontrola rozdziałów 1–5 i źródeł sześciu schematów wykazała:

- 86 unikalnych etykiet, 46 odwołań, 69 miejsc cytowania i 29 wykorzystanych kluczy bibliograficznych; brak nierozwiązanych etykiet i kluczy;
- zachowanie zawartości 15 równań i wszystkich fragmentów matematycznych, z wyłącznie zleconą zamianą delimiterów w rozdziale 4;
- zgodność zestawów i liczności liczb zapisanych cyframi, nagłówków, komentarzy TODO oraz poleceń `\label`, `\ref`, `\cite`, `\texttt` i `\path` w każdym rozdziale;
- zachowanie 13 tabel i sześciu ilustracji oraz poprawne ścieżki ich źródeł;
- brak błędów `git diff --check`.

Przeprowadzono pełną kompilację poleceniem `bash regen-pdf.sh`, odpowiadającym sekwencji pdfLaTeX/Biber/pdfLaTeX/pdfLaTeX opisanej w README. Powstał [PDF](../build/wut/main.pdf) liczący 47 stron. Końcowy log nie zawiera błędów cytowań i odwołań ani komunikatów `Overfull`. Pozostaje siedem komunikatów `Underfull \vbox` dotyczących pionowego rozłożenia treści. Obejrzano strony 28, 29 i 37 z opisem budżetu, zespołów i artefaktów; nie stwierdzono obcięcia tekstu ani tabel. Nie jest to pełna kontrola typograficzna wszystkich stron.

Nie wykonywano eksperymentów ML, instalacji, commitów ani ponownego audytu publikacji. Nie dodano wyników empirycznych i nie zmieniono repozytorium eksperymentów.

## Dodatek: definicja pomocniczego pomiaru

Poniższa funkcja zwraca miary z tabeli. Dla stanu „przed” należy przekazać tekst pobrany przez `git show 721ded18c2251615588fb8581714b10cea064c21:chapters/NAZWA.tex`, a dla „po” zawartość odpowiedniego pliku roboczego. Funkcja korzysta wyłącznie z biblioteki standardowej Pythona.

```python
import re

def metrics(s):
 s=re.sub(r'(?m)^%.*','',s)
 s=re.sub(r'\\begin\{(table|figure|equation|itemize|enumerate)\}.*?\\end\{\1\}','',s,flags=re.S)
 s=re.sub(r'\\\[.*?\\\]|\\\(.*?\\\)|\$[^$]*\$',' ',s,flags=re.S)
 s=re.sub(r'\\(?:label|ref|cite|path|texttt|input)\{[^}]*\}',' ',s)
 s=re.sub(r'\\(?:section|subsection|subsubsection)\{[^}]*\}','',s)
 s=re.sub(r'\\[A-Za-z]+','',s).replace('~',' ').replace('{','').replace('}','')
 paras=[p.strip() for p in re.split(r'\n\s*\n',s) if len(re.findall(r'\b[^\W\d_]+\b',p))>=8]
 def sentences(p):return [x for x in re.split(r'(?<=[.!?])\s+',p) if len(re.findall(r'\b[^\W\d_]+\b',x))>=3]
 ss=[x for p in paras for x in sentences(p)]
 wc=lambda t:len(re.findall(r'\b[^\W\d_]+\b',t))
 caveat=r'nie (?:oznacza|stanowi|zastępuje|wystarcza|rozstrzyga|gwarantuje|dowodzi|potwierdza|jest|są)|a nie|lecz nie|ale nie'
 return {'words':wc(s),'sentences':len(ss),'caveats_pct':round(100*sum(bool(re.search(caveat,x,re.I)) for x in ss)/max(1,len(ss)),1),'semicolons_1000':round(1000*s.count(';')/max(1,wc(s)),2),'paragraphs_3_5_pct':round(100*sum(3<=len(sentences(p))<=5 for p in paras)/max(1,len(paras)),1),'gt25_pct':round(100*sum(wc(x)>25 for x in ss)/max(1,len(ss)),1)}
```
