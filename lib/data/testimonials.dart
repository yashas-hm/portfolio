import 'package:portfolio/model/testimonial.dart';

class Testimonials {
  Testimonials._();

  static final List<Testimonial> all = [practiceBuzz, ecoConsumer];

  static final practiceBuzz = Testimonial(
    name: 'Deepak Datta',
    designation: 'CEO @ PracticeBuzz',
    message:
        'Yashas\'s contributions as a Senior Software Engineer at PracticeBuzz '
        'are outstanding. His role in developing the DentaVacation app '
        'showcased technical prowess, innovative design, and a commitment to '
        'security. His adaptability, collaboration, and pursuit of '
        'excellence are commendable.',
  );

  static final ecoConsumer = Testimonial(
    name: 'Manjunath Jakkur Munigowda',
    designation: 'Director @ EcoConsumer Solutions Pvt. Ltd.',
    message:
        'Yashas\'s time as a Flutter Developer Intern was marked by exceptional '
        'skill and dedication. His problem-solving abilities and '
        'innovative solutions significantly enhanced our mobile app '
        'development. His commitment to excellence, coupled with his '
        'teamwork and communication skills, made him an invaluable asset. '
        'I highly recommend him for any role requiring a skilled software '
        'developer.',
  );
}