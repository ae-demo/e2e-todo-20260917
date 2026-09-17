# e2e-todo-20260917 — PRD

## Problem Statement

People jot down small tasks in scratch notes, chat threads, or sticky notes that get lost between sessions and devices. There is no lightweight, secure place to keep a personal todo list that survives a page reload and is only visible to its owner.

## Solution

A small, complete Todo web app: a user signs in once through the platform's single sign-on, then adds, views, edits, and deletes todos in a personal list that persists reliably across reloads and future visits.

## Actors

- **End User** — signs in through the platform's SSO, and can add, view, update, and delete the todos in their own personal list. No other role exists in this product.

## User Stories

1. As an End User, I want to log in through the platform's single sign-on, so that I can securely reach my personal todo list.
2. As an End User, I want to add a new todo, so that I can capture something I need to do.
3. As an End User, I want to see my list of todos, so that I know what is outstanding.
4. As an End User, I want to update a todo, so that I can correct its text or mark it done.
5. As an End User, I want to delete a todo, so that I can remove something I no longer need to track.
6. As an End User, I want my todos to still be there after I reload the page or come back later, so that I never lose my list.

## Product Decisions

- **Sign-in**: every session is authenticated end-to-end through the platform's SSO layer, backed by the Dataplane Thunder identity provider. The identity provider issuer is the development dataplane IdP (`https://development-idp.apps.wso2con.openchoreo-poc.choreo.dev`) — not the Platform Thunder instance. This is a hard product requirement carried over from the project brief, not a default.
- **Todo visibility**: each End User sees and edits only their own todos — a private personal list, not a list shared across users.
- **API protection**: the todo API sits behind the organization's development API platform gateway rather than being reachable directly; only requests carrying a valid Dataplane Thunder (T2) session succeed, and a Platform Thunder (T1) session must be rejected. This is a hard product requirement carried over from the project brief, not a default.
- **Persistence**: todos are stored in a durable, dedicated database provisioned for this project (not a shared or sample database), so data survives reloads, restarts, and future visits. This is a hard product requirement carried over from the project brief, not a default.
- **Frontend/backend integration**: the web app reaches the todo API through a single `/api` path rather than a separately hosted API origin. This is a hard product requirement carried over from the project brief, not a default.

## Out of Scope

- Sharing a todo list between users, or any collaboration/comment features.
- Reminders, due dates, notifications, or recurring todos.
- Categories, tags, search, or filtering of todos.
- Any role beyond End User (no admin console, no team management).
- Offline support or multi-device sync beyond simple reload persistence.

## Open Questions

None at this time — the project brief settled the technical shape of sign-in, persistence, and API protection, and the one product-level judgment call (private vs. shared todos) has been assumed above and can be changed at any point.

## Further Notes

The brief specifies infrastructure-level detail (a `thunder-app` ClusterResourceType for login, a `postgres-cnpg` ClusterResourceType for persistence, and the exact API gateway namespace/target) that this PRD deliberately keeps at product altitude — those specifics belong to the design and its components, not to the product requirements. They are preserved verbatim in the project brief so the design turn can pick them up.