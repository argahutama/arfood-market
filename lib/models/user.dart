part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath});

  @override
  List<Object> get props =>
      [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
}

User mockUser = User(
    id: 1,
    name: 'Arga Hutama',
    address: 'Jalan Jenderal Sudirman',
    city: 'Solo',
    houseNumber: '1234',
    phoneNumber: '08950950944',
    email: 'argahut@gmail.com',
    picturePath:
        'https://pbs.twimg.com/media/COOuy9vVEAAQ25p?format=jpg&name=medium');
