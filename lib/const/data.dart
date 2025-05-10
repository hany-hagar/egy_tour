// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:egy_tour/features/layout/data/models/car_model.dart';
import 'package:egy_tour/features/layout/data/models/country_model.dart';
import 'package:egy_tour/features/layout/data/models/hotel_model.dart';
import 'package:egy_tour/features/layout/data/models/review_model.dart';
import 'package:egy_tour/features/layout/data/models/tour_model.dart';
import 'package:egy_tour/features/layout/data/models/tourism_model.dart';

import '../features/onBoarding/data/models/on_boarding_model.dart';

Color textColor = Colors.black;
Color defaultColor = CupertinoColors.activeOrange;
Color kDefaultColor = Color(0xffea9f5b);
Color kDefaultRedColor = Color(0xffcf2d47);
Color kDefaultBlueColor = Color(0xff4167b1);

List<OnBoardingModel> onBoardings = [
  OnBoardingModel(
    image: 'assets/images/SocialOnBoarding1.webp',
    title: 'Welcome to EGYTOUR!',
    body:
        "Discover the best of both worlds with seamless Online , we’ve got you covered. Start exploring now!",
  ),
  OnBoardingModel(
    image: 'assets/images/SocialOnBoarding2.jpg',
    title: 'Fast And Effortless Travels',
    body: 'With just a few taps, you can find everything you need!',
  ),
  OnBoardingModel(
    image: 'assets/images/SocialOnBoarding3.png',
    title: 'All Set to Explore!',
    body:
        "You're ready to dive into a world of endless choices. Start traveling now and discover amazing city's!",
  ),
];
const kRegisterEndPoint = 'register';
const kLoginEndPoint = 'login';
const kCity = 'city';
const kPosition = 'city';

const String LocationBox = 'Location';
const String LoginBox = 'LoginData';

final List<Map<String, String>> nationalities = [
  {'name': 'Afghan', 'flag': '🇦🇫'},
  {'name': 'Albanian', 'flag': '🇦🇱'},
  {'name': 'Algerian', 'flag': '🇩🇿'},
  {'name': 'American', 'flag': '🇺🇸'},
  {'name': 'Andorran', 'flag': '🇦🇩'},
  {'name': 'Angolan', 'flag': '🇦🇴'},
  {'name': 'Argentine', 'flag': '🇦🇷'},
  {'name': 'Armenian', 'flag': '🇦🇲'},
  {'name': 'Australian', 'flag': '🇦🇺'},
  {'name': 'Austrian', 'flag': '🇦🇹'},
  {'name': 'Azerbaijani', 'flag': '🇦🇿'},
  {'name': 'Bahraini', 'flag': '🇧🇭'},
  {'name': 'Bangladeshi', 'flag': '🇧🇩'},
  {'name': 'Belgian', 'flag': '🇧🇪'},
  {'name': 'Brazilian', 'flag': '🇧🇷'},
  {'name': 'British', 'flag': '🇬🇧'},
  {'name': 'Canadian', 'flag': '🇨🇦'},
  {'name': 'Chinese', 'flag': '🇨🇳'},
  {'name': 'Danish', 'flag': '🇩🇰'},
  {'name': 'Dutch', 'flag': '🇳🇱'},
  {'name': 'Egyptian', 'flag': '🇪🇬'},
  {'name': 'Finnish', 'flag': '🇫🇮'},
  {'name': 'French', 'flag': '🇫🇷'},
  {'name': 'German', 'flag': '🇩🇪'},
  {'name': 'Indian', 'flag': '🇮🇳'},
  {'name': 'Indonesian', 'flag': '🇮🇩'},
  {'name': 'Iranian', 'flag': '🇮🇷'},
  {'name': 'Iraqi', 'flag': '🇮🇶'},
  {'name': 'Irish', 'flag': '🇮🇪'},
  {'name': 'Italian', 'flag': '🇮🇹'},
  {'name': 'Japanese', 'flag': '🇯🇵'},
  {'name': 'Jordanian', 'flag': '🇯🇴'},
  {'name': 'Kuwaiti', 'flag': '🇰🇼'},
  {'name': 'Lebanese', 'flag': '🇱🇧'},
  {'name': 'Libyan', 'flag': '🇱🇾'},
  {'name': 'Malaysian', 'flag': '🇲🇾'},
  {'name': 'Mexican', 'flag': '🇲🇽'},
  {'name': 'Moroccan', 'flag': '🇲🇦'},
  {'name': 'Nigerian', 'flag': '🇳🇬'},
  {'name': 'Norwegian', 'flag': '🇳🇴'},
  {'name': 'Pakistani', 'flag': '🇵🇰'},
  {'name': 'Palestinian', 'flag': '🇵🇸'},
  {'name': 'Philippine', 'flag': '🇵🇭'},
  {'name': 'Polish', 'flag': '🇵🇱'},
  {'name': 'Portuguese', 'flag': '🇵🇹'},
  {'name': 'Qatari', 'flag': '🇶🇦'},
  {'name': 'Romanian', 'flag': '🇷🇴'},
  {'name': 'Russian', 'flag': '🇷🇺'},
  {'name': 'Saudi', 'flag': '🇸🇦'},
  {'name': 'South African', 'flag': '🇿🇦'},
  {'name': 'South Korean', 'flag': '🇰🇷'},
  {'name': 'Spanish', 'flag': '🇪🇸'},
  {'name': 'Sudanese', 'flag': '🇸🇩'},
  {'name': 'Swedish', 'flag': '🇸🇪'},
  {'name': 'Swiss', 'flag': '🇨🇭'},
  {'name': 'Syrian', 'flag': '🇸🇾'},
  {'name': 'Tunisian', 'flag': '🇹🇳'},
  {'name': 'Turkish', 'flag': '🇹🇷'},
  {'name': 'Ukrainian', 'flag': '🇺🇦'},
  {'name': 'Emirati', 'flag': '🇦🇪'},
  {'name': 'Vietnamese', 'flag': '🇻🇳'},
  {'name': 'Yemeni', 'flag': '🇾🇪'},
  {'name': 'Other', 'flag': '🌍'},
];

List<ReviewModel> reviews = [
  ReviewModel(
    id: '1',
    userId: 'user101',
    userName: 'TravelEnthusiast',
    userAvatar: 'https://example.com/avatars/user101.jpg',
    rating: 4,
    title: 'Beautiful Park with Amazing Views',
    comment:
        'Al-Azhar Park offers stunning panoramic views of Cairo. The landscaping is impeccable and it\'s a perfect escape from the city noise. The restaurants could improve their service though.',
    date: DateTime(2025, 4, 30),
    helpfulVotes: 12,
  ),
  ReviewModel(
    id: '2',
    userId: 'user202',
    userName: 'HistoryBuff',
    userAvatar: 'https://example.com/avatars/user202.jpg',
    rating: 3,
    title: 'Good but Overcrowded',
    comment:
        'The historic viewpoint provides great photo opportunities of Old Cairo, but it gets too crowded during peak hours. Early morning visits are recommended for better experience.',
    date: DateTime(2025, 4, 29),
    helpfulVotes: 5,
  ),
  ReviewModel(
    id: '3',
    userId: 'user303',
    userName: 'FamilyTraveler',
    userAvatar: 'https://example.com/avatars/user303.jpg',
    rating: 5,
    title: 'Perfect Family Day Out',
    comment:
        'We spent a wonderful day here with our kids. The playgrounds are safe and well-maintained, plenty of shaded areas, and clean facilities. Will definitely come back!',
    date: DateTime(2025, 4, 28),
    helpfulVotes: 18,
  ),
  ReviewModel(
    id: '4',
    userId: 'user404',
    userName: 'LocalGuide',
    userAvatar: 'https://example.com/avatars/user404.jpg',
    rating: 4,
    title: 'Best Sunset Spot in Cairo',
    comment:
        'As a local, I bring all my visiting friends here for sunset. The view of the Citadel and Mohammed Ali Mosque is breathtaking. Entry fee is reasonable for what you get.',
    date: DateTime(2025, 4, 27),
    helpfulVotes: 22,
  ),
  ReviewModel(
    id: '5',
    userId: 'user505',
    userName: 'SoloExplorer',
    userAvatar: 'https://example.com/avatars/user505.jpg',
    rating: 5,
    title: 'Peaceful Oasis in the City',
    comment:
        'Spent a quiet afternoon reading under the trees. The gardens are beautifully maintained and the staff is friendly. Highly recommend the hilltop café for tea with a view.',
    date: DateTime(2025, 4, 26),
    helpfulVotes: 9,
  ),
];

// Home Page Data

