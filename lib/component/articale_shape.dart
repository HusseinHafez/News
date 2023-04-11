// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/size_config.dart';
import 'package:news/web_view_screen/view/web_view_screen.dart';

import '../app_cubit/cubit.dart';

class ArticaleShape extends StatelessWidget {
  final Map map;
  
   const ArticaleShape({
    super.key,
    required this.map,
    
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(url: map['url']),
          )),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: getWidth(120),
              height: getHeight(120),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                imageUrl: map['urlToImage'] ?? '',
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: AppCubit.getInstance(context).isLight
                            ? Colors.black
                            : Colors.white,
                      ),
                      SizedBox(
                        height: getHeight(15),
                      ),
                      Text(
                        'No Image Provided',
                        style: TextStyle(
                          color: AppCubit.getInstance(context).isLight
                              ? Colors.black
                              : Colors.white,
                              fontSize: getFont(16)
                        ),
                      )
                    ],
                  ),
                ),
                progressIndicatorBuilder: (context, url, progress) =>  const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ),
            SizedBox(
              width: getWidth(15),
            ),
            Expanded(
              child: SizedBox(
                height: getHeight(120),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        map['title'],
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                      ),
                    ),
                    Text(
                      map['publishedAt'],
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
