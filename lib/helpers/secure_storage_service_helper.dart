import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riders_app/data/models/car_model.dart';
import 'package:riders_app/data/models/complain_model.dart';
import 'package:riders_app/data/models/transport_type_model.dart';
import 'package:riders_app/values/assets/transport_assets.dart';

abstract class _Keys {
  static const name = 'name';
  static const phoneNumber = 'phone_number';
  static const email = 'email';
  static const password = 'password';
  static const gender = 'gender';
  static const isOnboarded = 'is_onboarded';
  static const carDetails = 'car_details';
  static const transportDetails = 'transport_details';
  static const complainDetails = 'complain_details';
}

class SecureStorageServiceHelper {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> setname({required String name}) async =>
      await write(key: _Keys.name, value: name);

  Future<void> setPhoneNumber({required String phoneNumber}) async =>
      await write(key: _Keys.phoneNumber, value: phoneNumber);

  Future<void> setEmail({required String email}) async =>
      await write(key: _Keys.email, value: email);

  Future<void> setPassword({required String password}) async =>
      await write(key: _Keys.password, value: password);

  Future<void> setIsOnboarded({required bool isOnboarded}) async =>
      await write(key: _Keys.isOnboarded, value: isOnboarded.toString());

  Future<void> setGender({required String gender}) async =>
      await write(key: _Keys.gender, value: gender);

  Future<String?> get name async => await read(key: _Keys.name);

  Future<String?> get phoneNumber async => await read(key: _Keys.phoneNumber);

  Future<String?> get email async => await read(key: _Keys.email);

  Future<String?> get password async => await read(key: _Keys.password);

  Future<String?> get gender async => await read(key: _Keys.gender);

  Future<bool> get isOnboarded async {
    final isOnboarded = await read(key: _Keys.isOnboarded);
    return isOnboarded == 'true';
  }

  Future<void> clearAll() async {
    await delete(key: _Keys.name);
    await delete(key: _Keys.phoneNumber);
    await delete(key: _Keys.email);
    await delete(key: _Keys.password);
    await delete(key: _Keys.gender);
  }

  Future<void> saveUserDetails({
    required String name,
    required String phoneNumber,
    required String email,
    required String gender,
  }) async {
    await setname(name: name);
    await setPhoneNumber(phoneNumber: phoneNumber);
    await setEmail(email: email);
    await setGender(gender: gender);
  }

