CREATE IF NOT EXISTS schedule_book (
    entry_id INTEGER AUTOINCREMENT PRIMARY KEY,
    date_of_entry DATE DEFAULT (SELECT DATE('now')),
    start_of_day TIME DEFAULT (SELECT TIME('now', 'localtime')),
    