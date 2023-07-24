import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'BookmarkView')
class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