/*final List<CountryModel> countries = [
  CountryModel(
    id: 1,
    country: 'France',
    image:
        'https://quiltripping.com/wp-content/uploads/2017/07/DSC_0781-scaled.jpg',
  ),
  CountryModel(
    id: 2,
    country: 'Egypt',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg', // Pyramids of Giza
  ),
  CountryModel(
    id: 3,
    country: 'Italy',
    image:
        'https://www.shutterstock.com/image-photo/colosseum-panorama-sunrise-rome-italy-600nw-2349627077.jpg', // Colosseum
  ),
  CountryModel(
    id: 4,
    country: 'India',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/d/da/Taj-Mahal.jpg', // Taj Mahal
  ),
  CountryModel(
    id: 5,
    country: 'USA',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/a/a1/Statue_of_Liberty_7.jpg', // Statue of Liberty
  ),
  CountryModel(
    id: 6,
    country: 'China',
    image:
        'https://whc.unesco.org/uploads/thumbs/site_0438_0035-1200-630-20241024162522.jpg', // Great Wall
  ),
  CountryModel(
    id: 7,
    country: 'Australia',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsT8nI1D-kwg9szg31Ge6HHn5uGbNjzyWb0Q&s', // Sydney Opera House
  ),
  CountryModel(
    id: 8,
    country: 'Japan',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6jVpf_s8ytWC4MfuYOMCEbh80rWN-tBw6_A&s', // Mount Fuji & Pagoda
  ),
  CountryModel(
    id: 10,
    country: 'Turkey',
    image:
        'https://www.ekathimerini.com/wp-content/uploads/2024/12/Agia_Sophia_Shutterstock-1-1.jpg?v=1733861425', // Hagia Sophia
  ),
];
*/
final List<TourismModel> tourismDestinations = [
  TourismModel(
    id: '1',
    name: 'Pyramids of Giza',
    location: 'Giza, Egypt',
    rating: 4.9,
    numberOfRatings: 12500,
    openTime: 'Daily 8:00 AM - 5:00 PM',
    price: '200 EGP (approx. \$6.50)',
    description:
        'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
    facilities: [
      'Guided Tours',
      'Camel Rides',
      'Sound & Light Show',
      'Restrooms',
    ],
    images: [
      'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
      'https://example.com/pyramids2.jpg',
      'https://example.com/pyramids3.jpg',
    ],
    reviews: [
      ReviewModel(
        userAvatar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYP-KKtRJXm9qK7k2_PA1utxbxWdpzGIdulQ&s",
        id: 'rev1',
        userId: 'user123',
        userName: 'Ahmed Mohamed',
        rating: 5,
        comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
        date: DateTime(2023, 10, 15),
        helpfulVotes: 42,
      ),
    ],
  ),
  TourismModel(
    id: '2',
    name: 'Karnak Temple',
    location: 'Luxor, Egypt',
    rating: 4.8,
    numberOfRatings: 8700,
    openTime: 'Daily 6:00 AM - 5:30 PM',
    price: '160 EGP (approx. \$5.20)',
    description:
        'One of the largest religious buildings ever constructed, featuring massive columns and ancient carvings.',
    facilities: [
      'Guided Tours',
      'Audio Guides',
      'Photography Allowed',
      'Restrooms',
    ],
    images: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_xRVUaOFNuJsYT-z_WABVRVJHNEGIakWXJQ&s',
      'https://example.com/karnak2.jpg',
    ],
    reviews: [],
  ),
  TourismModel(
    id: '3',
    name: 'Valley of the Kings',
    location: 'Luxor, Egypt',
    rating: 4.7,
    numberOfRatings: 9200,
    openTime: 'Daily 6:00 AM - 5:00 PM',
    price: '240 EGP (approx. \$7.80)',
    description:
        'Royal burial ground of the pharaohs, including King Tutankhamun\'s tomb.',
    facilities: ['Guided Tours', 'Photography (extra fee)', 'Restrooms'],
    images: [
      'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/mandators/49581/file-manager/tomb-of-ramses-vi.jpg',
      'https://example.com/valley2.jpg',
    ],
    reviews: [],
  ),
  TourismModel(
    id: '4',
    name: 'Abu Simbel',
    location: 'Aswan, Egypt',
    rating: 4.8,
    numberOfRatings: 6800,
    openTime: 'Daily 6:00 AM - 5:00 PM',
    price: "260 EGP (approx. \$8.50)",
    description:
        'Giant rock temples of Ramses II, relocated to avoid flooding from Lake Nasser.',
    facilities: ['Guided Tours', 'Restrooms', 'Visitor Center'],
    images: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1WNxCqkakYSEUHwOp4ZyWgM85Z0U3_VWIWw&s',
      'https://example.com/abusimbel2.jpg',
    ],
    reviews: [],
  ),
  TourismModel(
    id: '5',
    name: 'Egyptian Museum',
    location: 'Cairo, Egypt',
    rating: 4.6,
    numberOfRatings: 10500,
    openTime: 'Daily 9:00 AM - 5:00 PM',
    price: '200 EGP (approx. \$6.50)',
    description:
        'A treasure trove of ancient Egyptian artifacts, including the gold mask of Tutankhamun.',
    facilities: ['Guided Tours', 'Audio Guides', 'Gift Shop', 'Cafeteria'],
    images: [
      'https://images.memphistours.com/large/1466519964_12.jpg',
      'https://example.com/museum2.jpg',
    ],
    reviews: [],
  ),
  TourismModel(
    id: '6',
    name: 'Sharm El Sheikh',
    location: 'Sharm El Sheikh, Egypt',
    rating: 4.9,
    numberOfRatings: 14300,
    openTime: 'Open 24 hours',
    price: 'Varies by activity',
    description:
        'Resort city on the Red Sea known for diving, snorkeling, and coral reefs.',
    facilities: ['Beaches', 'Diving Centers', 'Resorts', 'Restaurants'],
    images: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6MErXUjCRdVqSGbBxJYLNMQym_-tSF4mRcF2lTeub5JvVhWXnYvT-p50lM34AXjhnrRk&usqp=CAU',
      'https://example.com/sharm2.jpg',
    ],
    reviews: [],
  ),
  TourismModel(
    id: '7',
    name: 'Hurghada',
    location: 'Hurghada, Egypt',
    rating: 4.7,
    numberOfRatings: 11200,
    openTime: 'Open 24 hours',
    price: 'Varies by activity',
    description:
        'Vibrant beach resort town offering water sports, marine life, and nightlife.',
    facilities: ['Beaches', 'Water Sports', 'Hotels', 'Nightclubs'],
    images: [
      'https://www.totraveltoo.com/wp-content/uploads/2024/03/2-7.jpg',
      'https://example.com/hurghada2.jpg',
    ],
    reviews: [],
  ),
  TourismModel(
    id: '8',
    name: 'Alexandria',
    location: 'Alexandria, Egypt',
    rating: 4.5,
    numberOfRatings: 8900,
    openTime: 'Varies by attraction',
    price: 'Varies by attraction',
    description:
        'Mediterranean coastal city with Roman ruins, ancient catacombs, and a modern library.',
    facilities: ['Beaches', 'Historical Sites', 'Museums', 'Restaurants'],
    images: [
      'https://www.arabworldbooks.com/uploads/2021/03/1617117829.jpg',
      'https://example.com/alex2.jpg',
    ],
    reviews: [],
  ),
  TourismModel(
    id: '9',
    name: 'St. Catherine\'s Monastery',
    location: 'Mount Sinai, Egypt',
    rating: 4.6,
    numberOfRatings: 4200,
    openTime: '9:00 AM - 12:00 PM (Closed Fri & Sun)',
    price: 'Free (Donations accepted)',
    description: 'Historic Christian monastery at the foot of Mount Sinai.',
    facilities: ['Religious Site', 'Museum', 'Gift Shop'],
    images: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa4MAw3XomBLlGv7H6GqUILgwlih4XKv0ohg&s',
      'https://example.com/stcatherine2.jpg',
    ],
    reviews: [],
  ),
  TourismModel(
    id: '10',
    name: 'Siwa Oasis',
    location: 'Siwa, Egypt',
    rating: 4.4,
    numberOfRatings: 3100,
    openTime: 'Open 24 hours',
    price: 'Varies by activity',
    description:
        'Remote desert oasis famous for its springs, palm groves, and ancient traditions.',
    facilities: ['Hot Springs', 'Desert Tours', 'Eco Lodges', 'Local Crafts'],
    images: [
      'https://www.sportseventsegypt.com/wp-content/uploads/2022/01/siwa.jpg',
      'https://example.com/siwa2.jpg',
    ],
    reviews: [],
  ),
];

List<HotelModel> hotels = [
  HotelModel(
    id: '1',
    name: 'Grand Palace Hotel',
    address: '123 Nile Corniche, Downtown, Cairo',
    rating: 4.8,
    reviewCount: 428,
    pricePerNight: 350.0,
    roomType: 'Deluxe Suite',
    checkInTime: '2:00 PM',
    checkOutTime: '12:00 PM',
    description:
        'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
    amenities: [
      'Rooftop Pool',
      'Spa',
      'Free WiFi',
      'Restaurant',
      'Fitness Center',
    ],
    roomImages: [
      'https://picsum.photos/id/1011/400/200',
      'https://picsum.photos/id/102/400/200',
      'https://picsum.photos/id/103/400/200',
    ],
    policies: [
      'Free cancellation up to 48 hours before check-in',
      'No pets allowed',
      'Early check-in available upon request',
    ],
    reviews: [
      ReviewModel(
        id: 'rev1',
        userId: 'user123',
        userName: 'Ahmed Mohamed',
        rating: 5,
        title: 'Exceptional Service',
        comment:
            'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
        date: DateTime.now().subtract(Duration(days: 15)),
        helpfulVotes: 24,
      ),
      ReviewModel(
        id: 'rev2',
        userId: 'user456',
        userName: 'Sarah Johnson',
        rating: 4,
        title: 'Luxurious Stay',
        comment:
            'Beautiful rooms and excellent amenities. The pool area was particularly impressive.',
        date: DateTime.now().subtract(Duration(days: 30)),
        helpfulVotes: 12,
      ),
    ],
  ),
  HotelModel(
    id: '2',
    name: 'Ocean Breeze Resort',
    address: 'Red Sea Road, Hurghada',
    rating: 4.6,
    reviewCount: 312,
    pricePerNight: 280.0,
    roomType: 'Beachfront Villa',
    checkInTime: '3:00 PM',
    checkOutTime: '11:00 AM',
    description:
        'A luxury resort in Hurghada ideal for beach lovers and family vacations.',
    amenities: [
      'Private Beach',
      'Diving Center',
      'Kids Club',
      '3 Restaurants',
      'Water Sports',
    ],
    roomImages: [
      'https://picsum.photos/id/1012/400/200',
      'https://picsum.photos/id/104/400/200',
      'https://picsum.photos/id/105/400/200',
    ],
    policies: [
      'Free cancellation up to 72 hours before check-in',
      'Pets allowed with extra fee',
      'All-inclusive option available',
    ],
    reviews: [
      ReviewModel(
        id: 'rev3',
        userId: 'user789',
        userName: 'Mark Wilson',
        rating: 5,
        title: 'Paradise Found',
        comment:
            'The beach was pristine and the coral reefs just offshore were amazing for snorkeling.',
        date: DateTime.now().subtract(Duration(days: 45)),
        helpfulVotes: 18,
      ),
    ],
  ),
  HotelModel(
    id: '3',
    name: 'Nile Dream Hotel',
    address: 'Nile Street, Aswan',
    rating: 4.3,
    reviewCount: 198,
    pricePerNight: 180.0,
    roomType: 'River View Room',
    checkInTime: '1:00 PM',
    checkOutTime: '11:00 AM',
    description:
        'A serene riverside hotel in Aswan perfect for peaceful getaways and sightseeing.',
    amenities: [
      'Nile View Terrace',
      'Boat Tours',
      'Garden',
      'Traditional Restaurant',
      'Free WiFi',
    ],
    roomImages: [
      'https://picsum.photos/id/1013/400/200',
      'https://picsum.photos/id/106/400/200',
      'https://picsum.photos/id/107/400/200',
    ],
    policies: [
      'Free cancellation up to 24 hours before check-in',
      'Non-smoking rooms available',
      'Late check-out upon availability',
    ],
    reviews: [
      ReviewModel(
        id: 'rev4',
        userId: 'user101',
        userName: 'Fatima Ali',
        rating: 4,
        title: 'Peaceful Retreat',
        comment:
            'Loved watching the Nile boats go by from our balcony. Very relaxing atmosphere.',
        date: DateTime.now().subtract(Duration(days: 60)),
        helpfulVotes: 8,
      ),
    ],
  ),
  HotelModel(
    id: '4',
    name: 'Luxor Heritage Inn',
    address: 'Karnak Temple Road, Luxor',
    rating: 4.5,
    reviewCount: 276,
    pricePerNight: 220.0,
    roomType: 'Historical Suite',
    checkInTime: '2:00 PM',
    checkOutTime: '12:00 PM',
    description:
        'Located near the Karnak Temple, this hotel offers comfort and cultural immersion.',
    amenities: [
      'Temple View',
      'Cultural Tours',
      'Rooftop Restaurant',
      'Swimming Pool',
      'Gift Shop',
    ],
    roomImages: [
      'https://picsum.photos/id/1014/400/200',
      'https://picsum.photos/id/108/400/200',
      'https://picsum.photos/id/109/400/200',
    ],
    policies: [
      'Non-refundable rate available',
      'Tour packages offered',
      'Early breakfast available',
    ],
    reviews: [
      ReviewModel(
        id: 'rev5',
        userId: 'user202',
        userName: 'James Peterson',
        rating: 5,
        title: 'History at Your Doorstep',
        comment:
            'Being able to walk to Karnak Temple in minutes was incredible. The hotel has authentic Egyptian decor.',
        date: DateTime.now().subtract(Duration(days: 30)),
        helpfulVotes: 15,
      ),
    ],
  ),
  HotelModel(
    id: '5',
    name: 'Alexandria Pearl',
    address: 'Mediterranean Sea Road, Alexandria',
    rating: 4.7,
    reviewCount: 354,
    pricePerNight: 290.0,
    roomType: 'Sea View Room',
    checkInTime: '3:00 PM',
    checkOutTime: '12:00 PM',
    description:
        'A modern hotel on the Mediterranean coast with a relaxing atmosphere and top facilities.',
    amenities: [
      'Sea View',
      'Spa',
      'Fine Dining',
      'Beach Access',
      'Business Center',
    ],
    roomImages: [
      'https://picsum.photos/id/1015/400/200',
      'https://picsum.photos/id/110/400/200',
      'https://picsum.photos/id/111/400/200',
    ],
    policies: [
      'Free cancellation up to 48 hours before check-in',
      'Valet parking available',
      '24-hour room service',
    ],
    reviews: [
      ReviewModel(
        id: 'rev6',
        userId: 'user303',
        userName: 'Elena Rodriguez',
        rating: 5,
        title: 'Perfect Mediterranean Getaway',
        comment:
            'The sea view from our room was spectacular. The seafood restaurant was outstanding.',
        date: DateTime.now().subtract(Duration(days: 20)),
        helpfulVotes: 22,
      ),
    ],
  ),
];

