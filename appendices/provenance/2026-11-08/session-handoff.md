# Session handoff: accepted study and current platform

Updated 2026-11-06. The main comparison runner is implemented and has CPU integration evidence. The complete thesis experiment campaign is not yet qualified or executed. Read the [index](README.md) for document ownership; use the [implementation plan](../plan.md) for remaining work.

## Manuscript alignment follow-up: 2026-11-08

The [manuscript evidence report](../../mgr-thesis/appendices/alignment-review-2026-11-08.md) rechecked the five review findings against local and installed upstream code. Chapters 4–6 and the figure guide now delimit local prediction batching, fit-only memory tracking, reporter checks and the ensemble-selection budget versus its retained prefix. The local thesis plan reflects the existing manuscript. [Read-only snapshots](../../mgr-thesis/appendices/provenance/2026-11-08/README.md) preserve ignored planning/literature/handoff/verification files with SHA-256; accepted scope remains here. No experiment code or parameters changed. Native LuaLaTeX/Biber now compiles the 47-page draft, with unresolved typography warnings (missing Polish hyphenation, eight overfull boxes and csquotes advice); no final PW compliance is claimed. No commit or publication was performed.

## Frozen scope

Manuscript update, 2026-11-06: the [detailed Polish outline](thesis-plan.md) specifies eight chapters, section purposes, five research questions, evidence requirements, tables/figures, writing gates and a proposed analysis. The accompanying [literature review](literature-review.md) records 19 references, inspected versions and access limits. Proposed contrasts, threshold rules and uncertainty methods remain to be frozen before final evaluation; they are not implemented changes to the accepted protocol. The separate manuscript repository now exists at `../mgr-thesis/`. Its [README](../../mgr-thesis/README.md) records Polish drafts of chapters 1–5, explicitly empty result skeletons for 6–7, 20 tables including result forms, 24 bibliography entries, and 12 figure placeholders. The [figure preparation/insertion guide](../../mgr-thesis/figures/README.md) distinguishes six diagrams that can be prepared now from six plots requiring actual results and documented provenance. Chapter 8 remains empty and is not included in `main.tex`. Chapters 1–3 and the bibliography were preserved. A 47-page simplified preview checked content, citations and table/placeholder layout; the native LuaLaTeX/Biber build remains unqualified because font loading fails and Biber is absent. Chapters 4–5 explicitly retain pending audits, worker qualification, targeted-study settings and analysis freeze. No final PW template or scientific experiment results are claimed.

The [original topic](thesis-topic.md) requires literature-based neural classification, difficult tabular tasks, conventional comparisons, rare-class sensitivity and resistance to overfitting. Active learning is optional.

