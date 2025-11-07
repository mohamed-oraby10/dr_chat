import 'package:new_dr_chat_application/Features/Onboarding/data/models/onboarding_model.dart';
import 'package:new_dr_chat_application/core/utils/assets_data.dart';

final  List<OnboardingModel> onboardinglist = [
      OnboardingModel(
        title: '24/7 Availiability',
        description:
            'Access Dr Chat anytime, anywhere, ensuring you always have support when you need it most',
        image: AssetsData.avialiableImage,
      ),
      OnboardingModel(
        title: 'Personalized Therapy',
        description:
            'Our Al adapts to your unique needs, providing tailored advice and coping strategies.',
        image: AssetsData.supportImage,
      ),
      OnboardingModel(
        title: 'Flexible Scheduling',
        description:
            'Access therapy whenever you need it, without the constraints of traditional appointments.',
        image: AssetsData.scheduleImage,
      ),
      OnboardingModel(
        title: 'Secure Conversations',
        description:
            'End-to-end encryption ensures your therapy sessions remain private and confidential.',
        image: AssetsData.secureImage,
      ),
      OnboardingModel(
        title: 'Cost Free Service',
        description:
            'Enjoy smart Al chatting with no cost 100% free, forever. Completely free access to all features!',
        image: AssetsData.costImage,
      ),
    ];