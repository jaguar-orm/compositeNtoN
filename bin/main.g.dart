// GENERATED CODE - DO NOT MODIFY BY HAND

part of many_to_many;

// **************************************************************************
// Generator: BeanGenerator
// **************************************************************************

abstract class _TodoListBean implements Bean<TodoList> {
  String get tableName => TodoList.tableName;

  final StrField id = new StrField('id');

  final IntField id1 = new IntField('id1');

  final StrField description = new StrField('description');

  TodoList fromMap(Map map) {
    TodoList model = new TodoList();

    model.id = map['id'];
    model.id1 = map['id1'];
    model.description = map['description'];

    return model;
  }

  List<SetColumn> toSetColumns(TodoList model, [bool update = false]) {
    List<SetColumn> ret = [];

    ret.add(id.set(model.id));
    ret.add(id1.set(model.id1));
    ret.add(description.set(model.description));

    return ret;
  }

  Future<Null> insert(TodoList model, {bool cascade: false}) async {
    final Insert insert = inserter.setMany(toSetColumns(model));
    await execInsert(insert);
    if (cascade) {
      TodoList newModel;
      if (model.categories != null) {
        newModel ??= await find(model.id);
        for (final child in model.categories) {
          await categoryBean.insert(child);
          await pivotBean.attach(model, child);
        }
      }
    }
  }

  Future<int> update(TodoList model,
      {bool cascade: false, bool associate: false}) async {
    final Update update =
        updater.where(this.id.eq(model.id)).setMany(toSetColumns(model));
    final ret = execUpdate(update);
    if (cascade) {
      TodoList newModel;
      if (model.categories != null) {
        for (final child in model.categories) {
          await await categoryBean.update(child);
        }
      }
    }
    return ret;
  }

  Future<TodoList> find(String id,
      {bool preload: false, bool cascade: false}) async {
    final Find find = finder.where(this.id.eq(id));
    final TodoList model = await execFindOne(find);
    if (preload) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<List<TodoList>> findWhere(Expression exp) async {
    final Find find = finder.where(exp);
    return await (await execFind(find)).toList();
  }

  Future<int> remove(String id, [bool cascade = false]) async {
    if (cascade) {
      final TodoList newModel = await find(id);
      await pivotBean.detachTodoList(newModel);
    }
    final Remove remove = remover.where(this.id.eq(id));
    return execRemove(remove);
  }

  Future<int> removeMany(List<TodoList> models) async {
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return execRemove(remove);
  }

  Future<int> removeWhere(Expression exp) async {
    return execRemove(remover.where(exp));
  }

  Future preload(TodoList model, {bool cascade: false}) async {
    model.categories = await pivotBean.fetchByTodoList(model);
  }

  Future preloadAll(List<TodoList> models, {bool cascade: false}) async {}
  PivotBean get pivotBean;

  CategoryBean get categoryBean;
}

abstract class _CategoryBean implements Bean<Category> {
  String get tableName => Category.tableName;

  final StrField id = new StrField('id');

  final IntField id1 = new IntField('id1');

  final StrField name = new StrField('name');

  Category fromMap(Map map) {
    Category model = new Category();

    model.id = map['id'];
    model.id1 = map['id1'];
    model.name = map['name'];

    return model;
  }

  List<SetColumn> toSetColumns(Category model, [bool update = false]) {
    List<SetColumn> ret = [];

    ret.add(id.set(model.id));
    ret.add(id1.set(model.id1));
    ret.add(name.set(model.name));

    return ret;
  }

  Future<Null> insert(Category model, {bool cascade: false}) async {
    final Insert insert = inserter.setMany(toSetColumns(model));
    await execInsert(insert);
    if (cascade) {
      Category newModel;
      if (model.todolists != null) {
        newModel ??= await find(model.id, model.id1);
        for (final child in model.todolists) {
          await todoListBean.insert(child);
          await pivotBean.attach(child, model);
        }
      }
    }
  }

  Future<int> update(Category model,
      {bool cascade: false, bool associate: false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .where(this.id1.eq(model.id1))
        .setMany(toSetColumns(model));
    final ret = execUpdate(update);
    if (cascade) {
      Category newModel;
      if (model.todolists != null) {
        for (final child in model.todolists) {
          await await todoListBean.update(child);
        }
      }
    }
    return ret;
  }

  Future<Category> find(String id, int id1,
      {bool preload: false, bool cascade: false}) async {
    final Find find = finder.where(this.id.eq(id)).where(this.id1.eq(id1));
    final Category model = await execFindOne(find);
    if (preload) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<List<Category>> findWhere(Expression exp) async {
    final Find find = finder.where(exp);
    return await (await execFind(find)).toList();
  }

  Future<int> remove(String id, int id1, [bool cascade = false]) async {
    if (cascade) {
      final Category newModel = await find(id, id1);
      await pivotBean.detachCategory(newModel);
    }
    final Remove remove = remover.where(this.id.eq(id)).where(this.id1.eq(id1));
    return execRemove(remove);
  }

  Future<int> removeMany(List<Category> models) async {
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id) | this.id1.eq(model.id1));
    }
    return execRemove(remove);
  }

  Future<int> removeWhere(Expression exp) async {
    return execRemove(remover.where(exp));
  }

  Future preload(Category model, {bool cascade: false}) async {
    model.todolists = await pivotBean.fetchByCategory(model);
  }

