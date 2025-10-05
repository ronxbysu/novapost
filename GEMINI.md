GEMINI.md
=========

**Source:** generated from `output.md`.

* * * * *

Purpose
=======

This document tells the Gemini agent (or any automated code assistant) how to inspect, navigate, and safely modify the `novapost` repository (contents extracted into `output.md`). It's a concise playbook for automated editing, PR creation, testing, and reporting when the user asks for code changes, bug fixes, or explanations.

* * * * *

Quick developer commands
========================

-   Install deps: `flutter pub get`

-   Static analysis: `flutter analyze`

-   Format code: `flutter format .`

-   Run tests: `flutter test`

-   Run app: `flutter run`

-   Run a single test: `flutter test test/parcels/bloc/parcels_bloc_test.dart`

* * * * *

Project overview (high level)
=============================

Root contains `lib/`, `packages/`, and `test/`. Main areas:

-   `lib/` --- Flutter app source (UI, BLoC, widgets).

-   `packages/` --- local Dart packages (repositories: `account_repository`, `delivery_repository`, `parcel_repository`, `profile_repository`).

-   `test/` --- unit and widget tests.

See `output.md` for the full tree and file contents.

* * * * *

Key files & responsibilities
============================

-   `lib/main.dart` --- app entry, providers and app wiring (repositories, providers, root widget).

-   `lib/home/home_page.dart` --- home UI, parcels list and navigation to parcel creation.

-   `lib/parcels/create_parcel_page.dart` --- parcel creation form and map-based address selector.

-   `lib/parcels/bloc/parcels_bloc.dart` --- parcels BLoC; note `getParcelList("") // TODO: put user id here`.

-   `lib/delivery/bloc/delivery_bloc.dart` --- delivery BLoC (currently `extends Bloc` **with** `ChangeNotifier`).

-   `lib/login_page.dart` --- Telegram login + polling logic.

-   `packages/*/src/*` --- repository implementations (HTTP calls + models). Many repository files contain inverted HTTP status checks and some unimplemented TODOs.

* * * * *

Known issues & TODOs (summary)
==============================

These are the most important, low-risk/high-impact fixes to prioritize:

1.  **Inverted HTTP status checks** --- several repository methods use `if (response.statusCode != 200 || response.statusCode != 201)` which is always true; should be `if (response.statusCode == 200 || response.statusCode == 201)` or better `if (response.statusCode >= 200 && response.statusCode < 300)`. Fix in `packages/*/src/*` (delivery/parcel/profile/account repositories).

2.  **Hardcoded / missing user id in ParcelsBloc** --- `parcelRepository.getParcelList("") // TODO: put user id here` --- needs plumbing of current user id via auth/account repository.

3.  **DeliveryBloc mixes patterns** --- class declared as `extends Bloc<...> with ChangeNotifier`. Decide one pattern (Bloc or ChangeNotifier) and remove the other to avoid lifecycle & duplication issues. `lib/delivery/bloc/delivery_bloc.dart`.

4.  **Login polling timer logic** --- `login_page.dart` uses `Timer.periodic` and cancels it inside the periodic callback in both success and failure branches (potential premature cancel or missed cleanup). Confirm intended flow and ensure timers are always cancelled on dispose.

5.  **Unimplemented repository methods** --- several repositories (parcel, account, etc.) have `// TODO` or `throw UnimplementedError()` for functions like `getParcelList`, `fetchAccount`, `addProfile`, `setActiveProfile`. Implement or mock for tests.

6.  **Model JSON mapping** --- some `.fromJson` and `toJson` implementations may be incomplete (e.g., lists of nested models assigned directly), verify that nested lists are parsed into model objects (Parcel/Delivery/Profile).

* * * * *

Rules for the Gemini agent (how to act)
=======================================

When asked to modify the repo, follow these rules strictly:

1.  **Read before writing**: Open and cite the exact file(s) you modify. Include file paths and brief reason for change. Use `output.md` as canonical snapshot.

2.  **Small focused PRs**: Each PR should change one responsibility (fix a bug, add a test, implement one TODO). Keep diffs minimal.

3.  **Test-first mindset**: Add or update unit tests for the behavior you change. Prefer `flutter test`-able tests.

4.  **Safe edits only**: Avoid large architecture rewrites without explicit user approval. If a bigger refactor is needed, propose it first.

5.  **CI & local checks**: After edits, run `flutter analyze` and `flutter test` locally (or instruct the user to run them) and report results.

6.  **Document changes**: Every commit/PR must include a short description, rationale, and testing steps. Use the PR template below.

7.  **Handle secrets & URLs**: Do not hardcode real endpoints or secrets. Use configuration variables (`baseUrl`, env) as in `main.dart`.

* * * * *

Suggested immediate tasks (prioritized)
=======================================

1.  Fix inverted HTTP status checks across repository implementations (low risk, high impact).

2.  Replace `getParcelList("")` with a `userId` parameter fed from auth/account flow (add TODO test if full auth plumbing is not present).

3.  Decide and fix `DeliveryBloc` pattern (remove `with ChangeNotifier` or refactor to ChangeNotifier). Add unit test for create/load delivery flows.

4.  Tighten login polling: ensure `Timer` is properly canceled on success, failure, and widget dispose. Add widget test for the login flow if feasible.

* * * * *

Example PR template (use for commits/PRs)
=========================================

**Title:** `fix: <short description>`\
**Description:**

-   **What:** Short summary of the change and why.

-   **Files changed:** List file paths.

-   **Tests:** List added/updated tests and how to run them.

-   **How to verify:** Steps and expected results (e.g., `flutter test`, `flutter analyze`).

-   **Notes:** Any follow-ups or known limitations.

* * * * *

When the user asks for help
===========================

-   **Fix code:** create a patch (diff) + tests + PR description. Provide `git format-patch`/`git diff` snippet or apply patch file.

-   **Explain code:** point to exact file and line snippets from `output.md`, explain behavior and suggested changes.

-   **Refactor:** propose a plan and incremental PRs. Do not refactor automatically.

-   **Run tests locally:** offer commands and interpret failing traces; include likely fixes.

* * * * *
