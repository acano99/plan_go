import 'package:flutter/material.dart';
import 'package:plan_go/src/data/models/consultation.dart';
import 'package:plan_go/src/data/models/data_plan.dart';
import 'package:plan_go/src/data/models/plan.dart';

class DataPlanTile extends StatelessWidget {
  const DataPlanTile({super.key, required this.dataPlan, required this.onTap});

  final DataPlan dataPlan;
  final Function(String value) onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final label = (dataPlan.voice.isNotEmpty && dataPlan.sms.isNotEmpty)
        ? '${dataPlan.voice}, ${dataPlan.sms}, 300MB nacionales'
        : '300MB nacionales';

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () => onTap(dataPlan.ussd),
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
                        dataPlan.name,
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        label,
                        style: textTheme.labelSmall?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
                          dataPlan.price,
                          style: textTheme.labelSmall?.copyWith(
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
                    dataPlan.image,
                    width: 120,
                    height: 110,
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
