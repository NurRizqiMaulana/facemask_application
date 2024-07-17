import 'package:facemask_application/presentation/pages/auth/login_page.dart';
import 'package:flutter/material.dart';

import '../../data/localsources/auth_local_storage.dart';
import 'home_page.dart';

class OnboardingPage1 extends StatefulWidget {
  const OnboardingPage1({Key? key}) : super(key: key);

  @override
  State<OnboardingPage1> createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {
  @override
  void initState() {
    isLogin();
    Future.delayed(Duration(seconds: 1));
    super.initState();
  }

  void isLogin() async {
    final isTokenExist = await AuthLocalStorage().isTokenExist();
    print(isTokenExist);
    if (isTokenExist) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPagePresenter(
        pages: [
          OnboardingPageModel(
            title: 'Selamat Datang',
            description:
                'MaskcareApp adalah aplikasi yang dirancang untuk melakukan monitoring penggunaan masker guna meminimalisir penyebaran penyakit.',
            imageUrl: 'assets/images/ob1.png',
            bgColor: Colors.white,
          ),
          OnboardingPageModel(
            title: 'Fitur Deteksi & Counting',
            description:
                'Aplikasi kami menggunakan kecerdasan buatan untuk mendeteksi apakah Anda dan orang di sekitar Anda memakai masker atau tidak.',
            imageUrl: 'assets/images/ob2.png',
            bgColor: Colors.white,
          ),
          OnboardingPageModel(
            title: 'Artikel Bermanfaat untuk Kesehatan Anda',
            description:
                'Dapatkan akses ke berbagai artikel yang bermanfaat tentang pentingnya masker, cara penggunaan yang benar, dan tips kesehatan lainnya.',
            imageUrl: 'assets/images/ob3.png',
            bgColor: Colors.white,
          ),
          // OnboardingPageModel(
          //   title: 'Follow creators',
          //   description: 'Follow your favourite creators to stay in the loop.',
          //   imageUrl: 'assets/images/ob3.png',
          //   bgColor: Colors.purple,
          // ),
        ],
        onSkip: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
      ),
    );
  }
}

class OnboardingPagePresenter extends StatefulWidget {
  final List<OnboardingPageModel> pages;
  final VoidCallback? onSkip;
  final VoidCallback? onFinish;

  const OnboardingPagePresenter(
      {Key? key, required this.pages, this.onSkip, this.onFinish})
      : super(key: key);

  @override
  State<OnboardingPagePresenter> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPagePresenter> {
  // Store the currently visible page
  int _currentPage = 0;
  // Define a controller for the pageview
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: widget.pages[_currentPage].bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                // Pageview to render each page
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.pages.length,
                  onPageChanged: (idx) {
                    // Change current page when pageview changes
                    setState(() {
                      _currentPage = idx;
                    });
                  },
                  itemBuilder: (context, idx) {
                    final item = widget.pages[idx];
                    return Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(64.0),
                            child: Image.asset(
                              item.imageUrl,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  item.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: item.textColor,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 480),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 8.0),
                                child: Text(item.description,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: item.textColor,
                                        )),
                              )
                            ]))
                      ],
                    );
                  },
                ),
              ),

              // Current page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.pages
                    .map((item) => AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: _currentPage == widget.pages.indexOf(item)
                              ? 30
                              : 8,
                          height: 8,
                          margin: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10.0)),
                        ))
                    .toList(),
              ),

              // Bottom buttons
              SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                              visualDensity: VisualDensity.comfortable,
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blueAccent,
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          onPressed: widget.onSkip,
                          child: const Text("Skip")),
                      TextButton(
                        style: TextButton.styleFrom(
                            visualDensity: VisualDensity.comfortable,
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          if (_currentPage == widget.pages.length - 1) {
                            widget.onFinish?.call();
                          } else {
                            _pageController.animateToPage(_currentPage + 1,
                                curve: Curves.easeInOutCubic,
                                duration: const Duration(milliseconds: 250));
                          }
                        },
                        child: Row(
                          children: [
                            Text(
                              _currentPage == widget.pages.length - 1
                                  ? "Mulai"
                                  : "Next",
                            ),
                            const SizedBox(width: 8),
                            Icon(_currentPage == widget.pages.length - 1
                                ? Icons.done
                                : Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPageModel {
  final String title;
  final String description;
  final String imageUrl;
  final Color bgColor;
  final Color textColor;

  OnboardingPageModel(
      {required this.title,
      required this.description,
      required this.imageUrl,
      this.bgColor = Colors.blue,
      this.textColor = Colors.black});
}
