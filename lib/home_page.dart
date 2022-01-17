import 'package:blog_web/blog_post.dart';
import 'package:blog_web/blog_scaffold.dart';
import 'package:blog_web/constrained_centre.dart';
import 'package:blog_web/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'blog_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<BlogPost>>(context);
    final user = Provider.of<User>(context);
    return BlogScaffold(
      children: [
        ConstrainedCentre(
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.profilePicture),
            radius: 72,
          ),
        ),
        const SizedBox(height: 18),
        ConstrainedCentre(
          child: SelectableText(
            user.name,
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
        for (var post in posts)
          BlogListTile(
            post: post,
          ),
      ],
    );
  }
}

class BlogListTile extends StatelessWidget {
  const BlogListTile({Key? key, required this.post}) : super(key: key);
  final BlogPost post;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        InkWell(
          child: Text(
            post.title,
            style: const TextStyle(color: Colors.blueAccent),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return BlogPage(blogPost: post);
                },
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        SelectableText(
          post.date,
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}