  Future<void> write({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> delete({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> saveCarDetails() async {
    final List<CarModel> availableCars = [
      const CarModel(
        name: 'Toyota Corolla',
        color: 'Black',
        fuelType: 'Petrol',
        gearType: 'Automatic',
        model: '2021',
        capacity: '1500cc',
        maxPower: '97bhp',
        fuel: '17.8kmpl',
        maxSpeed: '180kmph',
        speed60Mph: '10.5sec',
        numberOfSeats: 5,
        imageUrls: [
          TransportAssets.availableCar,
          TransportAssets.availableCar2,
        ],
        rate: '4.9',
        reviews: '1000',
        pricePerHours: '\$200',
        tax: '10%',
      ),
      const CarModel(
        name: 'Toyota Corolla',
        color: 'Black',
        fuelType: 'Petrol',
        gearType: 'Automatic',
        model: '2021',
        capacity: '1500cc',
        maxPower: '97bhp',
        fuel: '17.8kmpl',
        maxSpeed: '180kmph',
        speed60Mph: '10.5sec',
        numberOfSeats: 5,
        imageUrls: [
          TransportAssets.availableCar,
          TransportAssets.availableCar2,
        ],
        rate: '4.9',
        reviews: '1000',
        pricePerHours: '\$200',
        tax: '10%',
      ),
      const CarModel(
        name: 'Toyota Corolla',
        color: 'Black',
        fuelType: 'Petrol',
        gearType: 'Automatic',
        model: '2021',
        capacity: '1500cc',
        maxPower: '97bhp',
        fuel: '17.8kmpl',
        maxSpeed: '180kmph',
        speed60Mph: '10.5sec',
        numberOfSeats: 5,
        imageUrls: [
          TransportAssets.availableCar,
          TransportAssets.availableCar2,
        ],
        rate: '4.9',
        reviews: '1000',
        pricePerHours: '\$200',
        tax: '10%',
      ),
    ];

    final String carDetailsJson = jsonEncode(availableCars);

    await write(
      key: _Keys.carDetails,
      value: carDetailsJson,
    );
  }

  Future<void> saveTransportDetails() async {
    final List<TransportTypeModel> transportTypes = [
      const TransportTypeModel(
        label: 'Car',
        icon: TransportAssets.car,
      ),
      const TransportTypeModel(
        label: 'Bike',
        icon: TransportAssets.bike,
      ),
      const TransportTypeModel(
        label: 'Cycle',
        icon: TransportAssets.cycle,
      ),
      const TransportTypeModel(
        label: 'Taxi',
        icon: TransportAssets.taxi,
      ),
    ];
    final String transportDetails = jsonEncode(transportTypes);

    await write(
      key: _Keys.transportDetails,
      value: transportDetails,
    );
  }

  Future<List<CarModel>> getCarDetails() async {
    final String? carDetailsJson = await read(key: _Keys.carDetails);
    if (carDetailsJson != null) {
      final List<dynamic> carListDynamic = jsonDecode(carDetailsJson);
      final List<CarModel> carList =
          carListDynamic.map((item) => CarModel.fromJson(item)).toList();
      return carList;
    }
    return [];
  }

  Future<List<TransportTypeModel>> getTransportTypes() async {
    final String? transportTypesJson = await read(key: _Keys.transportDetails);

    if (transportTypesJson != null) {
      final List<dynamic> transportTypesDynamic =
          jsonDecode(transportTypesJson);

      final List<TransportTypeModel> transportList = transportTypesDynamic
          .map((item) => TransportTypeModel.fromJson(item))
          .toList();

      return transportList;
    }
    return [];
  }

  Future<void> saveComplaint(ComplainModel complain) async {
    List<ComplainModel> complains = await getComplaints();
    complains.add(complain);
    final String complaintsJson =
        jsonEncode(complains.map((e) => e.toJson()).toList());
    await write(key: _Keys.complainDetails, value: complaintsJson);
  }

  // Method to retrieve all complaints
  Future<List<ComplainModel>> getComplaints() async {
    final String? complaintsJson = await read(key: _Keys.complainDetails);
    if (complaintsJson != null) {
      final List<dynamic> complaintsListDynamic = jsonDecode(complaintsJson);
      final List<ComplainModel> complaintsList = complaintsListDynamic
          .map((item) => ComplainModel.fromJson(item))
          .toList();
      return complaintsList;
    }
    return [];
  }

  Future<void> updateComplain({
    required int id,
    required ComplainModel updatedComplaint,
  }) async {
    // Read the existing complaints from storage
    final String? complainsJson = await read(key: _Keys.complainDetails);

    if (complainsJson != null) {
      // Decode the stored complaints into a list of dynamic objects
      final List<dynamic> complainsListDynamic = jsonDecode(complainsJson);
      final List<ComplainModel> complainsList = complainsListDynamic
          .map((item) => ComplainModel.fromJson(item))
          .toList();

      // Find the index of the complaint to update
      final int indexToUpdate =
          complainsList.indexWhere((complain) => complain.id == id);

      if (indexToUpdate != -1) {
        // Replace the old complaint with the updated one
        complainsList[indexToUpdate] = updatedComplaint;

        // Encode the updated list back to JSON
        final String updatedComplainsJson = jsonEncode(
          complainsList.map((complain) => complain.toJson()).toList(),
        );

        // Write the updated JSON back to storage
        await write(key: _Keys.complainDetails, value: updatedComplainsJson);
      } else {
        throw Exception('Complaint with ID: $id not found.');
      }
    } else {
      throw Exception('No complaints found in storage.');
    }
  }

  // Method to delete a specific complaint
  Future<void> deleteComplaint(int id) async {
    List<ComplainModel> complains = await getComplaints();
    complains.removeWhere((complain) => complain.id == id);
    final String complaintsJson =
        jsonEncode(complains.map((e) => e.toJson()).toList());
    await write(key: _Keys.complainDetails, value: complaintsJson);
  }
}
