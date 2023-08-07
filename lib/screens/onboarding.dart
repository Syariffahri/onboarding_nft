// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_nft/utils/utils.dart';

import 'widgets/page_intro.dart';
import 'widgets/page_template.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  int _currentPage = 0;
  bool isDisposed = false;
  final PageController _pageController = PageController(initialPage: 0);

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController();
  }

  void _animationController() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 870, end: 850).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
            if (_currentPage == 1) {
              if (!isDisposed) {
                _controller.dispose();
                isDisposed = true;
              }
            } else if (_currentPage == 0) {
              _animationController();
            }
          });
        },
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return pageIntro(
                context,
                starsWidth: _animation.value,
                starsHeight: _animation.value,
              );
            },
          ),
          pageTemplate(
            context,
            title: 'Self and Collect Awesome NFT',
            description:
                'Lorem Ipsum is simply dummy\ntext of the printing and\ntypesetting industry.',
            image: 'background01.png',
          ),
          pageTemplate(
            context,
            title: 'Track and watchlist your porto',
            description:
                'Lorem Ipsum is simply dummy\ntext of the printing and\ntypesetting industry.',
            image: 'background02.png',
            imageHeight: MediaQuery.sizeOf(context).height * 0.5,
            isTransform: true,
          ),
          pageTemplate(
            context,
            title: 'Connect\nwallet',
            description:
                'Lorem Ipsum is simply dummy\ntext of the printing and\ntypesetting industry.',
            image: 'background03.png',
            isTransform: true,
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: getWidth(context) - 60,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0.6),
                    ],
                    stops: const [0.3, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.grey[500],
                ),
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: _currentPage == 3
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          _currentPage == 0
                              ? 'Lets Go'
                              : _currentPage == 1
                                  ? "What's next ?"
                                  : _currentPage == 2
                                      ? 'Got it ?'
                                      : 'Get Started',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: _currentPage == 3
                            ? Colors.transparent
                            : Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(4, _buildDot),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // _currentPage != 2 ? : Text('')
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(right: 5),
      height: 4,
      width: _currentPage == index ? 50 : 30,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? Utils.indicatorColor
            : Utils.indicatorColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
