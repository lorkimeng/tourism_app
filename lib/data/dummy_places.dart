import '../models/place.dart';

// Replace each image value with your own direct image URL.
const dummyPlaces = [
  // ---------- Temples ----------
  Place(
    id: '1',
    nameKh: 'អង្គរវត្ត',
    nameEn: 'Angkor Wat',
    province: 'Siem Reap',
    category: 'Temples',
    imageUrl: 'https://i.pinimg.com/1200x/35/f6/4f/35f64f790f59e0ce49e69665ace86614.jpg',
    rating: 4.9,
    description:
        'Angkor Wat is the largest religious monument in the world and the '
        'symbol of Cambodia. It was built in the 12th century.',
    highlights: ['Sunrise view', 'Bas-relief carvings', 'Central towers'],
  ),
  Place(
    id: '2',
    nameKh: 'ប្រាសាទបាយ័ន',
    nameEn: 'Bayon Temple',
    province: 'Siem Reap',
    category: 'Temples',
    imageUrl: 'https://i.pinimg.com/1200x/18/45/c5/1845c5e580149e6a26965206a701d7d6.jpg',
    rating: 4.8,
    description: 'Bayon is famous for its giant smiling stone faces carved on the towers.',
    highlights: ['Smiling faces', 'Stone carvings', 'Angkor Thom'],
  ),
  Place(
    id: '3',
    nameKh: 'ប្រាសាទតាព្រហ្ម',
    nameEn: 'Ta Prohm',
    province: 'Siem Reap',
    category: 'Temples',
    imageUrl: 'https://i.pinimg.com/1200x/ba/78/27/ba7827c4f0c508638ad54189d0c095a8.jpg',
    rating: 4.8,
    description:
        'Ta Prohm is known for huge tree roots growing over the stone walls, '
        'giving the temple a mysterious jungle look.',
    highlights: ['Giant tree roots', 'Jungle atmosphere', 'Photography'],
  ),
  Place(
    id: '4',
    nameKh: 'ប្រាសាទព្រះវិហារ',
    nameEn: 'Preah Vihear Temple',
    province: 'Preah Vihear',
    category: 'Temples',
    imageUrl: 'https://i.pinimg.com/1200x/18/2a/7a/182a7aa82e507fb5e06953ddabde210b.jpg',
    rating: 4.6,
    description:
        'An ancient temple on top of a cliff in the Dangrek Mountains with '
        'wide views over the plains below.',
    highlights: ['Cliff-top location', 'Mountain views', 'UNESCO site'],
  ),

  // ---------- Museums ----------
  Place(
    id: '5',
    nameKh: 'ព្រះបរមរាជវាំង',
    nameEn: 'Royal Palace',
    province: 'Phnom Penh',
    category: 'Museums',
    imageUrl: 'https://i.pinimg.com/736x/05/01/14/050114cea8aef809589d5d0a8d6ac59c.jpg',
    rating: 4.6,
    description:
        'The Royal Palace is the home of the King of Cambodia, beside the '
        'Silver Pagoda.',
    highlights: ['Silver Pagoda', 'Throne Hall', 'Royal gardens'],
  ),
  Place(
    id: '6',
    nameKh: 'សារមន្ទីរជាតិ',
    nameEn: 'National Museum',
    province: 'Phnom Penh',
    category: 'Museums',
    imageUrl: 'https://i.pinimg.com/1200x/4d/68/4b/4d684b703f7b69f9d886af86027a5b15.jpg',
    rating: 4.5,
    description:
        'The largest collection of Khmer art and history in the country, '
        'with statues and objects from the Angkor period.',
    highlights: ['Khmer sculptures', 'Courtyard garden', 'Angkor artifacts'],
  ),

  // ---------- Beaches ----------
  Place(
    id: '7',
    nameKh: 'ឆ្នេរអូត្រេស',
    nameEn: 'Otres Beach',
    province: 'Sihanoukville',
    category: 'Beaches',
    imageUrl: 'https://i.pinimg.com/1200x/0e/9a/8a/0e9a8a987492dbc3bfe06d25c861f5fc.jpg',
    rating: 4.4,
    description:
        'A quiet beach with soft sand and calm water, good for relaxing.',
    highlights: ['Sunset', 'Seafood', 'Swimming'],
  ),

  // ---------- Nature ----------
  Place(
    id: '8',
    nameKh: 'ទឹកធ្លាក់ប៊ូស្រា',
    nameEn: 'Bou Sra Waterfall',
    province: 'Mondulkiri',
    category: 'Nature',
    imageUrl: 'https://i.pinimg.com/736x/24/63/6d/24636d71bc263af5c2174584759254cf.jpg',
    rating: 4.5,
    description: 'One of the best-known waterfalls in Cambodia, surrounded by green forest.',
    highlights: ['Two-level waterfall', 'Swimming', 'Forest walk'],
  ),
  Place(
    id: '9',
    nameKh: 'បឹងយក្សឡោម',
    nameEn: 'Yeak Laom Lake',
    province: 'Ratanakiri',
    category: 'Nature',
    imageUrl: 'https://i.pinimg.com/736x/b5/30/6a/b5306a69c69e9df4da53e3c2d01be878.jpg',
    rating: 4.5,
    description:
        'A perfectly round volcanic crater lake surrounded by forest, '
        'with clear water for swimming.',
    highlights: ['Crater lake', 'Swimming', 'Local culture'],
  ),
  Place(
    id: '10',
    nameKh: 'ឧទ្យានជាតិបូកគោ',
    nameEn: 'Bokor National Park',
    province: 'Kampot',
    category: 'Nature',
    imageUrl: 'https://i.pinimg.com/1200x/b2/3c/19/b23c1988e47069c0e5bce25a8850fecd.jpg',
    rating: 4.3,
    description:
        'A mountain park with cool weather, old French-era buildings and '
        'wide views over the coast.',
    highlights: ['Old hill station', 'Mountain views', 'Cool climate'],
  ),

  // ---------- Islands ----------
  Place(
    id: '11',
    nameKh: 'កោះរ៉ុងសន្លឹម',
    nameEn: 'Koh Rong Samloem',
    province: 'Sihanoukville',
    category: 'Islands',
    imageUrl: 'https://i.pinimg.com/1200x/f3/fe/02/f3fe02a5e8c9d96b468cc0b0178b5107.jpg',
    rating: 4.7,
    description: 'A peaceful island with white sand and clear blue water.',
    highlights: ['Snorkeling', 'Bioluminescent plankton', 'Island hiking'],
  ),
  Place(
    id: '12',
    nameKh: 'កោះរ៉ុង',
    nameEn: 'Koh Rong',
    province: 'Sihanoukville',
    category: 'Islands',
    imageUrl: 'https://i.pinimg.com/736x/60/21/9c/60219c623244d9dd85c34e89ce7e747c.jpg',
    rating: 4.6,
    description:
        'Cambodia\'s best-known island, with long beaches, jungle trails '
        'and lively beach towns.',
    highlights: ['Long white beaches', 'Jungle trekking', 'Island hopping'],
  ),
];
