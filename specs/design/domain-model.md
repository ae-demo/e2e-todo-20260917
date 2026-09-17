# Domain model

A single entity carries the whole product: a Todo, owned by the signed-in End User who created it.

```mermaid
erDiagram
    TODO {
        string id PK
        string ownerId
        string title
        boolean done
        string createdAt
        string updatedAt
    }
```

`ownerId` is the caller's subject from the signed-in session, never a client-supplied value — it is how each End User's todos stay private to them.