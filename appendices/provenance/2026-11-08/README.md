# Archiwum podstawy redakcji: 2026-11-08

To nieedytowane kopie czterech lokalnych materiałów z repozytorium eksperymentów. Pliki źródłowe są ignorowane przez Git; samo sklonowanie repozytorium eksperymentów ich nie odtwarza. Te kopie umieszczono w repozytorium manuskryptu jako materiały do zachowania w jego historii, bez zmiany reguł publikacji kodu.

- [Plan struktury](thesis-plan.md).
- [Rejestr literatury](literature-review.md).
- [Przekazanie sesji](session-handoff.md).
- [Datowany zapis weryfikacji](verification-2026-11-06.json).
- [Manifest pochodzenia i SHA-256](manifest.json).

Kopie są bajtowo identyczne z materiałami pobranymi 2026-11-08. Data kopiowania nie jest datą wykonania zapisanych testów. Weryfikacja z 2026-11-06 pozostaje dowodem dotyczącym swojego źródła i warunków; jej historyczne ścieżki `/tmp` nie gwarantują dostępności artefaktów. Zapisano HEAD repozytorium oraz informację o niezacommitowanych zmianach. Ignorowane dokumenty nie należą do tego commitu; ich tożsamość określają indywidualne hashe.

Archiwum nie stanowi nowego źródła decyzji o zakresie. Aktualne dokumenty tematu, metod, danych, protokołu i implementacji pozostają autorytatywne w `mgr-repo/docs/`. Lokalne materiały redakcyjne można rozwijać w ich pierwotnej lokalizacji. Tych kopii nie aktualizować ręcznie; kolejne zamrożenie wymaga nowej daty i nowego manifestu. Nie tworzyć niezależnie edytowanego protokołu w repozytorium rozprawy.

Wewnętrzne odnośniki w skopiowanych dokumentach zachowano dosłownie i odnoszą się do pierwotnego katalogu `mgr-repo/docs/`, nie do katalogu archiwum. Przy ich odczycie korzystać z pola `source` manifestu i sąsiedniego repozytorium. Handoff jest kontekstem historycznym, a nie zastępstwem aktualnego stanu implementacji.

Pliki są przygotowane do kontroli wersji, lecz ta korekta nie wykonuje commitu ani publikacji. Przed przekazaniem pracy należy zachować je w uzgodnionej wersji repozytorium. Nie zarchiwizowano tu całych wyników, danych ani wag.

Sprawdzenie kopii, uruchomione z tego katalogu:

```bash
python3 - <<'PY'
from pathlib import Path
import hashlib, json
for item in json.loads(Path('manifest.json').read_text())['files']:
    data = Path(item['snapshot']).read_bytes()
    assert len(data) == item['bytes']
    assert hashlib.sha256(data).hexdigest() == item['sha256']
print('SHA-256: OK')
PY
```
