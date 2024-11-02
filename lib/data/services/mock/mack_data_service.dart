class CarServiceMock {
  
    static const int perPage = 10; 
  Future<Map<String, dynamic>> fetchAllCars({int page = 1}) async {
    await Future.delayed(const Duration(seconds: 2)); 

    int startIndex = (page - 1) * perPage;
    int endIndex = startIndex + perPage;

    if (startIndex >= _carsData.length) {
      return {
        "cars": [], 
        "hasMore": false,
      };
    }

    List<Map<String, dynamic>> paginatedCars = _carsData.sublist(
      startIndex,
      endIndex > _carsData.length ? _carsData.length : endIndex,
    );

    return {
      "cars": paginatedCars,
      "hasMore": endIndex < _carsData.length, 
    };
  }

  Future<Map<String, dynamic>> fetchCarById({required String id}) async {
    await Future.delayed(const Duration(seconds: 2)); 
    
    final car = _carsData.firstWhere((car) => car["id"] == id, orElse: () => {});
    
    if (car.isNotEmpty) {
      return 
       {
          ...car,
          "isLiked": false, 
          "attributes": {
          "exteriorColor": "أبيض",
          "interiorColor": "بيج",
          "seatType": "مخمل",
          "hasSunroof":int.parse(id).isEven? true:false,
          "hasRearCamera":int.parse(id).isEven?false: true,
          "sensors": "أمامي - خلفي",
          "cylinder": 6,
          "transmission": "أوتوماتيك",
        },
        "user":{
           "name":"يوكن للسيارات المعتمده" ,
           "icon":"https://pluspng.com/img-png/user-png-icon-young-user-icon-2400.png"
        }
        }
      ;
    } else {
      return {
        "error": "Car not found",
      };
    }
  }
  static final List<Map<String, dynamic>> _carsData = [
    {
      "id": '1',
      "name": "تيوتا",
      "mark":"كورولا",
      "price": 8700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%2011.png?alt=media&token=b2240cef-6e29-4c72-930e-e7bb18f13f9d",
      "year": 2019,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 70000,
      
      
    },
    {
      "id": '2',
      "name": "كيا",
      "mark":"سبورتاج",
      "price": 12700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%201.png?alt=media&token=8afb5114-2d22-4a07-b679-5b96f743a61b",
      "year": 2021,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 20000,
      
      
      
    },

    {
      "id": '3',
      "name": "تيوتا",
      "mark":"كورولا",
      "price": 8700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%2011.png?alt=media&token=b2240cef-6e29-4c72-930e-e7bb18f13f9d",
      "year": 2019,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 70000,
      
      
    },
    {
      "id": '4',
      "name": "كيا",
      "mark":"سبورتاج",
      "price": 12700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%201.png?alt=media&token=8afb5114-2d22-4a07-b679-5b96f743a61b",
      "year": 2021,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 20000,
      
      
      
    },
      {
      "id": '5',
      "name": "تيوتا",
      "mark":"كورولا",
      "price": 8700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%2011.png?alt=media&token=b2240cef-6e29-4c72-930e-e7bb18f13f9d",
      "year": 2019,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 70000,
      
      
    },
    {
      "id": '6',
      "name": "كيا",
      "mark":"سبورتاج",
      "price": 12700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%201.png?alt=media&token=8afb5114-2d22-4a07-b679-5b96f743a61b",
      "year": 2021,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 20000,
      
      
      
    },
      {
      "id": '7',
      "name": "تيوتا",
      "mark":"كورولا",
      "price": 8700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%2011.png?alt=media&token=b2240cef-6e29-4c72-930e-e7bb18f13f9d",
      "year": 2019,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 70000,
      
      
    },
    {
      "id": '8',
      "name": "كيا",
      "mark":"سبورتاج",
      "price": 12700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%201.png?alt=media&token=8afb5114-2d22-4a07-b679-5b96f743a61b",
      "year": 2021,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 20000,
      
      
      
    },
      {
      "id": '9',
      "name": "تيوتا",
      "mark":"كورولا",
      "price": 8700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%2011.png?alt=media&token=b2240cef-6e29-4c72-930e-e7bb18f13f9d",
      "year": 2019,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 70000,
      
      
    },
    {
      "id": '10',
      "name": "كيا",
      "mark":"سبورتاج",
      "price": 12700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%201.png?alt=media&token=8afb5114-2d22-4a07-b679-5b96f743a61b",
      "year": 2021,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 20000,
      
      
      
    },
      {
      "id": '11',
      "name": "تيوتا",
      "mark":"كورولا",
      "price": 8700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%2011.png?alt=media&token=b2240cef-6e29-4c72-930e-e7bb18f13f9d",
      "year": 2019,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 70000,
      
      
    },
    {
      "id": '12',
      "name": "كيا",
      "mark":"سبورتاج",
      "price": 12700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%201.png?alt=media&token=8afb5114-2d22-4a07-b679-5b96f743a61b",
      "year": 2021,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 20000,
      
      
      
    },
      {
      "id": '13',
      "name": "تيوتا",
      "mark":"كورولا",
      "price": 8700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%2011.png?alt=media&token=b2240cef-6e29-4c72-930e-e7bb18f13f9d",
      "year": 2019,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 70000,
      
      
    },
    {
      "id": '14',
      "name": "كيا",
      "mark":"سبورتاج",
      "price": 12700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%201.png?alt=media&token=8afb5114-2d22-4a07-b679-5b96f743a61b",
      "year": 2021,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 20000,
      
      
      
    },
    {
      "id": '15',
      "name": "كيا",
      "mark":"سبورتاج",
      "price": 12700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%201.png?alt=media&token=8afb5114-2d22-4a07-b679-5b96f743a61b",
      "year": 2021,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 20000,
      
      
      
    },
      {
      "id": '16',
      "name": "تيوتا",
      "mark":"كورولا",
      "price": 8700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%2011.png?alt=media&token=b2240cef-6e29-4c72-930e-e7bb18f13f9d",
      "year": 2019,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 70000,
      
      
    },
    {
      "id": '17',
      "name": "كيا",
      "mark":"سبورتاج",
      "price": 12700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%201.png?alt=media&token=8afb5114-2d22-4a07-b679-5b96f743a61b",
      "year": 2021,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 20000,
      
      
      
    },
      {
      "id": '18',
      "name": "تيوتا",
      "mark":"كورولا",
      "price": 8700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%2011.png?alt=media&token=b2240cef-6e29-4c72-930e-e7bb18f13f9d",
      "year": 2019,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 70000,
      
      
    },
    {
      "id": '19',
      "name": "كيا",
      "mark":"سبورتاج",
      "price": 12700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%201.png?alt=media&token=8afb5114-2d22-4a07-b679-5b96f743a61b",
      "year": 2021,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 20000,
      
      
      
    },
      {
      "id": '20',
      "name": "تيوتا",
      "mark":"كورولا",
      "price": 8700,
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/tess-54168.appspot.com/o/Image%2011.png?alt=media&token=b2240cef-6e29-4c72-930e-e7bb18f13f9d",
      "year": 2019,
      "category":"الفئه الرابعه",
      "Guarantee":2024,
      "mileage": 70000,
      
      
    },
 
  ];



}
