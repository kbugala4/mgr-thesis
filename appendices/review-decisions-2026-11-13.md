# Rozstrzygnięcia redakcyjne po dwóch przeglądach

Podstawa: `plan-rozdziary345.md`, `zmiany-2-updates.md` oraz lokalne źródła w `../mgr-repo`. Notatka nie zastępuje protokołu badania.

## Wprowadzone

- Credit Card Fraud: 29 predyktorów i wyłączenie Time według konfiguracji oraz commitu 79299f5.
- Wybór epoki: MLP/FT według straty, TabNet według AUC lub log loss; cierpliwość 10.
- AP rzadkiej klasy: wskazano istniejący zapis per_class, bez przypisywania klasie rzadkiej stałego kodu 1.
- Wersje scikit-learn, XGBoost i CatBoost odczytano z uv.lock; nie są dowodem środowiska zdalnego wykonania.
- Przeniesiono progi partii i korekty pamięci do rozdziału 5; zachowano zasadę strojenia w metodyce.
- Usunięto uwagi o postępie prac ze składanego tekstu. Komentarze TODO(D1–D4) wskazują rzeczywiste braki projektu, nie wykonane decyzje.
- Dodano autorskie schematy LaTeX zamiast pięciu zaślepek i tabelę zakresu pomiarów pamięci.

## Decyzje wymagające protokołu lub dowodów

1. D1–D4: receptura MLP, epoki lub kroki, ziarna i reguła progu. RealMLP-TD pozostaje kandydatem, nie wyborem. W pytabkit zanik jest stosowany oddzielnie od kroku Adama; szczegóły implementacji obejmują czynniki zależne od parametrów.
2. D6: plan inferencji nie został zamrożony. Tabela z planu opisuje progi odrzucenia, nie moc testu. Warunek 11/12 dotyczy pierwszego kroku Holma bez remisów.
3. D8: deklarowane limity checkpointu nie zastępują testu czasu i pamięci na największych zadaniach.
4. D10: identyczne cechy nie dowodzą tożsamości transakcji. Zasady duplikatów wymagają definicji grup, rozróżnienia zgodności etykiet i decyzji przed analizą.
5. Liczby danych i stany zdalnej kampanii z `zmiany-2-updates.md` nie zostały odtworzone lokalnie. Przed przeniesieniem do tabel potrzebne są pełne identyfikatory przebiegów, hashe danych, skrypt audytu i definicje liczników. Dokument wymienia osiem zakończonych zbiorów, ale lista zawiera siedem.
6. Należy wyznaczyć obowiązujące przebiegi każdej pary zbiór–metoda. Czasy tylko udanych prób i mieszane rewizje nie stanowią jeszcze spójnego porównania kosztu.
7. Współdzielenie GPU wpływa również na zakres treningu w budżecie czasowym. Kontrolny pomiar inferencji nie naprawia automatycznie porównania jakości uzyskanej przy różnym obciążeniu.
8. Nie przypisano poprawy niezawodności samemu doborowi partii: równolegle zmieniono obsługę zakończenia budżetowego.
9. D7: nie zmieniono konfiguracji CatBoost dla ułatwienia opisu. Tryb należy potwierdzić dla przypiętej wersji.
10. Pełny rejestr przestrzeni strojenia należy odtworzyć z konfiguracji i generatorów bibliotek, z uwzględnieniem nadpisań. Nie należy zastępować go samymi plikami YAML metod natywnych.

Wyniki jakości, czasy i liczby wykonanych prób należą do rozdziału wynikowego po kontroli pochodzenia. Nie wprowadzono nowych wyników na podstawie samego raportu recenzenta. Archiwum pochodzenia pozostaje niezmienione.