- **DL:** MLP, TabNet, FT-Transformer, RealMLP, ModernNCA, TabM, fixed local TabPFN-3.5.
- **Conventional:** logistic regression, KNN, XGBoost, CatBoost.
- **Datasets:** Adult, Covertype, Credit Fraud, HIGGS subset, Amazon Employee Access, Santander Customer Satisfaction, Online Shoppers, Diabetes 130-US, Helena, German Credit, Ionosphere, Bioresponse.
- **Main evaluation:** one outer split, eight inner folds, one default plus 25 random configurations per tunable method. Report default, tuned and tuned-plus-ensemble from cached predictions. No extra final refit.
- **Required targeted studies:** rare-class weighting and matched MLP regularization/training-size effects. Their accepted designs and counts are in the [evaluation plan](tabarena-evaluation.md#required-targeted-studies); their runners are not implemented.

The twelve sources replace the earlier sixteen-task target. German Credit replaces binarized California Housing, Ionosphere replaces Bank Marketing, and Bioresponse replaces Jannis. Excluded algorithms and old datasets are not pending integrations. Papers, first-publication dates and the accepted literature cutoff remain in [model selection](study-model-selection.md); paper dates are not software release dates.

## What runs now

Use Python 3.11, Linux x86-64 and the frozen environment. Bootstrap requires `uv` already installed. For a development machine without working CUDA:

```bash
bash scripts/bootstrap.sh --set runtime.device=cpu
uv run --frozen thesis --set runtime.device=cpu --set runtime.num_cpus=1 smoke
```

With the default fold setting, smoke creates 180 synthetic rows with four numeric and one categorical feature. It runs logistic regression and a shortened MLP: default plus one random configuration, eight folds, four jobs, 32 fold fits and six report rows. It downloads no datasets or pretrained weights. It still requires the complete dependency environment. The MLP uses two epochs; its sampled configuration can replace the default hidden dimensions. Smoke replaces all model overrides with its preset but retains fold count, seeds, runtime and paths.

The command prints `results/runs/smoke/STUDY_HASH`. Repeating identical settings resumes completed work. Rebuild reports without training using the actual printed directory:

```bash
uv run --frozen thesis report results/runs/smoke/STUDY_HASH
```

`STUDY_HASH` is a placeholder, not a literal existing directory. For the full-worker sequence and real-data pilot, follow [setup](setup.md). Default configuration requests CUDA; conventional methods remain on CPU. CUDA requests perform a real allocation/kernel check and fail explicitly if unavailable. The 2026-11-06 verification host failed that check; actual GPU training/timing qualification remains open.

`thesis plan` resolves configuration and prints nominal counts. It does not download data, test model feasibility, fetch weights or materialize every random candidate. `doctor` checks the selected device and imports core dependencies; it does not qualify every model/dataset pairing.

## Architecture and ownership

| Layer | Source | Responsibility |
| --- | --- | --- |
| Typed configuration | [configuration.py](../src/tabular_thesis/experiments/configuration.py), `configs/` | Structured OmegaConf dataclasses, validation, defaults, overrides and snapshots. No Hydra execution or network server. |
| Methods and search | [catalog.py](../src/tabular_thesis/experiments/catalog.py), [specification.py](../src/tabular_thesis/models/specification.py) | All eleven method capabilities/classes and seeded random candidates. |
| Data and outer splits | [tasks.py](../src/tabular_thesis/data/tasks.py) | Source parsing, verified cache, class mapping, raw task features, outer row/group identities. |
| Training backend | [backend.py](../src/tabular_thesis/experiments/backend.py) | Local TabArena/AutoGluon execution, inner validation, OOF/test probabilities and metadata. |
| Model bridges | [tabarena_models.py](../src/tabular_thesis/experiments/tabarena_models.py), [upstream_models.py](../src/tabular_thesis/experiments/upstream_models.py), [tabpfn_model.py](../src/tabular_thesis/experiments/tabpfn_model.py) | Common AutoGluon interface over local OOP wrappers, native methods and fixed foundation inference. |
| Resources | [runtime.py](../src/tabular_thesis/experiments/runtime.py) | Device validation, CPU thread limits, caches and fit context. |
| Jobs and persistence | [runner.py](../src/tabular_thesis/experiments/runner.py), [artifacts.py](../src/tabular_thesis/experiments/artifacts.py) | Identities, exclusive locks, attempts, atomic records, completion verification and compatible resume. |
| Reports | [reporting.py](../src/tabular_thesis/experiments/reporting.py), [metrics.py](../src/tabular_thesis/evaluation/metrics.py) | OOF selection, greedy ensembles, validated metrics, JSON/CSV regeneration. |
| Command entry | [cli.py](../src/tabular_thesis/experiments/cli.py) | `doctor`, `prepare`, `weights`, `plan`, `run`, `smoke`, `report DIRECTORY`. |

This repository executes the study locally using pinned libraries. Evaluation is not outsourced to a remote TabArena service. This is a custom twelve-task adaptation, not the official 51-task benchmark.

`models/registry.py` contains seven local `BaseModel` wrappers, including a direct KNN wrapper. It is not the complete study registry. The main backend uses six local bridges (MLP, TabNet, FT, LR, XGBoost, CatBoost), four native paths (KNN, RealMLP, ModernNCA, TabM), and fixed TabPFN. Legacy loader/preprocessor/splitter modules support direct compatibility workflows; their 60/20/20 defaults do not control the main protocol. The old holdout/TPE trainer was retired. `evaluation/statistical.py` and visualization helpers are not an automated final analysis pipeline.

## Parameters and reproducibility

Global CLI options precede the subcommand. Repeat `--set KEY=VALUE`; use `--config-dir DIRECTORY` for an alternate YAML tree. The default study uses CUDA, four CPU threads, a provisional 3,600-second budget per configuration and local prediction batch limit 4,096 (MLP/FT/TabNet; native models and TabPFN use their own policies). Folds and configurations execute sequentially. The native time limit is advisory, not a hard process deadline.

Local six-method spaces come from model YAML. Native KNN/RealMLP/ModernNCA/TabM spaces come from pinned TabArena generators; their YAML `search_space` is ignored even if populated, and an empty mapping does not mean no tuning. For the local six methods, sampled parameters overwrite same-key defaults, including `model_overrides`; nonsearched overrides remain fixed. For the native four, configured parameters are applied after sampling and remain fixed; KNN removes overridden keys from its sampled space. Inspect the catalog before assuming an override freezes a searched parameter for every method.

Outer/model seed and search seed default to 42. Native inner split seeds are library-owned and recorded, not universally 42. TabPFN uses fixed inference seed 0 and eight estimators. Changing `outer_seed` changes both the outer partition and model initialization. Independent paired training seeds for the targeted studies still need implementation. The ModernNCA seed compatibility shim temporarily patches a factory and assumes sequential in-process fits; revisit it before adding threads.

Important dependency pins: TabArena 0.1.0, AutoGluon core/tabular 1.6.3b20260918, PyTorch 2.13.0, `pytabkit` 1.8.0, `rtdl-revisiting-models` 0.0.2, `pytorch-tabnet` 4.1.0, `tabm` 0.0.3, `tabpfn` 9.2.0. ModernNCA is TabArena's TALENT-derived implementation, not a direct TALENT installation. The exact checkpoint revision, filename and hash are in [setup](setup.md#prepare-the-foundation-checkpoint). Keep `uv.lock`; do not upgrade packages incidentally.

## Evaluation exceptions and current outputs

Ordinary methods share the first split of a stratified three-fold outer partition, approximately two-thirds development and one-third test. Diabetes uses patient-disjoint `StratifiedGroupKFold` at the outer level and group-constrained inner folds. Automatic upstream tiny-data 5×5 repetition is disabled. Actual validation rows are saved and checked.

IID KNN uses optimized child LOO. Preprocessing sees the full outer development feature population; each row's label is excluded from its neighbor prediction. This is not exact per-row preprocessing refitting. Diabetes KNN uses eight group folds. Nominal KNN inputs use fixed one-hot encoding; native budget-driven neighbor-bank subsampling and effective neighbor counts are recorded. Fixed TabPFN uses the full outer development context, without HPO, eight-fold training, or invented tuned conditions.

Binary ROC AUC and multiclass log loss drive selection. Reports also include accuracy, balanced accuracy, macro/weighted F1, log loss, AUC, average precision and per-class metrics/confusion matrices where defined. The report key `log_loss_val` holds an outer-test metric despite its inherited name. Binary aggregate AP uses encoded class 1; select the declared rare outcome explicitly from `per_class` when it differs. Main hard decisions use `argmax`. Threshold optimization, calibration experiments, confidence intervals, significance tests, Elo and thesis plots are not implemented by the reporting CLI.

The default matrix is **3,132 configuration jobs**, **132 task/method pairings**, **372 applicable report rows**, and **14,976 neural fold fits**, excluding fixed TabPFN inference. These are nominal counts, not runtime measurements. Required targeted studies add 936 neural and 144 CPU fold fits. See the evaluation plan for conditional GPU-hour arithmetic; no target-GPU forecast has been measured.

## Data, artifacts and recovery

`run` requires prepared caches and selected weights; use `prepare` and `weights` beforehand. Seven OpenML definitions pin dataset IDs and versions. Four UCI routes fetch live archives; YAML `version: 1` does not pin an immutable upstream archive. Santander requires the official local training CSV. Prepared caches live at `data/prepared/NAME/{data.parquet,manifest.json}` with normalized-file hashes. Source locks and atomic writes prevent partial cache acceptance. Freeze `expected_sha256` or copy verified caches before final execution. A successful preparation/schema preflight is not a scientific raw-data audit.

Diabetes removes encounter/patient identifiers from predictors and retains patient groups for splitting. Class labels are sorted/encoded and recorded; a rare raw outcome need not map to class 1. Setting a dataset `time` field currently raises `NotImplementedError`; temporal splitting is not implemented. Do not silently use IID splits for a temporal prediction claim.

Study directories have this layout:

```text
results/runs/STUDY/STUDY_HASH/
  manifest.json, index.json
  splits/DATASET.json
  jobs/DATASET-MODEL-000/
    manifest.json, status.json
    attempts/UUID.json
    records/result.json
    predictions/result.npz
    failure.json                 # if an attempt failed
  report.json, report.csv         # derived
  failures.json                   # if configurations failed
```

Predictions retain aligned ground truth, OOF/test probabilities, row IDs and inner validation identities; fixed TabPFN has no OOF block. Fitted model files are removed after each attempt. Rebuilding reports needs no fitted models, but recovery of an unfinished configuration retrains that entire configuration. There is no per-fold checkpoint resume or automatic reuse across changed study identities.

Study identity includes resolved settings/paths, data manifests, source/lock digest, selected package versions and recorded hardware. Git commit and container image digest are not captured automatically; freeze them separately. Documentation, tests and deployment scripts are outside the executable source digest. Attempt history retains failures and interruption evidence. Completed records/predictions are checksum-verified before skipping.

Any configuration failure makes `run` exit nonzero after attempting independent work. Automatic reporting occurs only on successful completion of `run`. Manual reporting can handle explicitly failed random configurations once all jobs were attempted; failed defaults or incomplete jobs prevent a complete report. Timing includes model preprocessing within fit, one probability prediction pass and recorded native warm-up where available. There is no universal separate preprocessing timer or final-refit stage; final cleanup is outside attempt wall time.

## Qualification and next actions

[Saved evidence](verification-2026-11-06.json) records 71 passing tests, Ruff/format checks, standalone wheel/config checks, a shortened Ionosphere LR/MLP pilot with verified resume, four prepared UCI routes, and actual eight-fold patient isolation on Diabetes. This demonstrates infrastructure and interfaces, not final performance or universal model feasibility. Its temporary artifact paths are historical.

Remaining gates, in order:

1. Audit all twelve sources for identity, duplicates, leakage, feature timing, groups, sentinels and cohort rules. Freeze hashes and prediction populations.
2. Qualify a real GPU worker and actual pinned TabPFN access/inference. Pilot the 100-class, wide, high-cardinality and large-context paths; measure runtime, memory and storage. The Docker candidate has not run here.
3. Implement the two targeted runners with fold-local weights, fixed matched controls, independent paired training seeds, nested training-only subsets, learning curves and frozen threshold rules. The current MLP is a declared local baseline, not the separately required published overfitting recipe.
4. Freeze primary contrasts, multiplicity, effect sizes and uncertainty. Twelve selected datasets support a bounded thesis; they do not guarantee statistical power or universal superiority.
5. Commit/push the reviewed implementation, record source/image/input/checkpoint identities and measured budgets, then execute the campaign. The experiment implementation and public docs are tracked. Local plans, handoffs, archives and verification snapshots remain ignored by `.gitignore` and are not included in a clone.

No distributed scheduler, multiworker merger, network parameter server, additional foundation model or expanded dataset pool is required for this thesis.
