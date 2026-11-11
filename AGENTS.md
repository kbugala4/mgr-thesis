# Repozytorium rozprawy magisterskiej

## Język i forma

- Treść rozprawy, nagłówki, podpisy rysunków i opisy tabel należy pisać po polsku, w formalnym i precyzyjnym stylu naukowym.
- Oryginalne tytuły publikacji, nazwy metod i identyfikatory kodu zachowują oryginalną formę. Wymagane streszczenie angielskie jest wyjątkiem językowym.
- Style skrótowe używane w rozmowie nie mogą wpływać na język manuskryptu.
- `main.tex` składa dokument przez `\input`. Rozdziały pozostają w osobnych plikach; dłuższe części można podzielić w `sections/`.
- Bibliografię prowadzić w `bibliography/references.bib` przez BibLaTeX/Biber. Stosować `\cite`, `\label` i `\ref`, bez ręcznego numerowania.
- `figures/` i `tables/` służą materiałom manuskryptu, a `template/` jego elementom technicznym. Od 2026-11-11 dokument używa adaptacji `WUT-Thesis` w `template/wut-thesis/`; pochodzenie i lokalne zmiany opisuje tamtejszy `README.md`. Klasa bazuje na `mwart`: rozdziały używają `\section`, niższe poziomy `\subsection` i `\subsubsection`.

## Autorytatywne dokumenty badania

Zakres naukowy pozostaje w sąsiednim repozytorium eksperymentów. Przed zmianą treści należy sprawdzić właściwe dokumenty; nie utrzymywać ich niezależnie edytowanych kopii tutaj:

- [Oryginalny temat](../mgr-repo/docs/thesis-topic.md).
- [Dobór metod](../mgr-repo/docs/study-model-selection.md).
- [Dobór danych](../mgr-repo/docs/dataset-selection.md).
- [Protokół badania](../mgr-repo/docs/tabarena-evaluation.md).
- [Stan implementacji](../mgr-repo/docs/implementation-status.md).

Materiały redakcyjne [planu](../mgr-repo/docs/thesis-plan.md), [rejestru literatury](../mgr-repo/docs/literature-review.md) i [przekazania sesji](../mgr-repo/docs/session-handoff.md) są lokalne i ignorowane przez Git w repozytorium eksperymentów. Po sklonowaniu mogą nie istnieć. Ich datowane kopie wraz z migawką weryfikacji znajdują się w [archiwum pochodzenia](appendices/provenance/2026-11-08/README.md). Kopie służą odtworzeniu podstawy redakcji, nie zastępują aktualnych dokumentów naukowego zakresu. Nie edytować ich; nowe archiwum wymaga nowej daty i manifestu SHA-256.

Rozróżniać plan, zaimplementowane zachowanie, obserwowane wyniki i interpretację. Każde twierdzenie literaturowe wymaga sprawdzonego źródła, a empiryczne --- identyfikowalnego artefaktu. Nie przedstawiać sprawdzeń infrastruktury ani wyników cudzych publikacji jako własnych eksperymentów. Nie rozszerzać puli metod lub danych w trakcie pisania.

## Styl, szablon i materiały zewnętrzne

Poprzednia praca pod `/home/smtech/Documents/Kacper_Bugała___BSc_thesis_23` jest tylko wzorcem stylu i organizacji LaTeX. Nie jest źródłem naukowym nowego badania. Nie kopiować jej treści, metadanych, promotorów ani afiliacji. Użytkownik potwierdził EiTI i wskazał `../WUT-Thesis` jako szablon do adaptacji 2026-11-11. Niepotwierdzone dane pozostają oznaczone w `template/metadata.tex`; zgodność kompletnego dokumentu z wymaganiami jednostki należy sprawdzić przed złożeniem.

Instrukcja tworzenia i wstawiania ilustracji znajduje się w [figures/README.md](figures/README.md). Zachować pochodzenie, edytowalne źródła i warunki użycia materiałów zewnętrznych. Nie zastępować nieuzyskanych wyników syntetycznymi wykresami.

## Weryfikacja i ograniczenia

Przed edycją sprawdzić Git i zachować istniejącą pracę. Bez polecenia nie wykonywać commitów, pushów ani instalacji zależności. Kompilację prowadzić w `build/` lub katalogu tymczasowym, nie wśród rozdziałów. Sprawdzać cytowania, etykiety, skład tabel, ścieżki grafik i rozróżnienie wyników od planów. Brak wymaganych narzędzi zgłosić zamiast deklarować niewykonaną kompilację.
