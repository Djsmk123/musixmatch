import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch/core/widgets/empty_list_widget.dart';
import 'package:musixmatch/core/widgets/error_widget.dart';
import 'package:musixmatch/core/widgets/loading_widget.dart';
import 'package:musixmatch/presentation/bookmarked_screen/bloc/bookmark_bloc.dart';
import 'package:musixmatch/presentation/bookmarked_screen/widgets/list_view_builder_widget.dart';

@RoutePage(name: 'BookmarkView')
class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<BookmarkBloc>(context).add(BookmarkFetchEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Bookmarks",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<BookmarkBloc, BookmarkState>(
        builder: (context, state) {
          if (state is BookmarkLoading) {
            return const LoadingWidget();
          }
          if (state is BookmarkEmpty) {
            return const EmptyListWidget(message: "No more bookmarks found!");
          }
          if (state is BookmarkLoaded) {
            return ListViewBuilderBookmarks(
              bookmarks: state.bookmarks,
            );
          }
          if (state is BookmarkError) {
            return CustomErrorWidget(
              msg: state.message,
              hasBackOption: true,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
