import 'package:flutter/material.dart';

class ModernSliverAppBar extends StatefulWidget {
  final Brightness brightness;
  final VoidCallback toggleTheme;

  const ModernSliverAppBar({
    super.key,
    required this.brightness,
    required this.toggleTheme,
  });

  @override
  State<ModernSliverAppBar> createState() => _ModernSliverAppBarState();
}

class _ModernSliverAppBarState extends State<ModernSliverAppBar> {
  final List<String> imagePaths = [
    "assets/SarkarPicture/10.jpg",
    "assets/SarkarPicture/11.jpg",
    "assets/SarkarPicture/12.jpg",
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverAppBar(
      actions: [
        IconButton(
          icon: Icon(
            widget.brightness == Brightness.dark
                ? Icons.light_mode
                : Icons.dark_mode,
          ),
          onPressed: widget.toggleTheme,
        ),
      ],
      collapsedHeight: kToolbarHeight,
      expandedHeight: 460,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
        collapseMode: CollapseMode.parallax,
        title: Text(
          "Riaz Ahmed Gohar Shahi",
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        expandedTitleScale: 1.2,
        titlePadding: const EdgeInsets.only(bottom: 14),
        centerTitle: true,
        background: Stack(
          fit: StackFit.expand,
          children: [
            // PageView for image carousel
            PageView.builder(
              controller: _pageController,
              itemCount: imagePaths.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                return Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                );
              },
            ),

            // Dark gradient overlay
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black87],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),

            // Page indicators
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(imagePaths.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 12 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.white
                          : Colors.white54,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _controller = PageController();
  int _current = 0;
  final List<String> images = [
    "assets/SarkarPicture/10.jpg",
    "assets/SarkarPicture/11.jpeg",
    "assets/SarkarPicture/12.jpeg",
   
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: images.length,
          onPageChanged: (index) => setState(() => _current = index),
          itemBuilder: (context, index) => Image.asset(
            images[index],
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black54],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _current == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _current == index ? Colors.white : Colors.white54,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
