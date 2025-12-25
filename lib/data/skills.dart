import 'package:portfolio/core/constants/constants.dart' show LogoAssets;
import 'package:portfolio/core/model/skill.dart';

class Skills {
  Skills._();

  static const dart = Skill(
    name: 'Dart',
    icon: LogoAssets.dartLogo,
    category: SkillCategory.languages,
  );
  static const python = Skill(
    name: 'Python',
    icon: LogoAssets.pythonLogo,
    category: SkillCategory.languages,
  );
  static const java = Skill(
    name: 'Java',
    icon: LogoAssets.javaLogo,
    category: SkillCategory.languages,
  );
  static const javascript = Skill(
    name: 'JavaScript',
    icon: LogoAssets.jsLogo,
    category: SkillCategory.languages,
  );
  static const typescript = Skill(
    name: 'TypeScript',
    icon: LogoAssets.typescriptLogo,
    category: SkillCategory.languages,
  );
  static const bash = Skill(
    name: 'Bash',
    icon: LogoAssets.bashLogo,
    category: SkillCategory.languages,
  );
  static const cpp = Skill(
    name: 'C++',
    icon: LogoAssets.cppLogo,
    category: SkillCategory.languages,
  );
  static const cSharp = Skill(
    name: 'C#',
    category: SkillCategory.languages,
  );
  static const kotlin = Skill(
    name: 'Kotlin',
    category: SkillCategory.languages,
  );
  static const flutter = Skill(
    name: 'Flutter',
    icon: LogoAssets.flutterLogo,
    category: SkillCategory.frontend,
  );
  static const react = Skill(
    name: 'React',
    icon: LogoAssets.reactLogo,
    category: SkillCategory.frontend,
  );
  static const html = Skill(
    name: 'HTML',
    icon: LogoAssets.htmlLogo,
    category: SkillCategory.frontend,
  );
  static const css = Skill(
    name: 'CSS',
    icon: LogoAssets.cssLogo,
    category: SkillCategory.frontend,
  );
  static const fastapi = Skill(
    name: 'FastAPI',
    icon: LogoAssets.fastapiLogo,
    category: SkillCategory.backend,
  );
  static const nodeJs = Skill(
    name: 'Node.js',
    icon: LogoAssets.nodeJsLogo,
    category: SkillCategory.backend,
  );
  static const expressJs = Skill(
    name: 'Express.js',
    icon: LogoAssets.expressJsLogo,
    category: SkillCategory.backend,
    overrideLogoColor: true,
  );
  static const nginx = Skill(
    name: 'NGINX',
    icon: LogoAssets.nginxLogo,
    category: SkillCategory.backend,
  );
  static const graphql = Skill(
    name: 'GraphQL',
    icon: LogoAssets.graphQlLogo,
    category: SkillCategory.backend,
  );
  static const dotNet = Skill(
    name: '.NET',
    category: SkillCategory.backend,
  );
  static const firebase = Skill(
    name: 'Firebase',
    icon: LogoAssets.firebaseLogo,
    category: SkillCategory.database,
  );
  static const supabase = Skill(
    name: 'Supabase',
    icon: LogoAssets.supabaseLogo,
    category: SkillCategory.database,
  );
  static const mysql = Skill(
    name: 'MySQL',
    icon: LogoAssets.mysqlLogo,
    category: SkillCategory.database,
  );
  static const postgresql = Skill(
    name: 'PostgreSQL',
    icon: LogoAssets.psqlLogo,
    category: SkillCategory.database,
  );
  static const mongodb = Skill(
    name: 'MongoDb',
    icon: LogoAssets.mongoDbLogo,
    category: SkillCategory.database,
  );
  static const vectorDb = Skill(
    name: 'VectorDb',
    category: SkillCategory.database,
  );
  static const git = Skill(
    name: 'Git',
    icon: LogoAssets.gitLogo,
    category: SkillCategory.devops,
  );
  static const docker = Skill(
    name: 'Docker',
    icon: LogoAssets.dockerLogo,
    category: SkillCategory.devops,
  );
  static const kubernetes = Skill(
    name: 'Kubernetes',
    icon: LogoAssets.kubernetesLogo,
    category: SkillCategory.devops,
  );
  static const githubActions = Skill(
    name: 'GitHub Actions',
    icon: LogoAssets.githubActionsLogo,
    category: SkillCategory.devops,
    overrideLogoColor: true,
  );
  static const jenkins = Skill(
    name: 'Jenkins',
    icon: LogoAssets.jenkinsLogo,
    category: SkillCategory.devops,
  );
  static const ansible = Skill(
    name: 'Ansible',
    icon: LogoAssets.ansibleLogo,
    category: SkillCategory.devops,
  );
  static const prometheus = Skill(
    name: 'Prometheus',
    icon: LogoAssets.prometheusLogo,
    category: SkillCategory.devops,
  );
  static const ollama = Skill(
    name: 'Ollama',
    icon: LogoAssets.ollamaLogo,
    category: SkillCategory.mlAi,
    overrideLogoColor: true,
  );
  static const huggingface = Skill(
    name: 'HuggingFace',
    icon: LogoAssets.huggingfaceLogo,
    category: SkillCategory.mlAi,
  );
  static const langchain = Skill(
    name: 'LangChain',
    icon: LogoAssets.langchainLogo,
    category: SkillCategory.mlAi,
    overrideLogoColor: true,
  );
  static const opencv = Skill(
    name: 'OpenCV',
    icon: LogoAssets.opencvLogo,
    category: SkillCategory.mlAi,
  );
  static const tensorflow = Skill(
    name: 'TensorFlow',
    icon: LogoAssets.tensorFlowLogo,
    category: SkillCategory.mlAi,
  );
  static const llms = Skill(
    name: 'LLMs',
    category: SkillCategory.mlAi,
  );
  static const langGraph = Skill(
    name: 'LangGraph',
    category: SkillCategory.mlAi,
  );
  static const gcp = Skill(
    name: 'GCP',
    icon: LogoAssets.gcpLogo,
    category: SkillCategory.cloudTools,
  );
  static const aws = Skill(
    name: 'AWS',
    icon: LogoAssets.awsLogo,
    category: SkillCategory.cloudTools,
  );
  static const jira = Skill(
    name: 'Jira',
    icon: LogoAssets.jiraLogo,
    category: SkillCategory.cloudTools,
  );
  static const slack = Skill(
    name: 'Slack',
    icon: LogoAssets.slackLogo,
    category: SkillCategory.cloudTools,
  );
  static const arduino = Skill(
    name: 'Arduino',
    icon: LogoAssets.arduinoLogo,
    category: SkillCategory.iot,
  );
  static const raspberryPi = Skill(
    name: 'RaspberryPi',
    icon: LogoAssets.raspberryPiLogo,
    category: SkillCategory.iot,
  );
  static const esp32 = Skill(
    name: 'ESP32',
    category: SkillCategory.iot,
  );
}