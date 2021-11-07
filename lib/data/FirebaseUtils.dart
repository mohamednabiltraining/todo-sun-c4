import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_sun_c4/data/Todo.dart';

extension MyDateExtension on DateTime {
  DateTime getDateOnly() {
    return DateTime(this.year, this.month, this.day);
  }
}

CollectionReference<Todo> getTodosRefWithConverter() {
  return FirebaseFirestore.instance
      .collection(Todo.collectionName)
      .withConverter<Todo>(
        fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
        toFirestore: (todo, _) => todo.toJson(),
      );
}

Future<void> addTodoToFirebase(String title, String desc, DateTime time) {
  DocumentReference<Todo> docRef = getTodosRefWithConverter().doc();
  Todo todo = Todo(
      id: docRef.id,
      title: title,
      description: desc,
      dateTime: time.getDateOnly());
  return docRef.set(todo);
}

Future<void> deleteTask(Todo item) {
  DocumentReference<Todo> ref = getTodosRefWithConverter().doc(item.id);
  return ref.delete();
}