  Future preloadAll(List<Category> models, {bool cascade: false}) async {}
  PivotBean get pivotBean;

  TodoListBean get todoListBean;
}

abstract class _PivotBean implements Bean<Pivot> {
  String get tableName => Pivot.tableName;

  final StrField todolist_id = new StrField('todolist_id');

  final IntField todolist_id1 = new IntField('todolist_id1');

  final StrField category_id = new StrField('category_id');

  final IntField category_id1 = new IntField('category_id1');

  Pivot fromMap(Map map) {
    Pivot model = new Pivot();

    model.todolist_id = map['todolist_id'];
    model.todolist_id1 = map['todolist_id1'];
    model.category_id = map['category_id'];
    model.category_id1 = map['category_id1'];

    return model;
  }

  List<SetColumn> toSetColumns(Pivot model, [bool update = false]) {
    List<SetColumn> ret = [];

    ret.add(todolist_id.set(model.todolist_id));
    ret.add(todolist_id1.set(model.todolist_id1));
    ret.add(category_id.set(model.category_id));
    ret.add(category_id1.set(model.category_id1));

    return ret;
  }

  Future<dynamic> insert(Pivot model) async {
    final Insert insert = inserter.setMany(toSetColumns(model));
    return execInsert(insert);
  }

  Future<List<Pivot>> findWhere(Expression exp) async {
    final Find find = finder.where(exp);
    return await (await execFind(find)).toList();
  }

  Future<int> removeWhere(Expression exp) async {
    return execRemove(remover.where(exp));
  }

  Future<List<Pivot>> findByTodoList(String todolist_id, int todolist_id1,
      {bool preload: false, bool cascade: false}) async {
    final Find find = finder
        .where(this.todolist_id.eq(todolist_id))
        .where(this.todolist_id1.eq(todolist_id1));
    return await (await execFind(find)).toList();
  }

  Future<List<Pivot>> findByCategory(String category_id, int category_id1,
      {bool preload: false, bool cascade: false}) async {
    final Find find = finder
        .where(this.category_id.eq(category_id))
        .where(this.category_id1.eq(category_id1));
    return await (await execFind(find)).toList();
  }

  Future<int> removeByTodoList(String todolist_id, int todolist_id1) async {
    final Remove rm = remover
        .where(this.todolist_id.eq(todolist_id))
        .where(this.todolist_id1.eq(todolist_id1));
    return await execRemove(rm);
  }

  Future<int> removeByCategory(String category_id, int category_id1) async {
    final Remove rm = remover
        .where(this.category_id.eq(category_id))
        .where(this.category_id1.eq(category_id1));
    return await execRemove(rm);
  }

  Future<List<Pivot>> findByTodoListList(List<TodoList> models,
      {bool preload: false, bool cascade: false}) async {
    final Find find = finder;
    for (TodoList model in models) {
      find.or(this.todolist_id.eq(model.id) & this.todolist_id1.eq(model.id1));
    }
    return await (await execFind(find)).toList();
  }

  Future<List<Pivot>> findByCategoryList(List<Category> models,
      {bool preload: false, bool cascade: false}) async {
    final Find find = finder;
    for (Category model in models) {
      find.or(this.category_id.eq(model.id) & this.category_id1.eq(model.id1));
    }
    return await (await execFind(find)).toList();
  }

  void associateTodoList(Pivot child, TodoList parent) {
    child.todolist_id = parent.id;
    child.todolist_id1 = parent.id1;
  }

  void associateCategory(Pivot child, Category parent) {
    child.category_id = parent.id;
    child.category_id1 = parent.id1;
  }

  Future<int> detachTodoList(TodoList model) async {
    final dels = await findByTodoList(model.id, model.id1);
    await removeByTodoList(model.id, model.id1);
    final exp = new Or();
    for (final t in dels) {
      exp.or(categoryBean.id.eq(t.category_id) &
          categoryBean.id1.eq(t.category_id1));
    }
    return await categoryBean.removeWhere(exp);
  }

  Future<int> detachCategory(Category model) async {
    final dels = await findByCategory(model.id, model.id1);
    await removeByCategory(model.id, model.id1);
    final exp = new Or();
    for (final t in dels) {
      exp.or(todoListBean.id.eq(t.todolist_id) &
          todoListBean.id1.eq(t.todolist_id1));
    }
    return await todoListBean.removeWhere(exp);
  }

  Future<List<Category>> fetchByTodoList(TodoList model) async {
    final pivots = await findByTodoList(model.id, model.id1);
    final exp = new Or();
    for (final t in pivots) {
      exp.or(categoryBean.id.eq(t.category_id) &
          categoryBean.id1.eq(t.category_id1));
    }
    return await categoryBean.findWhere(exp);
  }

  Future<List<TodoList>> fetchByCategory(Category model) async {
    final pivots = await findByCategory(model.id, model.id1);
    final exp = new Or();
    for (final t in pivots) {
      exp.or(todoListBean.id.eq(t.todolist_id) &
          todoListBean.id1.eq(t.todolist_id1));
    }
    return await todoListBean.findWhere(exp);
  }

  Future<dynamic> attach(TodoList one, Category two) async {
    final ret = new Pivot();
    ret.todolist_id = one.id;
    ret.todolist_id1 = one.id1;
    ret.category_id = two.id;
    ret.category_id1 = two.id1;
    return insert(ret);
  }

  TodoListBean get todoListBean;
  CategoryBean get categoryBean;
}
