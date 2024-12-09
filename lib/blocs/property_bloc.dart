import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/api_service.dart';
import 'property_event.dart';
import 'property_state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final ApiService apiService;

  PropertyBloc({required this.apiService}) : super(PropertyInitial()) {
    // Register the event handler for `LoadProperties`
    on<LoadProperties>((event, emit) async {
      emit(PropertyLoading());
      try {
        final properties = await apiService.fetchProperties();
        emit(PropertyLoaded(properties));
      } catch (e) {
        emit(PropertyError(e.toString()));
      }
    });

    // Handle AddProperty events
    on<AddProperty>((event, emit) async {
      try {
        await apiService.addProperty(event.property);
        add(LoadProperties()); // Trigger reload of the list after addition
      } catch (e) {
        emit(PropertyError(e.toString()));
      }
    });

    // Handle DeleteProperty events
    on<DeleteProperty>((event, emit) async {
      try {
        await apiService.deleteProperty(event.id);
        add(LoadProperties()); // Trigger reload of the list after deletion
      } catch (e) {
        emit(PropertyError(e.toString()));
      }
    });
  }
}
