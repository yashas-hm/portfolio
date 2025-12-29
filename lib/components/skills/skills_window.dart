part of 'skills_component.dart';

class SkillsWindow extends StatelessWidget {
  const SkillsWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowContainer(
      headlineIcon: FontAwesomeIcons.solidFolder,
      headline: '~/portfolio/skills',
      bottomText: 'Stack Initialized Successfully.',
      content: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        runAlignment: WrapAlignment.spaceEvenly,
        runSpacing: Sizes.spacingLarge,
        spacing: Sizes.spacingLarge,
        children: SkillGroups.all
            .map((skillGroup) => SkillItem(
                  skillGroup: skillGroup,
                ))
            .toList(),
      ),
    );
  }
}
