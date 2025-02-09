// import 'package:uuid/uuid.dart';

// enum NewsCategory {
//   business,
//   education,
//   fashion,
//   travel,
//   sport,
// }

// const Uuid uuid = Uuid();

// class News {
//   String id;
//   String title;
//   String imageUrl;
//   String? author;
//   String? newsRedaction;
//   String description;
//   NewsCategory newsCategory;

//   News({
//     String? id,
//     required this.title,
//     required this.imageUrl,
//     this.author,
//     this.newsRedaction,
//     required this.description,
//     required this.newsCategory,
//   }) : id = id ?? uuid.v4();
// }

// var newsList = [
//   News(
//     title: "Fusion of Retro Glamour and Futuristic Trends.",
//     imageUrl: "https://picsum.photos/id/232/300/400",
//     author: "Alexa Virgie",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pulvinar ac lorem ac eleifend. Fusce imperdiet nunc id condimentum luctus. Curabitur eu iaculis sapien, eget elementum nibh. Etiam elementum turpis dolor, et ornare nulla maximus quis. Donec sem libero, pulvinar vel sapien eget, dapibus commodo justo. Integer a vestibulum odio, non mollis odio. Integer consequat nec risus et aliquet. Nam ultricies accumsan aliquam. Nam dui odio, lacinia id blandit ac, fringilla quis arcu. Donec felis tortor, feugiat non odio et, volutpat accumsan neque.",
//     newsCategory: NewsCategory.fashion,
//   ),
//   News(
//     title: "Yosemite Climbing Boom",
//     imageUrl: "https://picsum.photos/id/235/200/300",
//     author: "Ava Louise",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pulvinar ac lorem ac eleifend. Fusce imperdiet nunc id condimentum luctus. Curabitur eu iaculis sapien, eget elementum nibh. Etiam elementum turpis dolor, et ornare nulla maximus quis. Donec sem libero, pulvinar vel sapien eget, dapibus commodo justo. Integer a vestibulum odio, non mollis odio. Integer consequat nec risus et aliquet. Nam ultricies accumsan aliquam. Nam dui odio, lacinia id blandit ac, fringilla quis arcu. Donec felis tortor, feugiat non odio et, volutpat accumsan neque.",
//     newsCategory: NewsCategory.sport,
//   ),
//   News(
//     title: "Classic Earings Reign Supreme",
//     imageUrl: "https://picsum.photos/id/236/200/300",
//     author: "Jesse Clinton",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pulvinar ac lorem ac eleifend. Fusce imperdiet nunc id condimentum luctus. Curabitur eu iaculis sapien, eget elementum nibh. Etiam elementum turpis dolor, et ornare nulla maximus quis. Donec sem libero, pulvinar vel sapien eget, dapibus commodo justo. Integer a vestibulum odio, non mollis odio. Integer consequat nec risus et aliquet. Nam ultricies accumsan aliquam. Nam dui odio, lacinia id blandit ac, fringilla quis arcu. Donec felis tortor, feugiat non odio et, volutpat accumsan neque.",
//     newsCategory: NewsCategory.fashion,
//   ),
//   News(
//     title: "Style Trends Set in Tokyo",
//     imageUrl: "https://picsum.photos/id/234/200/300",
//     author: "Noah Samuel",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pulvinar ac lorem ac eleifend. Fusce imperdiet nunc id condimentum luctus. Curabitur eu iaculis sapien, eget elementum nibh. Etiam elementum turpis dolor, et ornare nulla maximus quis. Donec sem libero, pulvinar vel sapien eget, dapibus commodo justo. Integer a vestibulum odio, non mollis odio. Integer consequat nec risus et aliquet. Nam ultricies accumsan aliquam. Nam dui odio, lacinia id blandit ac, fringilla quis arcu. Donec felis tortor, feugiat non odio et, volutpat accumsan neque.",
//     newsCategory: NewsCategory.fashion,
//   ),
// ];
