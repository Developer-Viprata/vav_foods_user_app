enum UserRole { Customer, Fulfillment, Delivery, Admin }

class UserModel {
  String userId;
  String fullName;
  String email;
  String phoneNumber;
  String passwordHash;
  UserRole role;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.passwordHash,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  // Method to update the updatedAt timestamp
  void updateTimestamp() {
    updatedAt = DateTime.now();
  }

  // Convert User object to a map (useful for serialization)
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'passwordHash': passwordHash,
      'role': role.toString().split('.').last,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  // Create a User object from a map (useful for deserialization)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      fullName: map['fullName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      passwordHash: map['passwordHash'],
      role: UserRole.values
          .firstWhere((e) => e.toString().split('.').last == map['role']),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }
}
