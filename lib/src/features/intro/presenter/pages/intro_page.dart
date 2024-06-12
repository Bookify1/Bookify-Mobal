import 'package:bookify/src/core/router/app_rout_enum.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/features/intro/presenter/components/button.dart';
import 'package:bookify/src/features/intro/presenter/components/indicator.dart';
import 'package:bookify/src/features/intro/presenter/components/slide.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  void refresh() async {
    AppRouteEnum currentPath = AppRouteEnum.welcome;
    String routePath = currentPath.name;
    context.push(routePath);
  }

  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/svgs/book_lover.svg',
    'assets/svgs/booked.svg',
    'assets/svgs/bookshelves.svg'
  ];

  final titles = ['Descubra', 'Planeje', 'Conheça'];
  final labels = [
    'Desfrute do conhecimento de maneira gratuita, com a facilidade de descubrir novas histórias.',
    'Gerencie suas leituras de forma eficiente, agendando retiradas, acompanhando disponibilidade e prazos, tudo em um só lugar.',
    'Navegue pelas prateleiras virtuais das bibliotecas públicas, deixe-se envolver por novas narrativas e autores inspiradores.'
  ];

  Function()? refreshButton() {
    if (activeIndex == urlImages.length - 1) {
      return () => refresh();
    } else {
      return () {
        controller.nextPage();
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Column(
            children: [
              CarouselSlider.builder(
                carouselController: controller,
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages[index];
                  final title = titles[index];
                  final label = labels[index];
                  return CustomContainer(
                    urlImage: urlImage,
                    title: title,
                    label: label,
                  );
                },
                options: CarouselOptions(
                  height: 0.7.sh,
                  viewportFraction: 1,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  enlargeCenterPage: false,
                  padEnds: false,
                  clipBehavior: Clip.none,
                  onPageChanged: (index, reason) => setState(
                    () => activeIndex = index,
                  ),
                ),
              ),
              IndicatorWidget(
                activeIndex: activeIndex,
                urlImages: urlImages,
                controller: controller,
                context: context,
              )
            ],
          ),
          SizedBox(height: .1.sh),
          ContinueButton(
            activeIndex: activeIndex,
            urlImages: urlImages,
            refresh: refreshButton,
          ),
        ],
      ),
    );
  }
}
