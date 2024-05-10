import 'package:converse/src/core/data/models/user_model.dart';
import 'package:converse/src/features/chat/logic/providers/chat_provider.dart';
import 'package:converse/src/shared/shared.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/foundation.dart' as foundation;

class UserInputView extends HookConsumerWidget {
  final UserModel receiver;
  const UserInputView({
    super.key,
    required this.receiver,
  });

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    final focusNode = useFocusNode();
    final chatController = useTextEditingController();
    final isEmpty = useState<bool>(false);
    final emojiOffStage = useState<bool>(true);

    void toggleShowEmoji() {
      emojiOffStage.value = !emojiOffStage.value;
    }

    return Container(
      color: theme.background,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 3.h, left: 10.w),
                child: GestureDetector(
                  onTap: () {
                    focusNode.unfocus();
                    toggleShowEmoji();
                  },
                  child: Icon(
                    Icons.emoji_emotions_outlined,
                    size: 23.h,
                    color: appColors.grey80,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(maxHeight: 100.h),
                  child: TextField(
                    focusNode: focusNode,
                    controller: chatController,
                    onTap: () {
                      emojiOffStage.value = true;
                    },
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(color: theme.outline),
                    maxLines: null,
                    // onTapOutside: (_) {
                    //   FocusScope.of(context).unfocus();
                    // },
                    onChanged: (value) {
                      isEmpty.value = chatController.text.isEmpty;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 12.w),
                      hintText: 'Message',
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(chatProvider.notifier).sendMessage(
                          receiver: receiver,
                          message: chatController.text.trim());
                      chatController.clear();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isEmpty.value
                            ? theme.primary
                            : theme.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: SvgAsset(
                        assetName: sendIcon,
                        color:
                            isEmpty.value ? theme.background : appColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Offstage(
            offstage: emojiOffStage.value,
            child: EmojiPicker(
              onEmojiSelected: (category, emoji) {},
              textEditingController: chatController,
              config: Config(
                height: 256.h,
                // bgColor: const Color(0xFFF2F2F2),
                checkPlatformCompatibility: true,
                emojiViewConfig: EmojiViewConfig(
                  emojiSizeMax: 28 *
                      (foundation.defaultTargetPlatform == TargetPlatform.iOS
                          ? 1.20
                          : 1.0),
                ),
                swapCategoryAndBottomBar: false,
                skinToneConfig: const SkinToneConfig(),
                categoryViewConfig: const CategoryViewConfig(),
                bottomActionBarConfig: const BottomActionBarConfig(
                    showBackspaceButton: false, showSearchViewButton: false),
              ),
            ),
          )
        ],
      ),
    );
  }
}
