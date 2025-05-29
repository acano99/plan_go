import 'package:flutter/material.dart';
import 'package:plan_go/src/data/models/consultation.dart';
import 'package:plan_go/src/data/models/plan.dart';
import 'package:plan_go/src/data/models/sms.dart';
import 'package:plan_go/src/data/models/voice.dart';

class VoiceTile extends StatelessWidget {
  const VoiceTile({super.key, required this.voice, required this.onTap});

  final Voice voice;
  final Function(String value) onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () => onTap(voice.ussd),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              spacing: 24,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        voice.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        padding: EdgeInsetsDirectional.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.secondaryContainer,
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                        child: Text(
                          voice.price,
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            color: colorScheme.onSecondaryContainer,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: Image.asset(
                    voice.image,
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