final List<CarModel> cars = [
  CarModel(
    id: '1',
    carNumber: 'ABC123',
    name: 'Tesla Model S', // تم تغيير title إلى carName هنا
    company: 'Tesla',
    phone: '+123456789',
    price: '200',
    model: 'Model S',
    imageUrl:
        'https://crdms.images.consumerreports.org/c_lfill,w_843,q_auto,f_auto/prod/cars/cr/car-versions/23483-2022-tesla-model-x-long-range',
    description: 'Luxury electric car with high performance',
    likes: 4.9,
    location: 'California',
    reviews: reviews,
  ),
  CarModel(
    id: '2',
    carNumber: 'XYZ789',
    name: 'BMW i8', // تم تغيير title إلى carName هنا
    company: 'BMW',
    phone: '+987654321',
    price: '200',
    model: 'i8',
    imageUrl:
        'https://cdn-www.pod-point.com/Roadster-white-background-2.jpg?v=1558012881',
    description: 'Hybrid sports car with futuristic design',
    likes: 4.8,
    location: 'Germany',
    reviews: reviews,
  ),
  CarModel(
    id: '3',
    carNumber: 'DEF456',
    name: 'Audi e-tron', // تم تغيير title إلى carName هنا
    company: 'Audi',
    phone: '+1122334455',
    price: '200',
    model: 'e-tron',
    imageUrl:
        'https://www.motortrend.com/uploads/sites/5/2020/11/2021-audi-etron.png',
    description: 'Premium electric SUV with advanced technology',
    likes: 4.7,
    location: 'Germany',
    reviews: reviews,
  ),
];

final List<TourModel> tours = [
  TourModel(
    id: '1',
    name: 'Luxor Nile Cruise',
    description:
        '''Embark on a magical 5-day Nile River journey between Luxor and Aswan aboard a luxury cruise ship. 
Visit the magnificent temples of Karnak and Luxor on your first day, followed by the Valley of the Kings. 
Enjoy sunset felucca rides and witness traditional Nubian performances on deck. 
Explore Edfu and Kom Ombo temples with expert Egyptologist guides. 
Conclude in Aswan with visits to Philae Temple and optional Abu Simbel excursion. 
All meals included with gourmet Egyptian and international cuisine.''',
    days: 5,
    people: 2,
    price: '8500',
    location: 'Luxor - Aswan',
    hostName: 'Nile Cruises Co.',
    phone: '+201001234567',
    rating: 4.9,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRrSLuRxVc_Hzf5oRcRKbl8xYy5oZnPjmRyg&s',
    reviews: reviews,
  ),
  TourModel(
    id: '2',
    name: 'Sharm El-Sheikh Getaway',
    description:
        '''Experience the ultimate Red Sea retreat with this 3-day luxury package. 
Stay at a 5-star beachfront resort with private access to coral reefs. 
Day 1 features a diving excursion to Ras Mohammed National Park. 
On day 2, enjoy a Bedouin-style desert safari with camel rides and stargazing. 
Final day includes spa treatments and free time at Naama Bay. 
All-inclusive package covers meals, select drinks, and water sports equipment. 
Perfect for families and couples seeking sun, sea, and adventure.''',
    days: 3,
    people: 4,
    price: '6800',
    location: 'Sharm El-Sheikh',
    hostName: 'Sun & Sand Tours',
    phone: '+201112345678',
    rating: 4.8,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG9f7PMEHeJjqyyGzQE2gCKF8uRDcXB_BBcA&s',
    reviews: reviews,
  ),
  TourModel(
    id: '3',
    name: 'Cairo Historic & Culinary Tour',
    description:
        '''Immerse yourself in Cairo's rich history and vibrant food scene. 
Day 1 includes Giza Pyramids, Sphinx, and Saqqara with a local guide. 
Explore Islamic Cairo's architectural gems and Khan el-Khalili bazaar. 
Participate in cooking classes to learn authentic Egyptian recipes. 
Taste street food favorites like koshary and ful medames. 
Special dinner cruise on the Nile with traditional entertainment. 
Includes all entrance fees, transportation, and 10+ food tastings.''',
    days: 4,
    people: 3,
    price: '4900',
    location: 'Cairo',
    hostName: 'Cairo Culture Co.',
    phone: '+201223456789',
    rating: 4.7,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRgOurwupTOb91xlOi1IlDpPK5hUbA9HmtrQ&s',
    reviews: reviews,
  ),
];

List<CountryModel> countries = [
  country,
  country2,
  country3,
  country4,
  country5,
  country6,
];

