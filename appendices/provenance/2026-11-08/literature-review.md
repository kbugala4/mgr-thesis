# Literatura do projektu pracy: przegląd i mapa dowodów

**Data wyszukiwania i kontroli źródeł:** 2026-11-06, Europe/Warsaw. **Cel:** ocenić i uszczegółowić [plan rozprawy](thesis-plan.md), zachowując [temat](thesis-topic.md), [pulę metod](study-model-selection.md), [dane](dataset-selection.md) i [protokół](tabarena-evaluation.md).

Jest to ukierunkowany przegląd narracyjny, nie przegląd systematyczny ani wyczerpująca identyfikacja wszystkich publikacji. Rejestr obejmuje 19 pozycji naukowych o różnym poziomie dostępu. Oznaczenia L01–L19 są lokalnymi identyfikatorami planowania, nie gotowymi kluczami bibliografii rozprawy. Nie dodano nowych modeli ani eksperymentów.

## 1. Wniosek dla projektu rozprawy

Dotychczasowy zakres jest merytorycznie uzasadniony. Warto przebudować organizację argumentacji, a nie automatycznie rozszerzać pulę algorytmów. Najbliższe wzorce mają trzy odmienne funkcje:

- **L03:** połączenie porównania predykcyjnego z kontrolowanymi interwencjami wyjaśniającymi; wzorzec logiki badania.
- **L04:** analiza zależności wyników od charakterystyki zadań i strojenia; wzorzec ostrożnej interpretacji heterogeniczności.
- **L07:** walidacja, zespoły, wersjonowanie i identyfikowalność; wzorzec protokołu, z którego repozytorium świadomie korzysta w ograniczonej adaptacji.

Te role nie oznaczają kopiowania ich wyników, zakresu ani pełnych kosztów. Proponowany plan łączy porównanie kompletnych procedur z dwiema przyjętymi interwencjami: ważeniem klas oraz ablacją regularyzacji przy zmiennej liczności treningu. To interpretacja projektowa autora planu, nie zalecenie dokładnie takiej macierzy przez którąkolwiek publikację.

## 2. Sposób wyszukiwania i wersje

### 2.1. Pytania kierujące wyszukiwaniem

1. Jakie benchmarki porównują sieci i drzewa przy jawnych danych, metrykach i budżetach?
2. Które prace badają mechanizmy trudności danych tabelarycznych, a które tylko różnice potoków?
3. Jak współczesne receptury MLP, sąsiedztwo, zespoły i pretrenowanie zmieniają historyczny obraz?
4. Jakie źródła uzasadniają metryki rzadkich klas, separację selekcji od testu i jednostkę wnioskowania?

Punktem wejścia były cytowania istniejące w dokumentacji. Następnie wykonano wyszukiwanie internetowe według tytułów i otwierano źródła pierwotne: arXiv, materiały NeurIPS, AAAI, JMLR, PLOS i PMLR; pomocniczo oficjalne repozytoria autorów. Nie przeszukiwano bezpośrednio Scopus, Web of Science, ACM Digital Library ani pełnych indeksów cytowań. Wyniki blogów, agregatorów i streszczeń AI były wskazówkami wyszukiwawczymi, nie podstawą ustaleń naukowych.

### 2.2. Zapis rzeczywiście użytych zapytań naukowych

Poniżej zapisano zapytania, a nie deklarację pełnego pokrycia wyników. Nie stosowano filtra liczby cytowań ani wymogu otwartego kodu jako kryterium prawdziwości twierdzenia.

