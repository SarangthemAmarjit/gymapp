import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gymwebapp/widget/titletext.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Column(
        children: [
          SizedBox(height: 20,),
          TitleText(text: "Gallery".toUpperCase()),
               SizedBox(height: 20,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ImageSlider(imageUrls: [
                "assets/images/bg1.jpg",
                "assets/images/bg1.jpg",
                "assets/images/bg1.jpg",
                "assets/images/bg1.jpg",
                 "assets/images/bg1.jpg",
                "assets/images/bg1.jpg",
                "assets/images/bg1.jpg",
                "assets/images/bg1.jpg",
                 "assets/images/bg1.jpg",
                "assets/images/bg1.jpg",
                "assets/images/bg1.jpg",
                "assets/images/bg1.jpg",
                 "assets/images/bg1.jpg",
                "assets/images/bg1.jpg",
                "assets/images/bg1.jpg",
                "assets/images/bg1.jpg",
                ]),
            ),
          ),
        ],
      ),
    );
  }
}



class ImageSlider extends StatefulWidget {
  final List<String> imageUrls;

  const ImageSlider({
    required this.imageUrls,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:MediaQuery.sizeOf(context).width<500?2 :MediaQuery.sizeOf(context).width<700?4: MediaQuery.sizeOf(context).width<1300?6:8,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2
            
            ),

            itemCount: widget.imageUrls.length,
            itemBuilder: (context, index) {
              return ImageSliderPage(
                imageUrl: widget.imageUrls[index],
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        // SmoothPageIndicator(
        //   controller: _pageController,
        //   count: imageUrls.length,
        //   effect: WormEffect(
        //     dotColor: Colors.grey,
        //     activeDotColor: Theme.of(context).colorScheme.secondary,
        //     dotHeight: 8,
        //     dotWidth: 8,
        //     spacing: 16,
        //   ),
        // ),
       const SizedBox(height: 16),
      ],
    );
  }
}

class ImageSliderPage extends StatefulWidget {
  final String imageUrl;

  const ImageSliderPage({super.key, 
    required this.imageUrl,
  });

  @override
  State<ImageSliderPage> createState() => _ImageSliderPageState();
}

class _ImageSliderPageState extends State<ImageSliderPage> {
  bool hov = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){}
      ,
      onHover: (v){
        setState(() {
          hov = v;
        });
      },
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              widget.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: AnimatedContainer(duration: Durations.extralong1,height: hov?100:0,
                      width: double.infinity,
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                    child: Text("This is the gllery")
                    ),
                    
              ),
        ],
      ),
    );
  }
}