var country = CountryModel(
  id: '1',
  name: 'Egypt',
  images: [
    "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSKth3Z9eerj7Wc-DUdsu1INu8AKR0vSnrakP1_piJv-kPRxEdz4159AyR7eb5GvAdCJHrddjs2igqa5Sb9iDFNb4GsLgng0eBk-ccV-w",
    "https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg",
  ],
  states: [
    StateDataModel(
      id: '1',
      name: 'Cairo',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Wikimedia_2016_-34.jpg/1024px-Wikimedia_2016_-34.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '2',
      name: 'Giza',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '3',
      name: 'Alexandria',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Alexandria_Egypt_%28235108463%29.jpeg/800px-Alexandria_Egypt_%28235108463%29.jpeg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '4',
      name: 'RED SEA',
      image:
          "https://almawqeapost.net/upimages/news/Almawqea2023-12-26-07-01-43-308313.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
  ],
  hotels: [
    HotelModel(
      id: '4',
      name: 'Luxor Heritage Inn',
      address: 'Karnak Temple Road, Luxor',
      rating: 4.5,
      reviewCount: 276,
      pricePerNight: 220.0,
      roomType: 'Historical Suite',
      checkInTime: '2:00 PM',
      checkOutTime: '12:00 PM',
      description:
          'Located near the Karnak Temple, this hotel offers comfort and cultural immersion.',
      amenities: [
        'Temple View',
        'Cultural Tours',
        'Rooftop Restaurant',
        'Swimming Pool',
        'Gift Shop',
      ],
      roomImages: [
        'https://picsum.photos/id/1014/400/200',
        'https://picsum.photos/id/108/400/200',
        'https://picsum.photos/id/109/400/200',
      ],
      policies: [
        'Non-refundable rate available',
        'Tour packages offered',
        'Early breakfast available',
      ],
      reviews: [
        ReviewModel(
          id: 'rev5',
          userId: 'user202',
          userName: 'James Peterson',
          rating: 5,
          title: 'History at Your Doorstep',
          comment:
              'Being able to walk to Karnak Temple in minutes was incredible. The hotel has authentic Egyptian decor.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 15,
        ),
      ],
    ),
  ],
  tickets: [
    TourismModel(
      id: '1',
      name: 'Pyramids of Giza',
      location: 'Giza, Egypt',
      rating: 4.9,
      numberOfRatings: 12500,
      openTime: 'Daily 8:00 AM - 5:00 PM',
      price: '200 EGP (approx. \$6.50)',
      description:
          'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
      facilities: [
        'Guided Tours',
        'Camel Rides',
        'Sound & Light Show',
        'Restrooms',
      ],
      images: [
        'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
        'https://example.com/pyramids2.jpg',
        'https://example.com/pyramids3.jpg',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
  cars: [
    CarModel(
      id: '1',
      carNumber: 'ABC123',
      name: 'Tesla Model S', // تم تغيير title إلى carName هنا
      company: 'Tesla',
      phone: '+123456789',
      price: '200',
      model: 'Model S',
      imageUrl:
          'https://crdms.images.consumerreports.org/c_lfill,w_843,q_auto,f_auto/prod/cars/cr/car-versions/23483-2022-tesla-model-x-long-range',
      description: 'Luxury electric car with high performance',
      likes: 4.9,
      location: 'California',
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
  tours: [
    TourModel(
      id: '1',
      name: 'Luxor Nile Cruise',
      description:
          '5-day Nile cruise from Luxor to Aswan with temple tours and Nubian experiences.',
      days: 5,
      people: 2,
      price: '8500',
      location: 'Luxor - Aswan',
      hostName: 'Nile Cruises Co.',
      phone: '+201001234567',
      rating: 4.9,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRrSLuRxVc_Hzf5oRcRKbl8xYy5oZnPjmRyg&s',
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
);

var country2 = CountryModel(
  id: '2',
  name: 'France',
  images: [
    "https://quiltripping.com/wp-content/uploads/2017/07/DSC_0781-scaled.jpg",
  ],
  states: [
    StateDataModel(
      id: '1',
      name: 'Cairo',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Wikimedia_2016_-34.jpg/1024px-Wikimedia_2016_-34.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '2',
      name: 'Giza',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '3',
      name: 'Alexandria',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Alexandria_Egypt_%28235108463%29.jpeg/800px-Alexandria_Egypt_%28235108463%29.jpeg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '4',
      name: 'RED SEA',
      image:
          "https://almawqeapost.net/upimages/news/Almawqea2023-12-26-07-01-43-308313.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
  ],
  hotels: [
    HotelModel(
      id: '4',
      name: 'Luxor Heritage Inn',
      address: 'Karnak Temple Road, Luxor',
      rating: 4.5,
      reviewCount: 276,
      pricePerNight: 220.0,
      roomType: 'Historical Suite',
      checkInTime: '2:00 PM',
      checkOutTime: '12:00 PM',
      description:
          'Located near the Karnak Temple, this hotel offers comfort and cultural immersion.',
      amenities: [
        'Temple View',
        'Cultural Tours',
        'Rooftop Restaurant',
        'Swimming Pool',
        'Gift Shop',
      ],
      roomImages: [
        'https://picsum.photos/id/1014/400/200',
        'https://picsum.photos/id/108/400/200',
        'https://picsum.photos/id/109/400/200',
      ],
      policies: [
        'Non-refundable rate available',
        'Tour packages offered',
        'Early breakfast available',
      ],
      reviews: [
        ReviewModel(
          id: 'rev5',
          userId: 'user202',
          userName: 'James Peterson',
          rating: 5,
          title: 'History at Your Doorstep',
          comment:
              'Being able to walk to Karnak Temple in minutes was incredible. The hotel has authentic Egyptian decor.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 15,
        ),
      ],
    ),
  ],
  tickets: [
    TourismModel(
      id: '1',
      name: 'Pyramids of Giza',
      location: 'Giza, Egypt',
      rating: 4.9,
      numberOfRatings: 12500,
      openTime: 'Daily 8:00 AM - 5:00 PM',
      price: '200 EGP (approx. \$6.50)',
      description:
          'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
      facilities: [
        'Guided Tours',
        'Camel Rides',
        'Sound & Light Show',
        'Restrooms',
      ],
      images: [
        'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
        'https://example.com/pyramids2.jpg',
        'https://example.com/pyramids3.jpg',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
  cars: [
    CarModel(
      id: '1',
      carNumber: 'ABC123',
      name: 'Tesla Model S', // تم تغيير title إلى carName هنا
      company: 'Tesla',
      phone: '+123456789',
      price: '200',
      model: 'Model S',
      imageUrl:
          'https://crdms.images.consumerreports.org/c_lfill,w_843,q_auto,f_auto/prod/cars/cr/car-versions/23483-2022-tesla-model-x-long-range',
      description: 'Luxury electric car with high performance',
      likes: 4.9,
      location: 'California',
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
  tours: [
    TourModel(
      id: '1',
      name: 'Luxor Nile Cruise',
      description:
          '5-day Nile cruise from Luxor to Aswan with temple tours and Nubian experiences.',
      days: 5,
      people: 2,
      price: '8500',
      location: 'Luxor - Aswan',
      hostName: 'Nile Cruises Co.',
      phone: '+201001234567',
      rating: 4.9,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRrSLuRxVc_Hzf5oRcRKbl8xYy5oZnPjmRyg&s',
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
);

var country3 = CountryModel(
  id: '3',
  name: 'Italy',
  images: [
    "https://www.shutterstock.com/image-photo/colosseum-panorama-sunrise-rome-italy-600nw-2349627077.jpg",
  ],
  states: [
    StateDataModel(
      id: '1',
      name: 'Cairo',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Wikimedia_2016_-34.jpg/1024px-Wikimedia_2016_-34.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '2',
      name: 'Giza',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '3',
      name: 'Alexandria',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Alexandria_Egypt_%28235108463%29.jpeg/800px-Alexandria_Egypt_%28235108463%29.jpeg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '4',
      name: 'RED SEA',
      image:
          "https://almawqeapost.net/upimages/news/Almawqea2023-12-26-07-01-43-308313.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
  ],
  hotels: [
    HotelModel(
      id: '4',
      name: 'Luxor Heritage Inn',
      address: 'Karnak Temple Road, Luxor',
      rating: 4.5,
      reviewCount: 276,
      pricePerNight: 220.0,
      roomType: 'Historical Suite',
      checkInTime: '2:00 PM',
      checkOutTime: '12:00 PM',
      description:
          'Located near the Karnak Temple, this hotel offers comfort and cultural immersion.',
      amenities: [
        'Temple View',
        'Cultural Tours',
        'Rooftop Restaurant',
        'Swimming Pool',
        'Gift Shop',
      ],
      roomImages: [
        'https://picsum.photos/id/1014/400/200',
        'https://picsum.photos/id/108/400/200',
        'https://picsum.photos/id/109/400/200',
      ],
      policies: [
        'Non-refundable rate available',
        'Tour packages offered',
        'Early breakfast available',
      ],
      reviews: [
        ReviewModel(
          id: 'rev5',
          userId: 'user202',
          userName: 'James Peterson',
          rating: 5,
          title: 'History at Your Doorstep',
          comment:
              'Being able to walk to Karnak Temple in minutes was incredible. The hotel has authentic Egyptian decor.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 15,
        ),
      ],
    ),
  ],
  tickets: [
    TourismModel(
      id: '1',
      name: 'Pyramids of Giza',
      location: 'Giza, Egypt',
      rating: 4.9,
      numberOfRatings: 12500,
      openTime: 'Daily 8:00 AM - 5:00 PM',
      price: '200 EGP (approx. \$6.50)',
      description:
          'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
      facilities: [
        'Guided Tours',
        'Camel Rides',
        'Sound & Light Show',
        'Restrooms',
      ],
      images: [
        'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
        'https://example.com/pyramids2.jpg',
        'https://example.com/pyramids3.jpg',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
  cars: [
    CarModel(
      id: '1',
      carNumber: 'ABC123',
      name: 'Tesla Model S', // تم تغيير title إلى carName هنا
      company: 'Tesla',
      phone: '+123456789',
      price: '200',
      model: 'Model S',
      imageUrl:
          'https://crdms.images.consumerreports.org/c_lfill,w_843,q_auto,f_auto/prod/cars/cr/car-versions/23483-2022-tesla-model-x-long-range',
      description: 'Luxury electric car with high performance',
      likes: 4.9,
      location: 'California',
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
  tours: [
    TourModel(
      id: '1',
      name: 'Luxor Nile Cruise',
      description:
          '5-day Nile cruise from Luxor to Aswan with temple tours and Nubian experiences.',
      days: 5,
      people: 2,
      price: '8500',
      location: 'Luxor - Aswan',
      hostName: 'Nile Cruises Co.',
      phone: '+201001234567',
      rating: 4.9,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRrSLuRxVc_Hzf5oRcRKbl8xYy5oZnPjmRyg&s',
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
);

var country4 = CountryModel(
  id: '4',
  name: 'India',
  images: ['https://upload.wikimedia.org/wikipedia/commons/d/da/Taj-Mahal.jpg'],
  states: [
    StateDataModel(
      id: '1',
      name: 'Cairo',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Wikimedia_2016_-34.jpg/1024px-Wikimedia_2016_-34.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '2',
      name: 'Giza',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '3',
      name: 'Alexandria',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Alexandria_Egypt_%28235108463%29.jpeg/800px-Alexandria_Egypt_%28235108463%29.jpeg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '4',
      name: 'RED SEA',
      image:
          "https://almawqeapost.net/upimages/news/Almawqea2023-12-26-07-01-43-308313.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
  ],
  hotels: [
    HotelModel(
      id: '4',
      name: 'Luxor Heritage Inn',
      address: 'Karnak Temple Road, Luxor',
      rating: 4.5,
      reviewCount: 276,
      pricePerNight: 220.0,
      roomType: 'Historical Suite',
      checkInTime: '2:00 PM',
      checkOutTime: '12:00 PM',
      description:
          'Located near the Karnak Temple, this hotel offers comfort and cultural immersion.',
      amenities: [
        'Temple View',
        'Cultural Tours',
        'Rooftop Restaurant',
        'Swimming Pool',
        'Gift Shop',
      ],
      roomImages: [
        'https://picsum.photos/id/1014/400/200',
        'https://picsum.photos/id/108/400/200',
        'https://picsum.photos/id/109/400/200',
      ],
      policies: [
        'Non-refundable rate available',
        'Tour packages offered',
        'Early breakfast available',
      ],
      reviews: [
        ReviewModel(
          id: 'rev5',
          userId: 'user202',
          userName: 'James Peterson',
          rating: 5,
          title: 'History at Your Doorstep',
          comment:
              'Being able to walk to Karnak Temple in minutes was incredible. The hotel has authentic Egyptian decor.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 15,
        ),
      ],
    ),
  ],
  tickets: [
    TourismModel(
      id: '1',
      name: 'Pyramids of Giza',
      location: 'Giza, Egypt',
      rating: 4.9,
      numberOfRatings: 12500,
      openTime: 'Daily 8:00 AM - 5:00 PM',
      price: '200 EGP (approx. \$6.50)',
      description:
          'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
      facilities: [
        'Guided Tours',
        'Camel Rides',
        'Sound & Light Show',
        'Restrooms',
      ],
      images: [
        'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
        'https://example.com/pyramids2.jpg',
        'https://example.com/pyramids3.jpg',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
  cars: [
    CarModel(
      id: '1',
      carNumber: 'ABC123',
      name: 'Tesla Model S', // تم تغيير title إلى carName هنا
      company: 'Tesla',
      phone: '+123456789',
      price: '200',
      model: 'Model S',
      imageUrl:
          'https://crdms.images.consumerreports.org/c_lfill,w_843,q_auto,f_auto/prod/cars/cr/car-versions/23483-2022-tesla-model-x-long-range',
      description: 'Luxury electric car with high performance',
      likes: 4.9,
      location: 'California',
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
  tours: [
    TourModel(
      id: '1',
      name: 'Luxor Nile Cruise',
      description:
          '5-day Nile cruise from Luxor to Aswan with temple tours and Nubian experiences.',
      days: 5,
      people: 2,
      price: '8500',
      location: 'Luxor - Aswan',
      hostName: 'Nile Cruises Co.',
      phone: '+201001234567',
      rating: 4.9,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRrSLuRxVc_Hzf5oRcRKbl8xYy5oZnPjmRyg&s',
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
);

var country5 = CountryModel(
  id: '5',
  name: 'USA',
  images: [
    'https://upload.wikimedia.org/wikipedia/commons/a/a1/Statue_of_Liberty_7.jpg',
  ],
  states: [
    StateDataModel(
      id: '1',
      name: 'Cairo',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Wikimedia_2016_-34.jpg/1024px-Wikimedia_2016_-34.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '2',
      name: 'Giza',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '3',
      name: 'Alexandria',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Alexandria_Egypt_%28235108463%29.jpeg/800px-Alexandria_Egypt_%28235108463%29.jpeg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '4',
      name: 'RED SEA',
      image:
          "https://almawqeapost.net/upimages/news/Almawqea2023-12-26-07-01-43-308313.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
  ],
  hotels: [
    HotelModel(
      id: '4',
      name: 'Luxor Heritage Inn',
      address: 'Karnak Temple Road, Luxor',
      rating: 4.5,
      reviewCount: 276,
      pricePerNight: 220.0,
      roomType: 'Historical Suite',
      checkInTime: '2:00 PM',
      checkOutTime: '12:00 PM',
      description:
          'Located near the Karnak Temple, this hotel offers comfort and cultural immersion.',
      amenities: [
        'Temple View',
        'Cultural Tours',
        'Rooftop Restaurant',
        'Swimming Pool',
        'Gift Shop',
      ],
      roomImages: [
        'https://picsum.photos/id/1014/400/200',
        'https://picsum.photos/id/108/400/200',
        'https://picsum.photos/id/109/400/200',
      ],
      policies: [
        'Non-refundable rate available',
        'Tour packages offered',
        'Early breakfast available',
      ],
      reviews: [
        ReviewModel(
          id: 'rev5',
          userId: 'user202',
          userName: 'James Peterson',
          rating: 5,
          title: 'History at Your Doorstep',
          comment:
              'Being able to walk to Karnak Temple in minutes was incredible. The hotel has authentic Egyptian decor.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 15,
        ),
      ],
    ),
  ],
  tickets: [
    TourismModel(
      id: '1',
      name: 'Pyramids of Giza',
      location: 'Giza, Egypt',
      rating: 4.9,
      numberOfRatings: 12500,
      openTime: 'Daily 8:00 AM - 5:00 PM',
      price: '200 EGP (approx. \$6.50)',
      description:
          'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
      facilities: [
        'Guided Tours',
        'Camel Rides',
        'Sound & Light Show',
        'Restrooms',
      ],
      images: [
        'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
        'https://example.com/pyramids2.jpg',
        'https://example.com/pyramids3.jpg',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
  cars: [
    CarModel(
      id: '1',
      carNumber: 'ABC123',
      name: 'Tesla Model S', // تم تغيير title إلى carName هنا
      company: 'Tesla',
      phone: '+123456789',
      price: '200',
      model: 'Model S',
      imageUrl:
          'https://crdms.images.consumerreports.org/c_lfill,w_843,q_auto,f_auto/prod/cars/cr/car-versions/23483-2022-tesla-model-x-long-range',
      description: 'Luxury electric car with high performance',
      likes: 4.9,
      location: 'California',
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
  tours: [
    TourModel(
      id: '1',
      name: 'Luxor Nile Cruise',
      description:
          '5-day Nile cruise from Luxor to Aswan with temple tours and Nubian experiences.',
      days: 5,
      people: 2,
      price: '8500',
      location: 'Luxor - Aswan',
      hostName: 'Nile Cruises Co.',
      phone: '+201001234567',
      rating: 4.9,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRrSLuRxVc_Hzf5oRcRKbl8xYy5oZnPjmRyg&s',
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
);

var country6 = CountryModel(
  id: '6',
  name: 'China',
  images: [
    'https://whc.unesco.org/uploads/thumbs/site_0438_0035-1200-630-20241024162522.jpg',
  ],
  states: [
    StateDataModel(
      id: '1',
      name: 'Cairo',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Wikimedia_2016_-34.jpg/1024px-Wikimedia_2016_-34.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '2',
      name: 'Giza',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '3',
      name: 'Alexandria',
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Alexandria_Egypt_%28235108463%29.jpeg/800px-Alexandria_Egypt_%28235108463%29.jpeg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
    StateDataModel(
      id: '4',
      name: 'RED SEA',
      image:
          "https://almawqeapost.net/upimages/news/Almawqea2023-12-26-07-01-43-308313.jpg",
      hotels: [
        HotelModel(
          id: '1',
          name: 'Grand Palace Hotel',
          address: '123 Nile Corniche, Downtown, Cairo',
          rating: 4.8,
          reviewCount: 428,
          pricePerNight: 350.0,
          roomType: 'Deluxe Suite',
          checkInTime: '2:00 PM',
          checkOutTime: '12:00 PM',
          description:
              'A premium 5-star hotel in downtown Cairo offering elegant rooms and top-tier services.',
          amenities: [
            'Rooftop Pool',
            'Spa',
            'Free WiFi',
            'Restaurant',
            'Fitness Center',
          ],
          roomImages: [
            'https://picsum.photos/id/1011/400/200',
            'https://picsum.photos/id/102/400/200',
            'https://picsum.photos/id/103/400/200',
          ],
          policies: [
            'Free cancellation up to 48 hours before check-in',
            'No pets allowed',
            'Early check-in available upon request',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              title: 'Exceptional Service',
              comment:
                  'The staff went above and beyond to make our stay memorable. The view of the Nile was breathtaking.',
              date: DateTime.now().subtract(Duration(days: 15)),
              helpfulVotes: 24,
            ),
          ],
        ),
      ],
      tourismLocations: [
        TourismModel(
          id: '1',
          name: 'Pyramids of Giza',
          location: 'Giza, Egypt',
          rating: 4.9,
          numberOfRatings: 12500,
          openTime: 'Daily 8:00 AM - 5:00 PM',
          price: '200 EGP (approx. \$6.50)',
          description:
              'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
          facilities: [
            'Guided Tours',
            'Camel Rides',
            'Sound & Light Show',
            'Restrooms',
          ],
          images: [
            'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
            'https://example.com/pyramids2.jpg',
            'https://example.com/pyramids3.jpg',
          ],
          reviews: [
            ReviewModel(
              id: 'rev1',
              userId: 'user123',
              userName: 'Ahmed Mohamed',
              rating: 5,
              comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
              date: DateTime(2023, 10, 15),
              helpfulVotes: 42,
            ),
          ],
        ),
      ],
    ),
  ],
  hotels: [
    HotelModel(
      id: '4',
      name: 'Luxor Heritage Inn',
      address: 'Karnak Temple Road, Luxor',
      rating: 4.5,
      reviewCount: 276,
      pricePerNight: 220.0,
      roomType: 'Historical Suite',
      checkInTime: '2:00 PM',
      checkOutTime: '12:00 PM',
      description:
          'Located near the Karnak Temple, this hotel offers comfort and cultural immersion.',
      amenities: [
        'Temple View',
        'Cultural Tours',
        'Rooftop Restaurant',
        'Swimming Pool',
        'Gift Shop',
      ],
      roomImages: [
        'https://picsum.photos/id/1014/400/200',
        'https://picsum.photos/id/108/400/200',
        'https://picsum.photos/id/109/400/200',
      ],
      policies: [
        'Non-refundable rate available',
        'Tour packages offered',
        'Early breakfast available',
      ],
      reviews: [
        ReviewModel(
          id: 'rev5',
          userId: 'user202',
          userName: 'James Peterson',
          rating: 5,
          title: 'History at Your Doorstep',
          comment:
              'Being able to walk to Karnak Temple in minutes was incredible. The hotel has authentic Egyptian decor.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 15,
        ),
      ],
    ),
  ],
  tickets: [
    TourismModel(
      id: '1',
      name: 'Pyramids of Giza',
      location: 'Giza, Egypt',
      rating: 4.9,
      numberOfRatings: 12500,
      openTime: 'Daily 8:00 AM - 5:00 PM',
      price: '200 EGP (approx. \$6.50)',
      description:
          'The last remaining Wonder of the Ancient World, offering a glimpse into ancient Egyptian civilization.',
      facilities: [
        'Guided Tours',
        'Camel Rides',
        'Sound & Light Show',
        'Restrooms',
      ],
      images: [
        'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg',
        'https://example.com/pyramids2.jpg',
        'https://example.com/pyramids3.jpg',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
  cars: [
    CarModel(
      id: '1',
      carNumber: 'ABC123',
      name: 'Tesla Model S', // تم تغيير title إلى carName هنا
      company: 'Tesla',
      phone: '+123456789',
      price: '200',
      model: 'Model S',
      imageUrl:
          'https://crdms.images.consumerreports.org/c_lfill,w_843,q_auto,f_auto/prod/cars/cr/car-versions/23483-2022-tesla-model-x-long-range',
      description: 'Luxury electric car with high performance',
      likes: 4.9,
      location: 'California',
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
  tours: [
    TourModel(
      id: '1',
      name: 'Luxor Nile Cruise',
      description:
          '5-day Nile cruise from Luxor to Aswan with temple tours and Nubian experiences.',
      days: 5,
      people: 2,
      price: '8500',
      location: 'Luxor - Aswan',
      hostName: 'Nile Cruises Co.',
      phone: '+201001234567',
      rating: 4.9,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRrSLuRxVc_Hzf5oRcRKbl8xYy5oZnPjmRyg&s',
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user123',
          userName: 'Ahmed Mohamed',
          rating: 5,
          comment: 'Breathtaking! A must-see for everyone visiting Egypt.',
          date: DateTime(2023, 10, 15),
          helpfulVotes: 42,
        ),
      ],
    ),
  ],
);



////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
///
List<StateDataModel> egyptGovernorates = [
  // 1. Cairo
  cairo,
  // 1. Giza
  giza,
  // 2. Alexandria
  StateDataModel(
    id: '2',
    name: 'Alexandria',
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUUlF_8TMoMalZBrll4HJsXB9bP0kqL4j_Ag&s",
    hotels: [
      HotelModel(
        id: '1',
        name: 'Four Seasons Alexandria',
        address: '399 El Geish Road',
        rating: 4.9,
        reviewCount: 387,
        pricePerNight: 380.0,
        roomType: 'Sea View Room',
        checkInTime: '3:00 PM',
        checkOutTime: '12:00 PM',
        description: 'Luxury beachfront hotel with Mediterranean views.',
        amenities: ['Private Beach', 'Spa', 'Multiple Restaurants'],
        roomImages: [
          'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
          'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
        ],
        policies: ['Free cancellation', 'Pets allowed', 'Late check-out'],
        reviews: [
          ReviewModel(
            id: 'rev1',
            userId: 'user101',
            userName: 'Mahmoud Hassan',
            rating: 5,
            title: 'Perfect Getaway',
            comment: 'Spectacular sea view and impeccable service.',
            date: DateTime.now().subtract(Duration(days: 45))),
        ],
      ),
      // 5 more Alexandria hotels...
    ],
    tourismLocations: [
      TourismModel(
        id: '1',
        name: 'Bibliotheca Alexandrina',
        location: 'Al Azaritah WA Ash Shatebi',
        rating: 4.8,
        numberOfRatings: 5400,
        openTime: '10:00 AM - 7:00 PM',
        price: '70 EGP',
        description: 'Modern commemoration of the ancient Library of Alexandria.',
        facilities: ['Library Tours', 'Museums', 'Planetarium'],
        images: [
          'https://images.unsplash.com/photo-1589998059171-988d887df646',
          'https://images.unsplash.com/photo-1589998059171-988d887df646',
        ],
        reviews: [
          ReviewModel(
            id: 'rev1',
            userId: 'user202',
            userName: 'Nadia Kamel',
            rating: 5,
            comment: 'Architectural masterpiece with incredible collections.',
            date: DateTime(2023, 8, 12)),
        ],
      ),
      // 5 more Alexandria attractions...
    ],
  ),

  // 3. Luxor
  StateDataModel(
    id: '3',
    name: 'Luxor',
    image: "https://www.egypttourpackages.com/data1/images/2-Day-Tour-to-Luxor-from-El-Quseir/1.jpg",
    hotels: [
      // 6 Luxor hotels...
    ],
    tourismLocations: [
      // 6 Luxor attractions...
    ],
  ),

  // 4. Aswan
  StateDataModel(
    id: '4',
    name: 'Aswan',
    image: "https://images.unsplash.com/photo-1473580044384-7ba9967e16a0",
    hotels: [
      // 6 Aswan hotels...
    ],
    tourismLocations: [
      // 6 Aswan attractions...
    ],
  ),

  // 5. Sharm El Sheikh
  StateDataModel(
    id: '5',
    name: 'Sharm El Sheikh',
    image: "https://images.unsplash.com/photo-1566073771259-6a8506099945",
    hotels: [
      // 6 Sharm hotels...
    ],
    tourismLocations: [
      // 6 Sharm attractions...
    ],
  ),

  // 6. Hurghada
  StateDataModel(
    id: '6',
    name: 'Hurghada',
    image: "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b",
    hotels: [
      // 6 Hurghada hotels...
    ],
    tourismLocations: [
      // 6 Hurghada attractions...
    ],
  ),

  // 7. Dahab
  StateDataModel(
    id: '7',
    name: 'Dahab',
    image: "https://images.unsplash.com/photo-1564501049412-61c2a3083791",
    hotels: [
      // 6 Dahab hotels...
    ],
    tourismLocations: [
      // 6 Dahab attractions...
    ],
  ),

  // 8. Marsa Alam
  StateDataModel(
    id: '8',
    name: 'Marsa Alam',
    image: "https://images.unsplash.com/photo-1535827841776-24afc1e255ac",
    hotels: [
      // 6 Marsa Alam hotels...
    ],
    tourismLocations: [
      // 6 Marsa Alam attractions...
    ],
  ),

  // 9. Siwa Oasis
  StateDataModel(
    id: '9',
    name: 'Siwa Oasis',
    image: "https://images.unsplash.com/photo-1578683010236-d716f9a3f461",
    hotels: [
      // 6 Siwa hotels...
    ],
    tourismLocations: [
      // 6 Siwa attractions...
    ],
  ),

  // 10. Port Said
  StateDataModel(
    id: '10',
    name: 'Port Said',
    image: "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4",
    hotels: [
      // 6 Port Said hotels...
    ],
    tourismLocations: [
      // 6 Port Said attractions...
    ],
  ),
];

StateDataModel giza = StateDataModel(
  id: '11',
  name: 'Giza',
  image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUXmUPseOpcLbekTnacjeBRczPZU_NFsPxIQ&s", // Great Pyramid image
  hotels: [
    HotelModel(
      id: '1',
      name: 'Marriott Mena House',
      address: '6 Pyramids Road, Giza',
      rating: 4.8,
      reviewCount: 842,
      pricePerNight: 320.0,
      roomType: 'Pyramid View Room',
      checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Legendary hotel with direct views of the Pyramids from its lush gardens.',
      amenities: [
        'Outdoor Pool',
        'Golf Course',
        'Spa',
        '3 Restaurants',
        'Free WiFi',
        '24-hour Room Service'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
      ],
      policies: [
        'Free cancellation up to 72 hours',
        'No pets allowed',
        'Early check-in available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user101',
          userName: 'Sarah Johnson',
          rating: 5,
          title: 'Magical Pyramid Views',
          comment: 'Waking up to the pyramids outside our window was unforgettable. Service was impeccable.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 42,
        ),
      ],
    ),
    HotelModel(
      id: '2',
      name: 'Pyramids View Inn',
      address: '10 Sphinx Street, Giza',
      rating: 4.5,
      reviewCount: 527,
      pricePerNight: 180.0,
      roomType: 'Standard Double',
      checkInTime: '2:00 PM',
      checkOutTime: '11:00 AM',
      description: 'Budget-friendly hotel with rooftop views of the pyramids.',
      amenities: [
        'Rooftop Terrace',
        'Free Breakfast',
        'Air Conditioning',
        'Airport Shuttle'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4',
        'https://images.unsplash.com/photo-1535827841776-24afc1e255ac',
      ],
      policies: [
        'Non-refundable',
        'No smoking',
        'Credit card required'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user202',
          userName: 'Mohamed Ali',
          rating: 4,
          title: 'Great Value',
          comment: 'For the price, the pyramid view can\'t be beat. Basic but clean rooms.',
          date: DateTime.now().subtract(Duration(days: 45))),
      ],
    ),
    HotelModel(
      id: '3',
      name: 'Steigenberger Cairo Pyramids',
      address: '60 Cairo-Alexandria Desert Road',
      rating: 4.7,
      reviewCount: 689,
      pricePerNight: 280.0,
      roomType: 'Deluxe Room',
checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Legendary hotel with direct views of the Pyramids from its lush gardens.',
      amenities: [
        'Outdoor Pool',
        'Golf Course',
        'Spa',
        '3 Restaurants',
        'Free WiFi',
        '24-hour Room Service'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
      ],
      policies: [
        'Free cancellation up to 72 hours',
        'No pets allowed',
        'Early check-in available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user101',
          userName: 'Sarah Johnson',
          rating: 5,
          title: 'Magical Pyramid Views',
          comment: 'Waking up to the pyramids outside our window was unforgettable. Service was impeccable.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 42,
        ),
      ],
      
        ),
    HotelModel(
      id: '4',
      name: 'Le Méridien Pyramids',
      address: 'El Remaya Square, Giza',
      rating: 4.6,
      reviewCount: 732,
      checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Legendary hotel with direct views of the Pyramids from its lush gardens.',
      amenities: [
        'Outdoor Pool',
        'Golf Course',
        'Spa',
        '3 Restaurants',
        'Free WiFi',
        '24-hour Room Service'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
      ],
      policies: [
        'Free cancellation up to 72 hours',
        'No pets allowed',
        'Early check-in available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user101',
          userName: 'Sarah Johnson',
          rating: 5,
          title: 'Magical Pyramid Views',
          comment: 'Waking up to the pyramids outside our window was unforgettable. Service was impeccable.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 42,
        ),
      ],
      pricePerNight:280.0,
      roomType: 'Deluxe Room',
      
      ),
    HotelModel(
      id: '5',
      name: 'Sofitel Cairo Nile El Gezirah',
      address: '3 El Thawra Council St.',
      rating: 4.8,
      reviewCount: 915,
checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Legendary hotel with direct views of the Pyramids from its lush gardens.',
      amenities: [
        'Outdoor Pool',
        'Golf Course',
        'Spa',
        '3 Restaurants',
        'Free WiFi',
        '24-hour Room Service'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
      ],
      policies: [
        'Free cancellation up to 72 hours',
        'No pets allowed',
        'Early check-in available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user101',
          userName: 'Sarah Johnson',
          rating: 5,
          title: 'Magical Pyramid Views',
          comment: 'Waking up to the pyramids outside our window was unforgettable. Service was impeccable.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 42,
        ),
      ],
            pricePerNight:280.0,
      roomType: 'Deluxe Room',
        ),
    HotelModel(
      id: '6',
      name: 'Barcelo Cairo Pyramids',
      address: '229 Al Ahram Street',
      rating: 4.4,
      reviewCount: 421,
checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Legendary hotel with direct views of the Pyramids from its lush gardens.',
      amenities: [
        'Outdoor Pool',
        'Golf Course',
        'Spa',
        '3 Restaurants',
        'Free WiFi',
        '24-hour Room Service'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
      ],
      policies: [
        'Free cancellation up to 72 hours',
        'No pets allowed',
        'Early check-in available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user101',
          userName: 'Sarah Johnson',
          rating: 5,
          title: 'Magical Pyramid Views',
          comment: 'Waking up to the pyramids outside our window was unforgettable. Service was impeccable.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 42,
        ),
      ],
              pricePerNight:280.0,
      roomType: 'Deluxe Room',
        ),
    HotelModel(
      id: '7',
      name: 'Oasis Hotel Giza',
      address: '16 Gamal Abdel Nasser St.',
      rating: 4.2,
      reviewCount: 387,
checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Legendary hotel with direct views of the Pyramids from its lush gardens.',
      amenities: [
        'Outdoor Pool',
        'Golf Course',
        'Spa',
        '3 Restaurants',
        'Free WiFi',
        '24-hour Room Service'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
      ],
      policies: [
        'Free cancellation up to 72 hours',
        'No pets allowed',
        'Early check-in available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user101',
          userName: 'Sarah Johnson',
          rating: 5,
          title: 'Magical Pyramid Views',
          comment: 'Waking up to the pyramids outside our window was unforgettable. Service was impeccable.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 42,
        ),
      ],
            pricePerNight:280.0,
      roomType: 'Deluxe Room',
      ),
    HotelModel(
      id: '8',
      name: 'Pyramids Park Resort',
      address: 'Alexandria Desert Road',
      rating: 4.3,
      reviewCount: 512,
checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Legendary hotel with direct views of the Pyramids from its lush gardens.',
      amenities: [
        'Outdoor Pool',
        'Golf Course',
        'Spa',
        '3 Restaurants',
        'Free WiFi',
        '24-hour Room Service'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
      ],
      policies: [
        'Free cancellation up to 72 hours',
        'No pets allowed',
        'Early check-in available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user101',
          userName: 'Sarah Johnson',
          rating: 5,
          title: 'Magical Pyramid Views',
          comment: 'Waking up to the pyramids outside our window was unforgettable. Service was impeccable.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 42,
        ),
      ],
              pricePerNight:280.0,
      roomType: 'Deluxe Room',
        ),
    HotelModel(
      id: '9',
      name: 'Tolip Hotel Giza',
      address: 'El Ahram Street',
      rating: 4.1,
      reviewCount: 298,
checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Legendary hotel with direct views of the Pyramids from its lush gardens.',
      amenities: [
        'Outdoor Pool',
        'Golf Course',
        'Spa',
        '3 Restaurants',
        'Free WiFi',
        '24-hour Room Service'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
      ],
      policies: [
        'Free cancellation up to 72 hours',
        'No pets allowed',
        'Early check-in available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user101',
          userName: 'Sarah Johnson',
          rating: 5,
          title: 'Magical Pyramid Views',
          comment: 'Waking up to the pyramids outside our window was unforgettable. Service was impeccable.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 42,
        ),
      ],
              pricePerNight:280.0,
      roomType: 'Deluxe Room',
        ),
    HotelModel(
      id: '10',
      name: 'Sphinx Guest House',
      address: '25 Abou Al Hool Al Seiahi',
      rating: 4.0,
      reviewCount: 156,
checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Legendary hotel with direct views of the Pyramids from its lush gardens.',
      amenities: [
        'Outdoor Pool',
        'Golf Course',
        'Spa',
        '3 Restaurants',
        'Free WiFi',
        '24-hour Room Service'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
      ],
      policies: [
        'Free cancellation up to 72 hours',
        'No pets allowed',
        'Early check-in available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user101',
          userName: 'Sarah Johnson',
          rating: 5,
          title: 'Magical Pyramid Views',
          comment: 'Waking up to the pyramids outside our window was unforgettable. Service was impeccable.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 42,
        ),
      ],
              pricePerNight:280.0,
      roomType: 'Deluxe Room',
        ),
  ],
  tourismLocations: [
    TourismModel(
      id: '1',
      name: 'Great Pyramid of Giza',
      location: 'Giza Plateau',
      rating: 4.9,
      numberOfRatings: 18600,
      openTime: '8:00 AM - 5:00 PM',
      price: '200 EGP',
      description: 'The oldest and largest of the three pyramids in the Giza complex, built as a tomb for Pharaoh Khufu.',
      facilities: [
        'Guided Tours',
        'Camel Rides',
        'Restrooms',
        'Souvenir Shops'
      ],
      images: [
        'https://images.unsplash.com/photo-1503177119275-0aa32b3a9368',
        'https://images.unsplash.com/photo-1526666923127-b2970f64b422',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user303',
          userName: 'David Wilson',
          rating: 5,
          comment: 'Absolutely awe-inspiring. The scale is hard to comprehend until you stand next to it.',
          date: DateTime(2023, 11, 15)),
      ],
    ),
    TourismModel(
      id: '2',
      name: 'Great Sphinx',
      location: 'Giza Plateau',
      rating: 4.8,
      numberOfRatings: 14200,
      openTime: '8:00 AM - 5:00 PM',
      price: 'Included with Pyramid ticket',
      description: 'The mythical limestone statue with the body of a lion and head of a human, dating back to 2500 BC.',
      facilities: [
        'Photo Spots',
        'Guided Tours',
        'Nearby Cafeteria'
      ],
      images: [
        'https://images.unsplash.com/photo-1572252009286-9f9a67b3ac38',
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user404',
          userName: 'Layla Hassan',
          rating: 5,
          comment: 'The Sphinx is smaller than I imagined but still magnificent. Go early to avoid crowds!',
          date: DateTime(2023, 10, 22)),
      ],
    ),
    TourismModel(
      id: '3',
      name: 'Pyramid of Khafre',
      location: 'Giza Plateau',
      rating: 4.7,
      numberOfRatings: 8700,
openTime: '8:00 AM - 5:00 PM',
      price: 'Included with Pyramid ticket',
      description: 'The mythical limestone statue with the body of a lion and head of a human, dating back to 2500 BC.',
      facilities: [
        'Photo Spots',
        'Guided Tours',
        'Nearby Cafeteria'
      ],
      images: [
        'https://images.unsplash.com/photo-1572252009286-9f9a67b3ac38',
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user404',
          userName: 'Layla Hassan',
          rating: 5,
          comment: 'The Sphinx is smaller than I imagined but still magnificent. Go early to avoid crowds!',
          date: DateTime(2023, 10, 22)),
      ],
        ),
    TourismModel(
      id: '4',
      name: 'Pyramid of Menkaure',
      location: 'Giza Plateau',
      rating: 4.6,
      numberOfRatings: 6200,
openTime: '8:00 AM - 5:00 PM',
      price: 'Included with Pyramid ticket',
      description: 'The mythical limestone statue with the body of a lion and head of a human, dating back to 2500 BC.',
      facilities: [
        'Photo Spots',
        'Guided Tours',
        'Nearby Cafeteria'
      ],
      images: [
        'https://images.unsplash.com/photo-1572252009286-9f9a67b3ac38',
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user404',
          userName: 'Layla Hassan',
          rating: 5,
          comment: 'The Sphinx is smaller than I imagined but still magnificent. Go early to avoid crowds!',
          date: DateTime(2023, 10, 22)),
      ],
        ),
    TourismModel(
      id: '5',
      name: 'Giza Solar Boat Museum',
      location: 'Near Great Pyramid',
      rating: 4.4,
      numberOfRatings: 3100,
openTime: '8:00 AM - 5:00 PM',
      price: 'Included with Pyramid ticket',
      description: 'The mythical limestone statue with the body of a lion and head of a human, dating back to 2500 BC.',
      facilities: [
        'Photo Spots',
        'Guided Tours',
        'Nearby Cafeteria'
      ],
      images: [
        'https://images.unsplash.com/photo-1572252009286-9f9a67b3ac38',
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user404',
          userName: 'Layla Hassan',
          rating: 5,
          comment: 'The Sphinx is smaller than I imagined but still magnificent. Go early to avoid crowds!',
          date: DateTime(2023, 10, 22)),
      ],
        ),
    TourismModel(
      id: '6',
      name: 'Sound & Light Show',
      location: 'Giza Plateau',
      rating: 4.3,
      numberOfRatings: 5800,
openTime: '8:00 AM - 5:00 PM',
      price: 'Included with Pyramid ticket',
      description: 'The mythical limestone statue with the body of a lion and head of a human, dating back to 2500 BC.',
      facilities: [
        'Photo Spots',
        'Guided Tours',
        'Nearby Cafeteria'
      ],
      images: [
        'https://images.unsplash.com/photo-1572252009286-9f9a67b3ac38',
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user404',
          userName: 'Layla Hassan',
          rating: 5,
          comment: 'The Sphinx is smaller than I imagined but still magnificent. Go early to avoid crowds!',
          date: DateTime(2023, 10, 22)),
      ],
        ),
    TourismModel(
      id: '7',
      name: 'Grand Egyptian Museum',
      location: 'Giza Plateau',
      rating: 4.8,
      numberOfRatings: 9200,
openTime: '8:00 AM - 5:00 PM',
      price: 'Included with Pyramid ticket',
      description: 'The mythical limestone statue with the body of a lion and head of a human, dating back to 2500 BC.',
      facilities: [
        'Photo Spots',
        'Guided Tours',
        'Nearby Cafeteria'
      ],
      images: [
        'https://images.unsplash.com/photo-1572252009286-9f9a67b3ac38',
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user404',
          userName: 'Layla Hassan',
          rating: 5,
          comment: 'The Sphinx is smaller than I imagined but still magnificent. Go early to avoid crowds!',
          date: DateTime(2023, 10, 22)),
      ],
        ),
    TourismModel(
      id: '8',
      name: 'Camel Riding at Pyramids',
      location: 'Around Giza Complex',
      rating: 4.2,
      numberOfRatings: 4700,
openTime: '8:00 AM - 5:00 PM',
      price: 'Included with Pyramid ticket',
      description: 'The mythical limestone statue with the body of a lion and head of a human, dating back to 2500 BC.',
      facilities: [
        'Photo Spots',
        'Guided Tours',
        'Nearby Cafeteria'
      ],
      images: [
        'https://images.unsplash.com/photo-1572252009286-9f9a67b3ac38',
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user404',
          userName: 'Layla Hassan',
          rating: 5,
          comment: 'The Sphinx is smaller than I imagined but still magnificent. Go early to avoid crowds!',
          date: DateTime(2023, 10, 22)),
      ],
        ),
    TourismModel(
      id: '9',
      name: 'Giza Plateau Panoramic Viewpoint',
      location: 'Desert Side',
      rating: 4.7,
      numberOfRatings: 3800,
openTime: '8:00 AM - 5:00 PM',
      price: 'Included with Pyramid ticket',
      description: 'The mythical limestone statue with the body of a lion and head of a human, dating back to 2500 BC.',
      facilities: [
        'Photo Spots',
        'Guided Tours',
        'Nearby Cafeteria'
      ],
      images: [
        'https://images.unsplash.com/photo-1572252009286-9f9a67b3ac38',
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user404',
          userName: 'Layla Hassan',
          rating: 5,
          comment: 'The Sphinx is smaller than I imagined but still magnificent. Go early to avoid crowds!',
          date: DateTime(2023, 10, 22)),
      ],
        ),
    TourismModel(
      id: '10',
      name: 'Khufu Ship Museum',
      location: 'Southern Side of Great Pyramid',
      rating: 4.1,
      numberOfRatings: 2100,
openTime: '8:00 AM - 5:00 PM',
      price: 'Included with Pyramid ticket',
      description: 'The mythical limestone statue with the body of a lion and head of a human, dating back to 2500 BC.',
      facilities: [
        'Photo Spots',
        'Guided Tours',
        'Nearby Cafeteria'
      ],
      images: [
        'https://images.unsplash.com/photo-1572252009286-9f9a67b3ac38',
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user404',
          userName: 'Layla Hassan',
          rating: 5,
          comment: 'The Sphinx is smaller than I imagined but still magnificent. Go early to avoid crowds!',
          date: DateTime(2023, 10, 22)),
      ],
        ),
  ],
);

StateDataModel cairo = StateDataModel(
  id: '1',
  name: 'Cairo',
  image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLDJJAwRiKE3IgX-DJYpZOikfNNjx10mUPB2y8xcd4zzqR1wtlm2zQgA1CTxBTcNfvaTU&usqp=CAU", // Cairo skyline image
  hotels: [
    HotelModel(
      id: '1',
      name: 'Four Seasons Hotel Cairo at Nile Plaza',
      address: '1089 Corniche El Nil, Garden City',
      rating: 4.9,
      reviewCount: 1245,
      pricePerNight: 450.0,
      roomType: 'Nile View Suite',
      checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Luxury 5-star hotel offering breathtaking Nile River views and world-class amenities in the heart of Cairo.',
      amenities: [
        'Infinity Pool',
        'Spa & Wellness Center',
        '6 Restaurants',
        '24-hour Fitness Center',
        'Business Facilities',
        'Free WiFi'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
      ],
      policies: [
        'Free cancellation up to 72 hours',
        'Pets allowed (additional charge)',
        'Early check-in subject to availability'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user101',
          userName: 'Sarah Johnson',
          rating: 5,
          title: 'Exceptional Luxury Experience',
          comment: 'The Nile view from our room was spectacular. Service was impeccable throughout our stay.',
          date: DateTime.now().subtract(Duration(days: 30)),
          helpfulVotes: 87,
        ),
      ],
    ),
    HotelModel(
      id: '2',
      name: 'The Nile Ritz-Carlton',
      address: '1113 Corniche El Nil, Downtown',
      rating: 4.8,
      reviewCount: 982,
      pricePerNight: 420.0,
      roomType: 'Executive Room',
      checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Iconic luxury hotel with panoramic Nile views and direct access to the Egyptian Museum.',
      amenities: [
        'Rooftop Pool',
        '5 Dining Outlets',
        'Luxury Spa',
        '24-hour Butler Service',
        'Business Center'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4',
        'https://images.unsplash.com/photo-1535827841776-24afc1e255ac',
      ],
      policies: [
        'Free cancellation up to 48 hours',
        'Non-smoking rooms',
        'Late check-out available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user202',
          userName: 'Michael Brown',
          rating: 5,
          title: 'Perfect Location',
          comment: 'Walking distance to the Egyptian Museum. Staff went above and beyond to make our stay memorable.',
          date: DateTime.now().subtract(Duration(days: 45))),
      ],
    ),
    HotelModel(
      id: '3',
      name: 'Kempinski Nile Hotel Cairo',
      address: '12 Ahmed Ragheb Street, Garden City',
      rating: 4.7,
      reviewCount: 756,
      pricePerNight: 380.0,
      roomType: 'Deluxe Room',
      checkInTime: '2:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Elegant European-style luxury hotel with stunning Nile River views and exceptional service.',
      amenities: [
        'Rooftop Pool',
        '3 Restaurants',
        'Spa & Wellness Center',
        'Fitness Center',
        'Free WiFi'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1578683010236-d716f9a3f461',
        'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4',
      ],
      policies: [
        'Free cancellation up to 24 hours',
        'Pets not allowed',
        'Early check-in available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user303',
          userName: 'Layla Hassan',
          rating: 4,
          title: 'Beautiful Rooftop',
          comment: 'The rooftop pool area has amazing views of the Nile. Rooms are spacious and comfortable.',
          date: DateTime.now().subtract(Duration(days: 60))),
      ],
    ),
    HotelModel(
      id: '4',
      name: 'InterContinental Cairo Semiramis',
      address: 'Corniche El Nil, Garden City',
      rating: 4.6,
      reviewCount: 892,
      pricePerNight: 350.0,
      roomType: 'Classic Room',
      checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Legendary hotel with prime Nile River location and rich history dating back to 1907.',
      amenities: [
        'Outdoor Pool',
        '6 Restaurants',
        'Spa & Fitness Center',
        'Business Facilities',
        'Free WiFi'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4',
        'https://images.unsplash.com/photo-1535827841776-24afc1e255ac',
      ],
      policies: [
        'Free cancellation up to 48 hours',
        'Pets allowed (additional charge)',
        'Late check-out available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user404',
          userName: 'Omar Hassan',
          rating: 4,
          title: 'Historic Luxury',
          comment: 'The perfect blend of historic charm and modern amenities. Great central location.',
          date: DateTime.now().subtract(Duration(days: 75))),
      ],
    ),
    HotelModel(
      id: '5',
      name: 'Fairmont Nile City',
      address: 'Nile City Towers, Corniche El Nil',
      rating: 4.8,
      reviewCount: 674,
      pricePerNight: 390.0,
      roomType: 'Gold Room',
      checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Contemporary luxury hotel in the Nile City Towers complex with spectacular city and Nile views.',
      amenities: [
        'Infinity Pool',
        '8 Dining Outlets',
        'Spa & Wellness Center',
        'Business Center',
        '24-hour Room Service'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1535827841776-24afc1e255ac',
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
      ],
      policies: [
        'Free cancellation up to 72 hours',
        'Non-smoking rooms',
        'Early check-in available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user505',
          userName: 'Youssef Ahmed',
          rating: 5,
          title: 'Spectacular Views',
          comment: 'The infinity pool on the 31st floor offers breathtaking panoramic views of Cairo.',
          date: DateTime.now().subtract(Duration(days: 90))),
      ],
    ),
    HotelModel(
      id: '6',
      name: 'Conrad Cairo',
      address: '1191 Corniche El Nil, Downtown',
      rating: 4.5,
      reviewCount: 543,
      pricePerNight: 320.0,
      roomType: 'Executive Room',
      checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Modern high-rise hotel with Nile River views and excellent business facilities.',
      amenities: [
        'Outdoor Pool',
        '4 Restaurants',
        'Spa & Fitness Center',
        'Business Center',
        'Free WiFi'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
        'https://images.unsplash.com/photo-1578683010236-d716f9a3f461',
      ],
      policies: [
        'Free cancellation up to 24 hours',
        'Pets not allowed',
        'Late check-out available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user606',
          userName: 'Nadia Samir',
          rating: 4,
          title: 'Great Business Hotel',
          comment: 'Excellent facilities for business travelers. Comfortable rooms and good dining options.',
          date: DateTime.now().subtract(Duration(days: 105))),
      ],
    ),
    HotelModel(
      id: '7',
      name: 'Sofitel Cairo El Gezirah',
      address: '3 El Thawra Council St., Zamalek',
      rating: 4.6,
      reviewCount: 487,
      pricePerNight: 360.0,
      roomType: 'Luxury Room',
      checkInTime: '2:00 PM',
      checkOutTime: '12:00 PM',
      description: 'French-inspired luxury hotel on Gezira Island with panoramic views of Cairo and the Nile.',
      amenities: [
        'Outdoor Pool',
        '5 Restaurants',
        'Spa & Fitness Center',
        'Business Facilities',
        'Free WiFi'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
        'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4',
      ],
      policies: [
        'Free cancellation up to 48 hours',
        'Pets allowed (additional charge)',
        'Early check-in available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user707',
          userName: 'Mona Adel',
          rating: 5,
          title: 'Elegant French Touch',
          comment: 'Beautiful blend of French elegance and Egyptian hospitality. The views from the tower rooms are unmatched.',
          date: DateTime.now().subtract(Duration(days: 120))),
      ],
    ),
    HotelModel(
      id: '8',
      name: 'Hilton Cairo Zamalek Residences',
      address: '21 Mohamed Mazhar Street, Zamalek',
      rating: 4.4,
      reviewCount: 398,
      pricePerNight: 290.0,
      roomType: 'One-Bedroom Apartment',
      checkInTime: '3:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Apartment-style accommodations in upscale Zamalek district with full kitchen facilities.',
      amenities: [
        'Outdoor Pool',
        'Fitness Center',
        'Free WiFi',
        'Kitchen Facilities',
        'Laundry Services'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1535827841776-24afc1e255ac',
        'https://images.unsplash.com/photo-1578683010236-d716f9a3f461',
      ],
      policies: [
        'Free cancellation up to 72 hours',
        'Pets allowed (additional charge)',
        'Late check-out available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user808',
          userName: 'Ahmed Farouk',
          rating: 4,
          title: 'Great for Extended Stays',
          comment: 'Perfect for families or long stays with full kitchen and separate living area.',
          date: DateTime.now().subtract(Duration(days: 135))),
      ],
    ),
    HotelModel(
      id: '9',
      name: 'Novotel Cairo Airport',
      address: 'Airport Road, Heliopolis',
      rating: 4.2,
      reviewCount: 321,
      pricePerNight: 180.0,
      roomType: 'Standard Room',
      checkInTime: '2:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Convenient airport hotel with soundproofed rooms and free shuttle service.',
      amenities: [
        'Outdoor Pool',
        'Restaurant',
        'Fitness Center',
        'Free Airport Shuttle',
        'Free WiFi'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
      ],
      policies: [
        'Free cancellation up to 24 hours',
        'Pets not allowed',
        'Early check-in available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user909',
          userName: 'John Smith',
          rating: 4,
          title: 'Convenient Airport Stay',
          comment: 'Perfect for early flights. Rooms are quiet despite airport location.',
          date: DateTime.now().subtract(Duration(days: 150))),
      ],
    ),
    HotelModel(
      id: '10',
      name: 'Tolip Golden Plaza Hotel',
      address: '2 El Nasr Road, New Cairo',
      rating: 4.1,
      reviewCount: 276,
      pricePerNight: 150.0,
      roomType: 'Standard Double',
      checkInTime: '2:00 PM',
      checkOutTime: '12:00 PM',
      description: 'Comfortable business hotel in New Cairo with modern amenities and conference facilities.',
      amenities: [
        'Outdoor Pool',
        '2 Restaurants',
        'Fitness Center',
        'Business Center',
        'Free WiFi'
      ],
      roomImages: [
        'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4',
        'https://images.unsplash.com/photo-1535827841776-24afc1e255ac',
      ],
      policies: [
        'Non-refundable',
        'Pets not allowed',
        'Late check-out available'
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user1010',
          userName: 'Mark Johnson',
          rating: 3,
          title: 'Good Value',
          comment: 'Basic but clean accommodations. Good option for business travelers in New Cairo.',
          date: DateTime.now().subtract(Duration(days: 165))),
      ],
    ),
  ],
  tourismLocations: [
    TourismModel(
      id: '1',
      name: 'The Egyptian Museum',
      location: 'Tahrir Square, Downtown Cairo',
      rating: 4.8,
      numberOfRatings: 15600,
      openTime: '9:00 AM - 5:00 PM (Closed Fridays)',
      price: '200 EGP (approx. \$6.50)',
      description: 'Home to the world\'s most extensive collection of Pharaonic antiquities, including the treasures of Tutankhamun.',
      facilities: [
        'Guided Tours',
        'Audio Guides',
        'Gift Shop',
        'Cafeteria',
        'Wheelchair Access'
      ],
      images: [
        'https://mlrhpz8jmuut.i.optimole.com/cb:w8qn.502d1/w:auto/h:auto/q:mauto/f:best/ig:avif/id:470c9a1cacabeafd3b9882440ea9e3b3/https://www.egypttoursplus.com/The-Museum-of-Egyptian-Antiquities-also-known-as-The-Egyptian-Museum.jpg',
        'https://images.unsplash.com/photo-1576808907331-3b4c6c7c0a8f',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user111',
          userName: 'Emma Wilson',
          rating: 5,
          comment: 'Absolutely breathtaking collection. The Tutankhamun galleries alone are worth the visit!',
          date: DateTime(2023, 11, 20)),
      ],
    ),
    TourismModel(
      id: '2',
      name: 'Khan el-Khalili Bazaar',
      location: 'Islamic Cairo',
      rating: 4.6,
      numberOfRatings: 9800,
      openTime: '9:00 AM - 11:00 PM (Varies by shop)',
      price: 'Free entry',
      description: 'Historic market dating back to 1382, offering everything from spices and jewelry to antiques and souvenirs.',
      facilities: [
        'Traditional Cafés',
        'Money Exchange',
        'Restrooms',
        'ATMs'
      ],
      images: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRrUzzbE-leYmu3EOrRtzu7nzg-4aHXTm7Fe5gdJOoIALOEM_L-H5f6ZM&usqp=CAE&s',
        'https://images.unsplash.com/photo-1589998059171-988d887df646',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user222',
          userName: 'Ahmed Hassan',
          rating: 4,
          comment: 'The soul of old Cairo. Haggle for best prices and don\'t miss the famous El Fishawy Café.',
          date: DateTime(2023, 10, 15)),
      ],
    ),
    TourismModel(
      id: '3',
      name: 'Saladin Citadel',
      location: 'Mokattam Hill',
      rating: 4.7,
      numberOfRatings: 8700,
      openTime: '8:00 AM - 5:00 PM',
      price: '180 EGP',
      description: 'Medieval Islamic fortification with the stunning Muhammad Ali Mosque and panoramic views over Cairo.',
      facilities: [
        'Guided Tours',
        'Museums',
        'Restrooms',
        'Souvenir Shops'
      ],
      images: [
        'https://images.squarespace-cdn.com/content/v1/5f56423f4aca615934476295/1636618598798-W4UHMXZJXLLJ853B3KCW/Citadel+3.jpg',
        'https://images.unsplash.com/photo-1572252009286-9f9a67b3ac38',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user333',
          userName: 'Sophie Martin',
          rating: 5,
          comment: 'The alabaster mosque is stunning. Best views of Cairo from the walls!',
          date: DateTime(2023, 9, 10)),
      ],
    ),
    TourismModel(
      id: '4',
      name: 'Coptic Cairo',
      location: 'Old Cairo',
      rating: 4.5,
      numberOfRatings: 5400,
      openTime: '9:00 AM - 4:00 PM',
      price: 'Free (Donations welcome)',
      description: 'Historic center of Christianity in Egypt with ancient churches including the Hanging Church and Coptic Museum.',
      facilities: [
        'Guided Tours',
        'Museum',
        'Restrooms',
        'Gift Shops'
      ],
      images: [
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0',
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user444',
          userName: 'George Michael',
          rating: 4,
          comment: 'Fascinating glimpse into Egypt\'s Christian heritage. The Hanging Church is architectural marvel.',
          date: DateTime(2023, 8, 5)),
      ],
    ),
    TourismModel(
      id: '5',
      name: 'Al-Azhar Park',
      location: 'Darrasa, Islamic Cairo',
      rating: 4.6,
      numberOfRatings: 6200,
      openTime: '9:00 AM - 12:00 AM',
      price: '25 EGP',
      description: 'Beautifully landscaped park built on historic ruins, offering green spaces and stunning city views.',
      facilities: [
        'Restaurants',
        'Walking Paths',
        'Playgrounds',
        'Fountains'
      ],
      images: [
        'https://images.unsplash.com/photo-1566073771259-6a8506099945',
        'https://images.unsplash.com/photo-1566073771259-6a8506099945',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user555',
          userName: 'Nadia Kamel',
          rating: 5,
          comment: 'Peaceful oasis in the heart of Cairo. Perfect for sunset views over the city.',
          date: DateTime(2023, 7, 20)),
      ],
    ),
    TourismModel(
      id: '6',
      name: 'Cairo Tower',
      location: 'Zamalek, Gezira Island',
      rating: 4.3,
      numberOfRatings: 4800,
      openTime: '8:00 AM - 12:00 AM',
      price: '150 EGP',
      description: '185m tall tower offering 360-degree panoramic views of Cairo from its observation deck.',
      facilities: [
        'Observation Deck',
        'Revolving Restaurant',
        'Gift Shop'
      ],
      images: [
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
        'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user666',
          userName: 'Youssef Ahmed',
          rating: 4,
          comment: 'Best views in Cairo, especially at sunset. The revolving restaurant is worth trying.',
          date: DateTime(2023, 6, 15)),
      ],
    ),
    TourismModel(
      id: '7',
      name: 'Manial Palace Museum',
      location: 'Roda Island',
      rating: 4.4,
      numberOfRatings: 3200,
      openTime: '9:00 AM - 5:00 PM',
      price: '100 EGP',
      description: 'Former royal palace showcasing Islamic architecture and art collections from different periods.',
      facilities: [
        'Guided Tours',
        'Gardens',
        'Gift Shop'
      ],
      images: [
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user777',
          userName: 'Lina Magdy',
          rating: 4,
          comment: 'Hidden gem! The palace gardens and architecture are stunning examples of Islamic design.',
          date: DateTime(2023, 5, 10)),
      ],
    ),
    TourismModel(
      id: '8',
      name: 'Nilometer',
      location: 'Roda Island',
      rating: 4.2,
      numberOfRatings: 1800,
      openTime: '9:00 AM - 4:00 PM',
      price: '60 EGP',
      description: 'Ancient structure used to measure the Nile\'s water levels and predict floods, dating back to 861 AD.',
      facilities: [
        'Information Panels',
        'Guided Tours'
      ],
      images: [
        'https://images.unsplash.com/photo-1578683010236-d716f9a3f461',
        'https://images.unsplash.com/photo-1578683010236-d716f9a3f461',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user888',
          userName: 'Omar Sharif',
          rating: 4,
          comment: 'Fascinating piece of ancient engineering. Small but historically significant site.',
          date: DateTime(2023, 4, 5)),
      ],
    ),
    TourismModel(
      id: '9',
      name: 'Museum of Islamic Art',
      location: 'Bab El Khalq, Downtown',
      rating: 4.5,
      numberOfRatings: 2900,
      openTime: '9:00 AM - 5:00 PM',
      price: '120 EGP',
      description: 'World-class collection of Islamic artifacts spanning 1400 years from across the Muslim world.',
      facilities: [
        'Guided Tours',
        'Audio Guides',
        'Gift Shop',
        'Café'
      ],
      images: [
        'https://images.unsplash.com/photo-1535827841776-24afc1e255ac',
        'https://images.unsplash.com/photo-1535827841776-24afc1e255ac',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user999',
          userName: 'Fatma Ibrahim',
          rating: 5,
          comment: 'Exceptional collection beautifully displayed. The woodwork and textiles galleries are highlights.',
          date: DateTime(2023, 3, 20)),
      ],
    ),
    TourismModel(
      id: '10',
      name: 'Al-Muizz Street',
      location: 'Islamic Cairo',
      rating: 4.6,
      numberOfRatings: 4100,
      openTime: '24 hours',
      price: 'Free',
      description: 'One of Cairo\'s oldest streets, lined with stunning medieval Islamic architecture and historic mosques.',
      facilities: [
        'Guided Tours',
        'Restaurants',
        'Souvenir Shops'
      ],
      images: [
        'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4',
        'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4',
      ],
      reviews: [
        ReviewModel(
          id: 'rev1',
          userId: 'user1010',
          userName: 'Karim Adel',
          rating: 5,
          comment: 'Walking through history! The restored buildings are spectacular, especially at night.',
          date: DateTime(2023, 2, 15)),
      ],
    ),
  ],
);