```text
"Why do tree-based models still outperform deep learning on tabular data"
"When Do Neural Nets Outperform Boosted Trees on Tabular Data"
"TabArena" "2025" benchmark paper
"TabReD" benchmark real-world tabular datasets
"Deep Neural Networks and Tabular Data: A Survey"
"A Closer Look at Deep Learning Methods on Tabular Datasets"
"TabReD: Analyzing Pitfalls"
"Revisiting Deep Learning Models for Tabular Data" NeurIPS 2021
"Better by Default" "Strong Pre-Tuned"
"Tabular Data: Deep Learning is Not All You Need"
"TabPFN-3.5" "2609.17895"
"The Precision-Recall Plot Is More Informative" Saito Rehmsmeier 2015
"Statistical Comparisons of Classifiers over Multiple Data Sets" Demsar
"On Over-fitting in Model Selection and Subsequent Selection Bias"
"TabM: Advancing Tabular Deep Learning"
"Revisiting Nearest Neighbor for Tabular Data"
"Accurate predictions on small data with a tabular foundation model"
"TabNet: Attentive Interpretable Tabular Learning" AAAI
"Well-tuned Simple Nets Excel on Tabular Datasets"
site.proceedings.mlr.press "On Calibration of Modern Neural Networks"
site.ojs.aaai.org "TabNet: Attentive Interpretable Tabular Learning"
"Accurate predictions on small data" "arxiv"
```

Dobierano publikacje bezpośrednio przydatne do pytań, zaakceptowanych metod i metodyki. Nie przeprowadzono kompletnego przesiewu wszystkich trafień ani analizy ryzyka stronniczości według formalnego protokołu; nie podaje się pozornej liczby publikacji odrzuconych.

### 2.3. Granica czasowa i kontrola wersji

Zaakceptowany przegląd doboru metod ma granicę **2026-10-27**. Niniejsza lektura uzupełnia uzasadnienie i strukturę, nie zmienia automatycznie tej decyzji ani checkpointów. Rdzeń poniższej syntezy oparto na wskazanych wersjach dostępnych przed granicą. Data preprintu, data konferencji, rewizja artykułu i wersja biblioteki to różne informacje.

W szczególności:

