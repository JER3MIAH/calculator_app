import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:converse/src/features/chat/data/models/message.dart';
import 'package:converse/src/features/theme/logic/theme_provider.dart';
import 'package:converse/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageBox extends ConsumerWidget {
  final bool isCurrentUser;
  final ChatMessage chat;
  const MessageBox({
    super.key,
    required this.isCurrentUser,
    required this.chat,
  });

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    final themeProv = ref.watch(themeProvider);

    return Row(
      mainAxisAlignment:
          isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        chat.messageType == kTextType
            ? Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .8,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  margin:
                      EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 5.h),
                  decoration: BoxDecoration(
                    color: isCurrentUser
                        ? theme.primaryContainer
                        : themeProv.isDarkMode
                            ? theme.primary
                            : theme.background,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    chat.message,
                    style: TextStyle(
                        color: !isCurrentUser && !themeProv.isDarkMode
                            ? null
                            : appColors.white),
                  ),
                ),
              )
            : OpenContainer(
                closedElevation: 0,
                openElevation: 0,
                openColor: appColors.black,
                closedColor: theme.onBackground,
                closedBuilder: (context, action) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.w)
                        .copyWith(top: 5.h),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        height: 150.h,
                        width: 200.w,
                        imageUrl: chat.message,
                        fit: BoxFit.fitWidth,
                        placeholder: (_, __) => ShimmerWidget(
                          child: Container(
                            decoration: BoxDecoration(
                              color: appColors.coolGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 150.h,
                            width: 200.w,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                openBuilder: (context, action) {
                  return _buildViewImage();
                },
              )
      ],
    );
  }

  Widget _buildViewImage() {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          isCurrentUser ? 'You' : chat.sender.username,
          style: TextStyle(color: appColors.white),
        ),
        leading: BackButton(
          color: appColors.white,
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          child: CachedNetworkImage(
            imageUrl: chat.message,
            fit: BoxFit.fitWidth,
            placeholder: (_, __) => ShimmerWidget(
              child: Container(
                decoration: BoxDecoration(
                  color: appColors.coolGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 150.h,
                width: 200.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
