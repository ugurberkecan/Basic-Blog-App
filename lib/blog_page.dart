import 'package:blog_web/blog_scaffold.dart';
import 'package:blog_web/constrained_centre.dart';
import 'package:blog_web/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blog_post.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key, required this.blogPost}) : super(key: key);

  final BlogPost blogPost;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return BlogScaffold(
      children: [
        ConstrainedCentre(
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.profilePicture),
            radius: 54,
          ),
        ),
        const SizedBox(height: 18),
        ConstrainedCentre(
          child: SelectableText(
            user.name,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const SizedBox(height: 40),
        SelectableText(blogPost.title,
            style: Theme.of(context).textTheme.headline1),
        const SizedBox(height: 40),
        SelectableText(
          blogPost.date,
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(height: 20),
        SelectableText(
          blogPost.body,
        ),
      ],
    );
  }
}
