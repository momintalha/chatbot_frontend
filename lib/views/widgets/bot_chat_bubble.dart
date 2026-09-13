import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

class BotChatBubble extends StatelessWidget {
  final String reply;
  final bool isBot;
  const BotChatBubble(this.reply, this.isBot, {super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.0),
        child: GptMarkdown(
          reply,
          isStreaming: true,
          animation: GptMarkdownAnimation.fade,
          charactersPerSecond: 300,
          codeBuilder: (context, name, code, closed) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: HighlightView(
                code,
                language: 'cpp',
                theme: atomOneLightTheme,
                textStyle: TextStyle(
                  fontFamily: 'GoogleSansCode',
                  fontSize: 16,
                ),
              ),
            );
          },
          style: TextStyle(fontFamily: 'GoogleSans', fontSize: 14),
          styleSheet: GptMarkdownStyleSheet(
            heading: HeadingStyle(
              textStyle: TextStyle(
                letterSpacing: -0.5,
                fontFamily: 'GoogleSans',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              padding: EdgeInsets.only(top: 8, bottom: 4),
              showDivider: false,
            ),
            codeBlock: CodeBlockStyle(
              backgroundColor: Colors.black12,
              borderRadius: Radius.circular(12),
              borderColor: Colors.black12,
              padding: EdgeInsets.all(10),
              showLanguageLabel: true,
              showCopyButton: true,
            ),
            blockQuote: BlockQuoteStyle(
              barWidth: 4,
              barColor: Color(0xFF6366F1),
              barRadius: Radius.circular(2),
              backgroundColor: Color(0x0A6366F1),
              padding: EdgeInsetsDirectional.only(start: 12, top: 8, bottom: 8),
              margin: EdgeInsets.symmetric(vertical: 8),
              textStyle: TextStyle(fontStyle: FontStyle.italic),
            ),
            latex: LatexStyle(
              scrollBlockHorizontally: true,
              padding: EdgeInsets.symmetric(vertical: 8),
              backgroundColor: Color(0x08000000),
              borderRadius: Radius.circular(6),
            ),
            inlineCode: InlineCodeStyle(
              fontFamily: 'GoogleSansCode',
              backgroundColor: const Color(0x14656D76),
              borderColor: Colors.transparent,
              borderRadius: const Radius.circular(6),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            ),
            table: TableStyle(
              borderColor: Color(0x1F000000),
              borderWidth: 1,
              borderRadius: Radius.circular(8),
              cellPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              headerBackground: Color(0x0A000000),
              headerTextStyle: TextStyle(fontWeight: FontWeight.w600),
            ),
            list: ListStyle(
              bulletSize: 5,
              bulletColor: Colors.black,
              bulletShape: BoxShape.rectangle,
              indent: 12,
              gapAfterMarker: 12,
              markerTextStyle: TextStyle(fontWeight: FontWeight.w600),
            ),
            link: LinkStyle(
              color: Color(0xFF0B57D0),
              hoverColor: Color(0xFF0842A0),
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w500,
            ),
            checkbox: CheckboxStyle(
              size: 18,
              checkedColor: Colors.green,
              borderRadius: Radius.circular(4),
              gapAfterBox: 8,
            ),
            hr: HrStyle(
              thickness: 1,
              color: Color(0x1F000000),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ),
    );
  }
}
