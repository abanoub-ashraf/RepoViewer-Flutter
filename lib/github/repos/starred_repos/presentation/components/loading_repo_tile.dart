import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingRepoTile extends StatelessWidget {
    const LoadingRepoTile({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Shimmer.fromColors(
            ///
            /// the main color that doesn't move
            ///
            baseColor: Colors.grey.shade400, 
            ///
            /// the color that is moving through the base color
            /// going from left to right
            ///
            highlightColor: Colors.grey.shade300,
            ///
            /// - this child is the content of the shimmer
            /// 
            /// - we want it to be only rounded square 
            ///
            child: ListTile(
                title: Align(
                    alignment: Alignment.centerLeft,
                    ///
                    /// the container must be wrapped in a parent widget so that
                    /// it can respect its constraints
                    ///
                    child: Container(
                        height: 14,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.grey,
                        ),
                    ),
                ),
                subtitle: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        height: 14,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.grey,
                        ),
                    ),
                ),
                leading: const CircleAvatar(),
                trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        const Icon(Icons.star_border),
                        Text(
                            '', 
                            style: Theme.of(context).textTheme.caption,
                        ),
                    ]
                ),
            ),
        );
    }
}