- L06: użyto arXiv **2407.00956v4**, rewizja z **2025-11-07**. Nie utożsamiać jej zakresu z wcześniejszymi wersjami i ich liczbą metod.
- L08: użyto arXiv **2406.19380v4**; wcześniejsza v2 ma inny tytuł. Tytuł i ustalenia w tym rejestrze odnoszą się do v4.
- L17: do syntezy wybrano **2609.17895v2 z 2026-09-22**. Metadane pokazują nową **v3 z 2026-11-03**, już po przyjętej granicy. Zarejestrowano jej istnienie, ale nie wykonano pełnego porównania zmian v2–v3 i nie użyto v3 do zmiany puli lub ustawień. [Historia wersji](https://arxiv.org/abs/2609.17895).
- Dla publikacji konferencyjnych preferować ostateczny rekord konferencji. Jeżeli czytano wersję arXiv, zapisać ją osobno; nie nazywać jej automatycznie identyczną z późniejszą publikacją.

## 3. Rdzeń: przeglądy i badania porównawcze

W kolumnie „Ustalenie” znajdują się wyniki lub argumenty autorów. Kolumna ostatnia zawiera konsekwencję dla tej pracy. „Tekst” oznacza sprawdzenie wskazanych fragmentów, nie deklarację przeczytania każdego załącznika i kodu publikacji.

| ID i zweryfikowane odniesienie | Pytanie i projekt / populacja | Ustalenie istotne dla planu | Ograniczenie, dostęp i lokalizator | Konsekwencja dla rozprawy |
| --- | --- | --- | --- | --- |
| **L01.** Borisov i in., *Deep Neural Networks and Tabular Data: A Survey*. Preprint 2021, v3 2022; publikacja powiązana DOI [10.1109/TNNLS.2022.3229161](https://doi.org/10.1109/TNNLS.2022.3229161); [arXiv v3](https://arxiv.org/abs/2110.01889v3). | Przegląd rodzin metod: przekształcenia danych, architektury i regularyzacja; także inne zadania niż klasyfikacja. | Heterogeniczność, kodowanie, brak prostej struktury przestrzennej i znaczenie pojedynczych cech tworzą użyteczną mapę wyzwań. | Sprawdzono metadane, abstrakt i indeksowane fragmenty sekcji III–IV tekstu wydawcy; bez pełnej lektury całego przeglądu. To historyczna synteza, nie ranking 2026. | Punkt wejścia do rozdziału 2; nie wystarcza jako jedyne źródło stanu badań. |
| **L02.** Gorishniy, Rubachev, Khrulkov, Babenko, *Revisiting Deep Learning Models for Tabular Data*, NeurIPS 2021; [tekst konferencyjny](https://proceedings.neurips.cc/paper/2021/file/9d86d83f925f2149e9edb0ac3b49229c-Paper.pdf). | Porównanie architektur na 11 zadaniach, obejmujących klasyfikację i regresję, we wspólnym protokole. | Proste mocne modele MLP/ResNet są istotnym odniesieniem; FT-Transformer stanowi skuteczną adaptację uwagi. Autorzy nie wskazują rozwiązania dominującego uniwersalnie nad GBDT. | Tekst: sekcje 3–4, tabela 1. Mały zestaw zadań i starsza generacja metod; nie jest dowodem o TabM lub TabPFN-3.5. | Kompetentny MLP i historyczny FT-Transformer; kontrola zgodności wariantu implementacji. |
| **L03.** Grinsztajn, Oyallon, Varoquaux, *Why do tree-based models still outperform deep learning on typical tabular data?*, NeurIPS 2022; [tekst konferencyjny](https://proceedings.neurips.cc/paper_files/paper/2022/file/0378c7692da36807bdec87ab043cdadc-Paper-Datasets_and_Benchmarks.pdf). | Benchmark 45 zbiorów i kontrolowane transformacje danych; główny reżim około 10 tys. treningowych przykładów. | Badane drzewa są mocne; interwencje wskazują znaczenie cech nieinformatywnych, orientacji osi i nieregularnych zależności. | Tekst: sekcje 3.1–3.5, 4.2, 5.1–5.4; rysunki 1–4. Selekcja ogranicza małe i wysokowymiarowe zbiory; klasyfikację równoważy, usuwa braki i ogranicza kategorie. | Wzorzec oddzielenia benchmarku od mechanizmów; brak podstaw do przeniesienia jego wniosków wprost na rzadkie klasy i małe dane tej pracy. |
| **L04.** McElfresh i in., *When Do Neural Nets Outperform Boosted Trees on Tabular Data?*, NeurIPS 2023; [rekord konferencyjny](https://proceedings.neurips.cc/paper_files/paper/2023/hash/f06d5ebd4ff40b40dd97e30cee632123-Abstract-Datasets_and_Benchmarks.html), [czytany tekst v4](https://arxiv.org/html/2305.02997v4). | 19 algorytmów, 176 zbiorów klasyfikacji, analiza metacech i strojenia; różne analizy mają różne mianowniki kompletności. | Na wielu zadaniach strojenie i właściwości danych mają istotne znaczenie dla porównania rodzin. | Tekst: sekcje 2.1–2.2, dodatek D. Historyczny TabPFN bywa ograniczany do 3000 przykładów; analiza metacech jest obserwacyjna. | Zróżnicowane zadania i opisowa analiza właściwości; nie budować selektora z dwunastu punktów. |
| **L05.** Holzmüller, Grinsztajn, Steinwart, *Better by Default: Strong Pre-Tuned MLPs and Boosted Trees on Tabular Data*, NeurIPS 2024; [tekst konferencyjny](https://papers.nips.cc/paper_files/paper/2024/file/2ee1c87245956e3eaa71aaba5f5753eb-Paper-Conference.pdf). | RealMLP i domyślne ustawienia rozwijane na 118 zbiorach meta-train, oceniane m.in. na 90 rozłącznych zbiorach meta-test. | Mocna receptura MLP i lepsze ustawienia domyślne zmieniają kompromis jakości i czasu. | Tekst: sekcje 1.1 i opis projektu; omówienie składników receptury. Ograniczenia obejmują reżim 1K–500K i brak brakujących cech numerycznych w benchmarkach autorów. | Zachować RealMLP; ujawniać koszt i dane metastrojenia. Nie przypisywać różnicy MLP–RealMLP jednemu składnikowi. |
| **L06.** Ye, Liu, Cai, Zhou, Zhan, *A Closer Look at Deep Learning Methods on Tabular Datasets*, [arXiv 2407.00956v4](https://arxiv.org/html/2407.00956v4), 2025; pierwsza wersja 2024. | TALENT: 300 bazowych zadań i rozszerzenia; w czytanej wersji porównanie 40 metod. Baza obejmuje 120 binarnych, 80 wieloklasowych i 100 regresyjnych zadań. | Wyniki zależą od danych, ale mocne wyniki skupiają się w ograniczonej grupie metod; zespoły i modele pretrenowane są ważnym elementem krajobrazu. | Tekst: 4.3, 5, analiza CV w 7, dodatek A. Holdout 64/16/20 i 100 prób różnią się od tej pracy; ranking mieszany nie jest rankingiem samej klasyfikacji. | Szeroki kontekst doboru metod, bez przenoszenia agregatów jako przewidywanych wyników. |
| **L07.** Erickson i in., *TabArena: A Living Benchmark for Machine Learning on Tabular Data*, NeurIPS 2025; [tekst konferencyjny](https://papers.neurips.cc/paper_files/paper/2025/file/1697e3fb412da11dc9488249f9e7bbc9-Paper-Datasets_and_Benchmarks_Track.pdf). | 51 kuratorowanych zbiorów, 16 metod oraz referencyjny system AutoGluon; walidacja, HPO, zespoły i metadane. | Autorzy pokazują wpływ walidacji i łączenia konfiguracji na ocenę metod; wyniki zależą również od reżimu zasobów. | Tekst: 2.2–2.3, 3.1–3.2, rysunki 1 i 4. Zakres i domyślne wersje są inne; oryginalna ocena TabPFN nie dotyczy stałego checkpointu 3.5 tej pracy. | Najbliższa podstawa protokołu, lecz własne 12 zadań i jeden podział nie są oficjalnym pełnym benchmarkiem. |
| **L08.** Rubachev i in., *TabReD: Analyzing Pitfalls and Filling the Gaps in Tabular Deep Learning Benchmarks*, ICLR 2025; [czytany arXiv v4](https://arxiv.org/html/2406.19380v4), [oficjalne repozytorium](https://github.com/yandex-research/tabred). | Osiem przemysłowych zbiorów, bogate cechy i podziały czasowe. | Zmiana losowego podziału na czasowy może zmienić względną ocenę metod. | Tekst: wprowadzenie, opis benchmarku i porównań. To inna populacja i problem niż standardowe IID; nie świadczy o czasowej odporności badanych tutaj modeli. | Audyt realizmu i ograniczenie twierdzeń; bez automatycznego dodania trzeciego badania dryfu. |
| **L09.** Kadra, Lindauer, Hutter, Grabocka, *Well-tuned Simple Nets Excel on Tabular Datasets*, NeurIPS 2021; [tekst konferencyjny](https://proceedings.neurips.cc/paper_files/paper/2021/file/c902b497eb972281fb5b4e206db38ee6-Paper.pdf). | 40 zbiorów; wspólne wyszukiwanie kombinacji 13 technik regularyzacji i ich ustawień. | Kompetentna regularyzacja może dawać mocne wyniki prostych sieci. | Tekst: abstrakt, opis procedury, sekcja 5 i ograniczenia. Wynik wieloskładnikowego, zadaniowo strojonego zestawu nie izoluje dropoutu lub zaniku wag. | Uzasadnienie badania B; nie dodawać kosztownego odtwarzania całego zestawu ani nazywać dwuskładnikowej ablacji jego reprodukcją. |

## 4. Źródła metodyczne

| ID i odniesienie | Co sprawdzono i co źródło wspiera | Ograniczenie i zastosowanie |
| --- | --- | --- |
| **L10.** Saito, Rehmsmeier, *The Precision-Recall Plot Is More Informative than the ROC Plot When Evaluating Binary Classifiers on Imbalanced Datasets*, PLOS ONE 10(3), e0118432, 2015; [tekst i DOI](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0118432). | Tekst: opis symulacji i Results and Discussion. Relacja precision–recall ujawnia aspekty rzadkich zdarzeń, których sam ROC nie opisuje operacyjnie. | Uzasadnia AP/PR i precyzję/czułość w A. Nie dowodzi przewagi ważenia ani nie utożsamia każdej definicji pola PR z AP. |
| **L11.** Cawley, Talbot, *On Over-fitting in Model Selection and Subsequent Selection Bias in Performance Evaluation*, JMLR 11, 2079–2107, 2010; [tekst](https://jmlr.csail.mit.edu/papers/volume11/cawley10a/cawley10a.pdf). | Abstrakt i początkowe sekcje tekstu: optymalizacja skończonej próby walidacyjnej może prowadzić do przeuczenia kryterium selekcji. | Wspiera separację selekcji od testu i ostrożność wobec walidacyjnych zwycięzców; nie poświadcza poprawności konkretnego runnera. |
| **L12.** Demšar, *Statistical Comparisons of Classifiers over Multiple Data Sets*, JMLR 7, 1–30, 2006; [tekst](https://www.jmlr.org/papers/volume7/demsar06a/demsar06a.pdf). | Tekst: 3.1, porównywalność skal, testy par i część o poprawce Holma. Zbiory stanowią jednostki porównania; wybór testu zależy od pytania i założeń. | Wspiera unikanie pseudoreplikacji i kontrolę wielokrotności. Proponowany test znaków/Holm to wybór projektowy; publikacja nie gwarantuje mocy ani reprezentatywności 12 dobranych zadań. |
| **L18.** Shwartz-Ziv, Armon, *Tabular Data: Deep Learning is Not All You Need*, [arXiv 2106.03253](https://arxiv.org/abs/2106.03253), 2021; późniejsza publikacja Information Fusion, DOI [10.1016/j.inffus.2021.11.011](https://doi.org/10.1016/j.inffus.2021.11.011). | Dostęp w tej sesji ograniczony do abstraktu i metadanych preprintu. Autorzy deklarują porównanie jakości, strojenia i kosztu z XGBoost oraz ocenę zespołu. | Historyczny kontekst krytyki słabych porównań. Nie użyto szczegółowych wyników liczbowych ani tabel bez lektury pełnej wersji. |
| **L19.** Guo, Pleiss, Sun, Weinberger, *On Calibration of Modern Neural Networks*, ICML 2017, PMLR 70:1321–1330; [rekord pierwotny](https://proceedings.mlr.press/v70/guo17a.html). | Sprawdzono abstrakt i metadane. Publikacja rozdziela jakość prawdopodobieństw od innych aspektów predykcji; badania autorów dotyczą m.in. obrazów i dokumentów. | Wyłącznie źródło definicyjne do dalszej lektury, nie dowód problemu kalibracji TabM lub TabPFN w tym badaniu. Nie uzasadnia dodatkowej kampanii kalibracji. |

## 5. Publikacje mechanizmów wybranych modeli

MLP i FT-Transformer mają bezpośrednie odniesienie L02, RealMLP – L05. Pierwotne źródła regresji logistycznej, KNN, XGBoost i CatBoost są w [dokumencie doboru metod](study-model-selection.md); nie przeprowadzono tu ponownego pełnego przeglądu ich historii.

| ID i odniesienie | Pytanie / mechanizm i sprawdzony fragment | Ograniczenie i rola |
| --- | --- | --- |
| **L13.** Arik, Pfister, *TabNet: Attentive Interpretable Tabular Learning*, AAAI 35(8):6679–6687, 2021; [rekord wydawcy](https://ojs.aaai.org/index.php/AAAI/article/view/16826), DOI 10.1609/aaai.v35i8.16826; [czytany preprint v5](https://arxiv.org/abs/1908.07442v5). | Sprawdzono rekord i tekst sekcji o TabNet oraz selekcji cech: uczone maski i przetwarzanie w kolejnych krokach. | Źródło mechanizmu i historycznej roli. Deklaracje oryginalnej przewagi lub interpretowalności nie są wynikiem tej pracy. |
| **L14.** Ye i in., *Revisiting Nearest Neighbor for Tabular Data: A Deep Tabular Baseline Two Decades Later*, ICLR 2025; [czytany arXiv 2407.03257v2](https://arxiv.org/html/2407.03257v2). | Tekst: wprowadzenie, sekcje 3–4 i wskazane ablacje 6.2. ModernNCA łączy uczoną reprezentację z różniczkowalnym sąsiedztwem i próbkowaniem kandydatów. | Wyniki szerokiego benchmarku mieszają typy zadań. Uzasadnia rolę KNN, ale nie izoluje efektu reprezentacji w dwóch różnych implementacjach tej pracy. |
| **L15.** Gorishniy, Kotelnikov, Babenko, *TabM: Advancing Tabular Deep Learning with Parameter-Efficient Ensembling*, ICLR 2025; [czytany arXiv 2410.24210v2](https://arxiv.org/html/2410.24210v2). | Tekst: sekcje 3–4 i opis analizy 5. Parametry współdzielone przez podmodele umożliwiają wiele predykcji w architekturze MLP. Opisany benchmark ma 46 zadań: klasyfikację i regresję. | Wewnętrzny zespół nie jest tym samym co zespół foldów lub konfiguracji. Własny wynik MLP–TabM nie jest jednoczynnikową ablacją ensemblingu. |
| **L16.** Hollmann i in., *Accurate predictions on small data with a tabular foundation model*, Nature, 2025; DOI [10.1038/s41586-024-08328-6](https://doi.org/10.1038/s41586-024-08328-6). | Zweryfikowano identyfikację publikacji i indeksowany opis; bez pełnego dostępu w tej sesji. Otwarcie strony oraz PDF Nature zakończyło się błędem mechanizmu dostępu. | Historyczne odniesienie do wcześniejszego TabPFN. Nie użyto jego szczegółowych wyników ani ograniczeń jako dowodu o wersji 3.5. Pełna lektura przed rozwinięciem tego fragmentu rozprawy. |
| **L17.** Jäger i in., *TabPFN-3.5: Technical Report*, [arXiv 2609.17895v2](https://arxiv.org/html/2609.17895v2), 2026-09-22; pierwsza wersja 2026-09-15. | Tekst: 2.1, tabela 1 i jej definicja, sekcja 3, opis wariantów oraz wyniki TALENT w dodatku C. Tabela obejmuje różne warianty rodziny, nie jeden lokalny checkpoint. | Raport techniczny autorów, nie niezależna walidacja. Nie przenosić wyniku Thinking/Plus na model bazowy. Faktyczna lokalna inferencja i wykonalność nadal wymagają kwalifikacji. |

## 6. Synteza: co rzeczywiście wiadomo

### 6.1. Wspólne wnioski i pozorne sprzeczności

L02 i L09 pokazują, dlaczego słaby lub arbitralnie skonfigurowany MLP nie jest wystarczającym przeciwnikiem. L05 rozszerza tę perspektywę na metastrojone receptury. L03 analizuje trudności w silnie kontrolowanym reżimie; L04 obejmuje szerszą heterogeniczność klasyfikacji. L07 podkreśla wpływ protokołu i łączenia predykcji. Zestawienie wspiera badanie kompletnych procedur i ujawnianie kosztów, a nie ranking samych nazw architektur.

Wniosek L03 o przewadze drzew w jego warunkach i korzystne wyniki współczesnych metod w L05–L07 nie muszą się wykluczać. Różnią się metody, ustawienia, dane, podziały, cele i zasoby. Bez harmonizacji nie można oszacować z tych prac jednej wspólnej wielkości przewagi. Nie wykonano metaanalizy efektów.

L08 uzasadnia ostrożność wobec utożsamiania losowego holdoutu z przyszłym wdrożeniem. Własny protokół ma grupowe ograniczenia Diabetes, ale nie ocenia generalizacji czasowej. Szeroka lista właściwości danych pozostaje tłem; bez interwencji nie można nazwać związku między cechą zbioru a rankingiem efektem przyczynowym.

### 6.2. Rozdzielenie poziomów porównania

1. **Potoki:** MLP–RealMLP, KNN–ModernNCA i MLP–TabM różnią się wieloma składnikami. Odpowiadają, które kompletne rozwiązanie działa w zadanych warunkach.
2. **Kontrolowane interwencje:** A i B zmieniają zadeklarowany składnik przy stałych pozostałych warunkach. Odpowiadają na węższe pytanie mechanizmu.
3. **Selekcja i łączenie:** D/T/T+E zmienia procedurę wykorzystania kandydatów; zwykłe D i T już korzystają z foldów. To nie porównanie pojedynczej sieci z zespołem.
4. **Wiedza zewnętrzna:** RealMLP korzysta z receptury rozwijanej poza zadaniem; TabPFN z pretrenowanych wag. Brak lokalnego HPO nie oznacza braku wcześniejszej selekcji lub kosztu.

### 6.3. Uzasadniony wkład tej pracy

Dwanaście zadań nie pozwoli odtworzyć skali i mocy wielkich benchmarków. Wartość pracy ma wynikać ze spójnego protokołu, kwalifikacji przypadków trudnych, odtwarzalności i bezpośredniego połączenia porównania metod z dwoma wymaganymi badaniami mechanizmów. Nie stwierdzono, że podobna kombinacja nigdy wcześniej nie wystąpiła w literaturze. Roszczenie pierwszeństwa wymagałoby osobnego, znacznie szerszego wyszukiwania.

## 7. Konsekwencje dla struktury i analizy

| Ustalenie przeglądu | Decyzja planistyczna |
| --- | --- |
| Przyczyny trudności i wyniki benchmarków to odrębne poziomy dowodu | Rozdział 2 syntetyzuje problemy i protokoły, rozdział 6 porównuje potoki, rozdział 7 bada interwencje. |
| Współczesny MLP, sąsiedztwo i zespoły mają odrębne role | Zachować zaakceptowane RealMLP, ModernNCA i TabM, bez automatycznego dodawania modeli. |
| Wynik zależy od walidacji i budżetu | Metodykę wydzielić przed wynikami; opisać D/T/T+E i wyjątki przed rankingiem. |
| Wyniki rzadkich klas wymagają właściwej metryki i etykiety | A: AP rzadkiej klasy oraz decyzje przy progach ustalonych na OOF. Nie zmieniać automatycznie głównej binarnej metryki AUC. |
| Wieloskładnikowa receptura nie izoluje regularyzatora | B: pojedyncze ablacje i stała receptura niezależna od pełnozbiorowego strojenia. |
| Wspólna skala i jednostka są warunkiem interpretacji testu | Nie łączyć surowych różnic AUC/log loss w Wilcoxonie; nie liczyć foldów jako zbiorów; ograniczyć kontrasty i kontrolować wielokrotność. |
| Pretrenowanie i metastrojenie zmieniają definicję kosztu | Rozdzielić koszt lokalny i zasoby historyczne; jawnie oznaczyć stały TabPFN. |
| Wynik ograniczony do populacji nie jest uniwersalnym rankingiem | Dyskusja i rekomendacje warunkowe, bez obowiązku konstruowania nowej architektury lub selektora. |

Szczegóły progów, bootstrapu i kontrastów w planie są propozycjami metodologicznymi, nie ustaleniami literaturowymi i nie wdrożonym kodem. Samo cytowanie artykułu o testach nie poświadcza poprawności wybranej analizy.

## 8. Kolejność dalszej lektury i luki przed pisaniem

**Najpierw:** L03, L04 i L07, aby ustalić logikę benchmarku i mechanizmów. **Następnie:** L02, L05 i L09, aby ustalić rolę MLP i receptury. **Potem:** L06 i L08 jako szerszy kontekst i ograniczenia realizmu; L10–L12 dla metryk i wnioskowania. Publikacje L13–L17 czytać przy opracowaniu odpowiednich kart metod; L01 daje mapę pojęć.

Przed napisaniem odpowiednich fragmentów pozostają:

- Pełna lektura L01 zamiast fragmentów, uzupełnienie dostępu do L16 oraz pełnego tekstu L18. L19 pozostaje źródłem pomocniczym do pełnej lektury, jeśli będzie rozwijana dyskusja kalibracji.
- Sprawdzenie załączników i implementacji wybranej receptury badania B, w tym niezerowych obu regularyzatorów. Przegląd nie rozstrzyga ich konkretnych wartości.
- Ustalenie pokrycia dwunastu zadań z danymi rozwoju/metastrojenia modeli. Znane w literaturze pokrycie części benchmarków nie dowodzi automatycznie obecności lub nieobecności każdego własnego zadania. Brak publicznej listy oznaczyć jako brak weryfikacji.
- Eksport i kontrola pełnych metadanych bibliograficznych do przyszłego repozytorium rozprawy. Wersje preprintu nie powinny przypadkowo zastąpić ostatecznych publikacji.
- Ewentualne jawne odświeżenie korpusu po 2026-10-27 i analiza zmian L17 v2–v3. Nie jest warunkiem rozpoczęcia pracy na zamrożonym, wyraźnie datowanym korpusie.
- Dane empiryczne z własnej kampanii: niniejszy przegląd nie dostarcza żadnych własnych wyników modeli, kosztów GPU ani dowodu kwalifikacji TabPFN.

### Osobna kontrola organizacyjna PW

Sprawdzono pierwotne [zarządzenie 4/2022](https://www.bip.pw.edu.pl/index.php/Wewnetrzne-akty-prawne/Dokumenty-Rektora-PW/Zarzadzenia-Rektora/2022/Zarzadzenie-nr-4-2022-Rektora-Politechniki-Warszawskiej-z-dnia-27-stycznia-2022-r) i [załącznik nr 1](https://www.bip.pw.edu.pl/index.php/content/download/52900/504782/file/4_2022_za%C5%82%201_%20Zarz_wymogi%20edytorskie_.pdf), zwłaszcza punkty 3–4. Nie poświadczono wszystkich późniejszych zmian ani bieżących wymagań konkretnego wydziału. Starsze strony jednostek odwołują się również do wcześniejszych zarządzeń; nie rozstrzygać zgodności szablonu wyłącznie na tej podstawie.

Zapytania organizacyjne obejmowały `site.pw.edu.pl Wydział Elektroniki technik informacyjnych praca dyplomowa magisterska wymagania szablon`, `site.bip.pw.edu.pl "4/2022" "edytorskich"` oraz sprawdzenie lat 2025 i 2026 zapytaniami `site.bip.pw.edu.pl "wymogów edytorskich prac dyplomowych" "2025"` i analogicznie dla `"2026"`. Informacje te dotyczą organizacji manuskryptu, nie naukowego korpusu 19 pozycji.
