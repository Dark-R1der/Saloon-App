class AboutUs {
  final String description;

  AboutUs({
    required this.description
  });
}

final String descriptionDetails = AboutUs(description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur auctor aliquam est, '
      'a sollicitudin turpis varius vel. Sed feugiat vitae sapien at volutpat. '
      'Pellentesque vel sapien nec lacus lacinia vulputate. '
      'Cras euismod aliquet lacus. ').description;

final Map<String, String> workingHours = {
  'Monday': '00:00 - 00:00',
  'Tuesday': '00:00 - 00:00',
  'Wednesday': '00:00 - 00:00',
  'Thursday': '00:00 - 00:00',
  'Friday': '00:00 - 00:00',
  'Saturday': '00:00 - 00:00',
  'Sunday': '00:00 - 00:00',
};
