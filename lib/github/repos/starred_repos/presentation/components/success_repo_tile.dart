import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/entities/github_repo/github_repo_entity.dart';

class SuccessRepoTile extends StatelessWidget {
    final GithubRepoEntity githubRepoEntity;

    const SuccessRepoTile({ 
        Key? key, 
        required this.githubRepoEntity 
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return ListTile(
            title: Text(githubRepoEntity.name),
            subtitle: Text(
                githubRepoEntity.description, 
                maxLines: 1,
                ///
                /// this adds dots at the end of the string when it's more than 1 line
                ///
                overflow: TextOverflow.ellipsis,
            ),
            leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                ///
                /// this creates an ImageProvider which loads an image from the [url], 
                /// using the [scale]. When the image fails to load [errorListener] is called.
                ///
                backgroundImage: CachedNetworkImageProvider(
                    githubRepoEntity.owner.avatarUrlSmall
                ),
            ),
            trailing: Column(
                ///
                /// to center the column content with the list tile
                ///
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    const Icon(
                        Icons.star_border,
                    ),
                    Text(
                        githubRepoEntity.stargazersCount.toString(),
                        style: Theme.of(context).textTheme.caption
                    )
                ],
            ),
            ///
            /// this is for opening the repo in a details page
            ///
            onTap: () {
                /// TODO: open the detail page
            },
        );
    }
}