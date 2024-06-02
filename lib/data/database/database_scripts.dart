class DatabaseScripts {
  static const createCostTable =
  ''' create table if not exists cost (
        id integer primary key autoincrement,
        created_at text not null,
        price integer not null,
        description text default 'Пусто',
        category_id integer not null,
        constraint cost_category_fk foreign key (category_id) references category (id) on delete cascade
      )
  ''';

  static const createCategoryTable =
  ''' create table if not exists category (
        id integer primary key autoincrement,
        name text not null unique,
        description text not null,
        color text not null
      )
  ''';

  static const createTargetTable =
  ''' create table if not exists target (
        id integer primary key autoincrement,
        price real not null,
        name text not null unique,
        description text not null,
        priority integer not null,
        first_date text not null,
        last_date text not null,
        progress real default 0,
        category_id integer not null,
        constraint target_category_fk foreign key (category_id) references category (id) on delete cascade
      )
  ''';

  static const createSavingTable =
  ''' create table if not exists saving (
        id integer primary key autoincrement,
        created_at text not null,
        price real not null,
        target_id integer not null,
        constraint saving_target_fk foreign key (target_id) references target (id) on delete cascade
      )
  ''';
}