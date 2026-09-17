screen TodoList "The signed-in End User's personal todo list"
  navbar "Todo App"
  sidebar "My Todos -> TodoList | Sign out"
  heading "My Todos"
  row
    input "What needs doing?"
    right
    button "Add" primary // adds the todo in place, list refreshes below
  table "Done | Title | Updated"
    row "☐ | Buy groceries | 2 min ago"
    row "☑ | Write report | yesterday"

flow "Manage todos"
  role "EndUser"
  description "An End User adds a todo and sees it persist after reload"
  TodoList
