abstract class PropertyEvent {}

class LoadProperties extends PropertyEvent {}

class AddProperty extends PropertyEvent {
  final Map<String, dynamic> property;
  AddProperty(this.property);
}

class DeleteProperty extends PropertyEvent {
  final int id;
  DeleteProperty(this.id);
}
