import 'package:blog_web/constrained_centre.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 612,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ConstrainedCentre(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/42906958?v=4'),
                  radius: 72,
                ),
              ),
              const SizedBox(height: 18),
              ConstrainedCentre(
                child: SelectableText(
                  'Flutter Dev',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const SizedBox(height: 40),
              ConstrainedCentre(
                child: SelectableText(
                  "Hello, I'm Ugur. I'm a flutter developer.",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 40),
              SelectableText(
                'Blog',
                style: Theme.of(context).textTheme.headline2,
              ),
              const BlogListTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class BlogListTile extends StatelessWidget {
  const BlogListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blogTitle = Provider.of<String>(context);
    final date = Provider.of<DateTime>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        InkWell(
          child: Text(
            blogTitle,
            style: const TextStyle(color: Colors.blueAccent),
          ),
          onTap: () {},
        ),
        const SizedBox(height: 10),
        SelectableText(
          DateFormat('d MMMM y').format(date),
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}
