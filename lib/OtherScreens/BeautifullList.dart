import 'package:flutter/material.dart';

class BeautifulListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String reference;
  final IconData icon;
  final int grad;
  final VoidCallback onTap;

  const BeautifulListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.reference,
    this.icon = Icons.info_outline,
    required this.onTap,
    required this.grad,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: theme.cardColor, // Adapts to theme
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.1),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: Icon(
          icon,
          color: colorScheme.primary, // Themed icon color
          size: 30.0,
        ),
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.textTheme.bodySmall?.color?.withOpacity(0.75),
            ),
          ),
        ),
        trailing: Text(
          reference,
          style: theme.textTheme.labelSmall?.copyWith(
            fontStyle: FontStyle.italic,
            color: colorScheme.secondary,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
